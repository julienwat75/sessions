class CreateOffres < ActiveRecord::Migration
  def change
    create_table :offres do |t|
      t.string :titre
      t.text :description
      t.string :nom_restaurant
      t.text :photo
      t.string :auteur
      t.float :prix_medium
      t.float :prix_large
      t.references :profil, index: true
      t.timestamps
    end
  end
end
