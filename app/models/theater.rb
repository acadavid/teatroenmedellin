class Theater < ActiveRecord::Base
  has_many :venues, dependent: :destroy, inverse_of: :theater
  has_many :acts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :venues
end
