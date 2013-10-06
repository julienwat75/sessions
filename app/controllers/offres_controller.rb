class OffresController < ApplicationController


before_filter :zero_authors_or_authenticated, except: [:index]	



def zero_authors_or_authenticated
  unless Author.count == 0 || current_user
    redirect_to login_path
    return false
  end
end



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

  @current_user=current_user
  

  @offres = Offre.new(profil_params)
  @offres.nom_restaurant = params[:offre][:nom_restaurant]  # on reccupere le nom du form
  @offres.titre = params[:offre][:titre]  # on reccupere le nom du form
  @offres.description = params[:offre][:description] # on reccupere le body du form 
  @offres.prix_medium = params[:offre][:prix_medium]  # on reccupere le nom du form
  @offres.prix_large = params[:offre][:prix_large]  # on reccupere le
  @offres.photo = params[:offre][:photo] 
  @offres.author_id =current_user.id
   @offres.nom_author = current_user.username
  @offres.save   #on sauvegarde
   redirect_to offres_path     # redirection vers l'index

end

def profil_params
    params.require(:offre).permit( :nom_restaurant,:titre, :description, :prix_medium, :prix_large, :photo)
  end




end
