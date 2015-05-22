class User < ActiveRecord::Base
  has_many :stories

  validates :user_name, :password, 
            presence: true, length: { minimum: 5 } 
end