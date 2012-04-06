class Venue < ActiveRecord::Base

  belongs_to :theater

  validates :name, :theater_id, presence: true
end
