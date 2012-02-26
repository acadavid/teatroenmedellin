class Theater < ActiveRecord::Base

  has_many :venues, :dependent => :destroy

end
