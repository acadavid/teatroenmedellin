class Theater < ActiveRecord::Base

  has_many :venues, dependent: :destroy

  validates :name, presence: true
end
