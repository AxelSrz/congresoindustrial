class Visit < ActiveRecord::Base
  has_many :atendees
  scope :available, -> { where("cupo_actual > ?", 0) }
end
