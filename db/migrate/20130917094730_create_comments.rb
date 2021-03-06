class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :body
      t.references :profil, index: true
       t.references :author, index: true

      t.timestamps
    end
  end
end
