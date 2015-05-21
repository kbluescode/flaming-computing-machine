class Upvote < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :user_id, :story_id,
            presence: true
end