class Scene < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :content, :choice1_text, :scene1_id, :choice2_text, :scene2_id,
            presence: true
end