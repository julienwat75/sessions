class OffresController < ApplicationController


def index

 @offres=Offre.all 


end


def show

 
 @offres = Offre.find(params[:id]) #reccupere l'id de l url

end


def new
  @offres = Offre.new
  
end

def create              # le submit va chercher la methode create
  

  @offres = Offre.new(profil_params)
  @offres.titre = params[:offre][:titre]  # on reccupere le nom du form
  @offres.description = params[:offre][:description] # on reccupere le body du form 
  @offres.profil_id ="8"
  @offres.save   #on sauvegarde
   redirect_to offres_path     # redirection vers l'index

end

def profil_params
    params.require(:offre).permit(:titre, :description)
  end




end
