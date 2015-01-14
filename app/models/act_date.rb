class ActDate < ActiveRecord::Base

  belongs_to :act

  validates :date, presence: true

  scope :when, -> (date) { where("date BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day) }

end
