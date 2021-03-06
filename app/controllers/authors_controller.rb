class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  before_filter :zero_authors_or_authenticated, only: [:new, :create]

  before_filter :no_sessions, only: [:show]


def zero_authors_or_authenticated
  if current_user
    redirect_to root_path
    return false
  end
end

def no_sessions
  unless Author.count == 0 || current_user
    redirect_to login_path
    return false
  end
end

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show

    @authors = Author.find(params[:id]) #reccupere l'id de l url
   @comment = Comment.new
  @comment.author_id = @authors.id   # On initialise l'element "profil_id" de l objet "comment" avec l'id du profil
  #@username=current_user.email
  @current_user=current_user

     
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
   
def create              # le submit va chercher la methode create
  @authors = Author.new(author_params)
  @authors.username = params[:author][:username]  # on reccupere le nom du form
  @authors.email = params[:author][:email] # on reccupere le body du form 
  @authors.password = params[:author][:password] # on reccupere le body du form 
  @authors.password_confirmation = params[:author][:password_confirmation] # on reccupere le body du form 
  
  @authors.save   #on sauvegarde
   redirect_to authors_path     # redirection vers l'index

end




  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:username, :email, :password, :password_confirmation)
    end


end
