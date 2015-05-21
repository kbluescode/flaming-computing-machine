class Story < ActiveRecord::Base
  has_many :scenes
  has_many :upvotes
  belongs_to :user

  validates :description, presence: true
  validates :total_upvotes, numericality: { only_integers: true }
end