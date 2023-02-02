class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  #validates :title,:category, presence: true
  #validates :description, presence: true, length: { minimum: 50 }

end
