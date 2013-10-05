class CommentsController < ApplicationController

def create              # le submit va chercher la methode create
  @comments = Comment.new(comment_params)
 # @comments.profil_id = params[:profil_id] 
   @comments.author_id = params[:author_id]


  
  @comments.save   #on sauvegarde
   redirect_to author_path(@comments.author_id)     # redirection vers le show du profil

end

def comment_params
    params.require(:comment).permit(:author_name, :body)
  end



end
