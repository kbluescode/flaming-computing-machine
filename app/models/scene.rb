class Scene < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  belongs_to :scene1, class_name: 'Scene'
  belongs_to :scene2, class_name: 'Scene'

  has_many :scenes

  validates :content,
            presence: true

  validates :choice1_text, :choice2_text,
            presence: true,
            length: { maximum: 140 }

  before_save :clean_html

  private
  def clean_html
    self.content = Sanitize.clean(content, Sanitize::Config::RESTRICTED)
    self.choice1_text = Sanitize.clean(choice1_text, Sanitize::Config::RESTRICTED)
    self.choice2_text = Sanitize.clean(choice2_text, Sanitize::Config::RESTRICTED)
  end 
end
