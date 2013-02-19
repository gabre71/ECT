class TimeFrame < ActiveRecord::Base
  belongs_to :work_site
  has_many :planned_work_times
  attr_accessible :from_time, :name, :to_time, :cc_start_time, :cc_end_time, :work_site_id, :inactive
end
