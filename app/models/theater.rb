class Theater < ActiveRecord::Base

  has_many :venues, dependent: :destroy
  has_many :acts, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :venues
end
