class User < ActiveRecord::Base
  has_many :stories
  has_many :scenes
  has_many :upvotes
end