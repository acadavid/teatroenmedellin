class ActDate < ActiveRecord::Base

  belongs_to :act

 validates :date, presence: true

end
