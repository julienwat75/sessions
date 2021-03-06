class CreateOffres < ActiveRecord::Migration
  def change
    create_table :offres do |t|
      t.string :titre
      t.text :description
      t.string :nom_restaurant
      t.text :photo
      t.string :nom_author
      t.float :prix_medium
      t.float :prix_large
      t.references :profil, index: true
      t.references :author, index: true
      t.timestamps
    end
  end
end
