class Suggestion < ActiveRecord::Base
  validates :noun,
            presence: true
end
