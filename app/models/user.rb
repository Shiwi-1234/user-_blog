class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_and_belongs_to_many :categories        
  validates :name, :surname ,:password, presence: {message:"can't be blank"}
  validates :email , presence: {message:"can't be blank"}
end
