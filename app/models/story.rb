class Story < ActiveRecord::Base
  has_many :scenes
  has_many :upvotes
  belongs_to :user
end