class Act < ActiveRecord::Base

  belongs_to :theater
  belongs_to :venue
 
  validates :name, :theater_id, :date, presence: true
end
