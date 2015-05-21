class User < ActiveRecord::Base
  has_many :stories
  has_many :scenes
  has_many :upvotes

  validates :user_name, :email, :password, 
            presence: true, length: { minimum: 5 } 
end