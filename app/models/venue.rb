class Venue < ActiveRecord::Base

  belongs_to :theater, inverse_of: :venues

  validates :name, presence: true
  validates :theater, presence: true
end
