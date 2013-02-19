
class TimeSheet < ActiveRecord::Base
  before_save :user_is_late
  belongs_to :user
  belongs_to :planned_work_time
  belongs_to :planned_holiday
  belongs_to :work_site
  belongs_to :time_frame
  belongs_to :work_time_type
  attr_accessible :end_time, :start_time,:cc_end_time, :cc_start_time
  attr_accessible :planned_work_time, :planned_holiday
  attr_accessible :lateness,  :work_date, :user_id, :time_frame_id, :work_site_id, :work_time_type_id, :planned_holiday_id

  def user_is_late
  	if self.start_time
	  	if (self.start_time.hour*60+self.start_time.min - self.time_frame.from_time.hour*60-self.time_frame.from_time.min) >15 && !self.holiday
	  		self.lateness  = 1
	  	else
	  		self.lateness  = 0
	  	end
	  end
  # 	if self.holiday 
		# 	self.start_time = ""
		# 	self.end_time = ""
		# end
  end
end
