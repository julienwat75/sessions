class Tag < ActiveRecord::Base



has_many :taggings

has_many :profils, through: :taggings

  


end
