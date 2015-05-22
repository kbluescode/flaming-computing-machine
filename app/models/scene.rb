class Scene < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  belongs_to :scene1, class_name: 'Scene'
  belongs_to :scene2, class_name: 'Scene'

  has_many :scenes

  validates :content, :choice1_text, :choice2_text, 
            presence: true
end