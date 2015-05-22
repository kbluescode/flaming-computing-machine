class Scene < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :content, :choice1_text, :choice2_text, 
            presence: true
end