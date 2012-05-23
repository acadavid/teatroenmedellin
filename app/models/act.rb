class Act < ActiveRecord::Base

  belongs_to :theater
  belongs_to :venue
 
  validates :name, :theater_id, presence: true

  has_many :act_dates

  accepts_nested_attributes_for :act_dates
end
