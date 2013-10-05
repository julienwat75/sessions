class Comment < ActiveRecord::Base
  belongs_to :profil
  belongs_to :author
end
