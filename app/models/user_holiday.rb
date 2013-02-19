class UserHoliday < ActiveRecord::Base
  belongs_to :user
  attr_accessible :holidays, :year
end
