class Act < ActiveRecord::Base

  belongs_to :theater
  belongs_to :venue
 
  validates :name, :theater_id, presence: true

  has_many :act_date
end
