class ProfilsController < ApplicationController

def index
  @profils = Profil.all
end


def new
  @profils = Profil.new
  
end


def show
  @profils = Profil.find(params[:id]) #reccupere l'id de l url
   @comment = Comment.new
  @comment.profil_id = @profils.id   # On initialise l'element "profil_id" de l objet "comment" avec l'id du profil

end

def edit
  @profils = Profil.find(params[:id]) #reccupere l'id de l url

end

def update
  @profils = Profil.find(params[:id])
  @profils.update(profil_params)

  redirect_to profils_path
end

def create              # le submit va chercher la methode create
  @profils = Profil.new(profil_params)
  @profils.nom = params[:profil][:nom]  # on reccupere le nom du form
  @profils.body = params[:profil][:body] # on reccupere le body du form 
  @profils.save   #on sauvegarde
   redirect_to profils_path     # redirection vers l'index

end



def destroy

@profils = Profil.find(params[:id]).destroy  #reccupere l'id de l url

redirect_to profils_path
end

 def profil_params
    params.require(:profil).permit(:nom, :body)
  end




end
