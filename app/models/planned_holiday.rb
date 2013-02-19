class PlannedHoliday < ActiveRecord::Base
	
	include AASM

  after_save :update_time_sheets
  after_destroy :delete_time_sheet_work_items
  after_save :calculate_holidays

  belongs_to :user
  belongs_to :holiday_type, :class_name => "WorkTimeType"
  belongs_to :approver, :class_name=> "User"

  has_many :time_sheets 

  attr_accessible :term_end, :term_start, :user_id, :approver_id, :holiday_type_id, :status

  aasm :column => :status do
  	state :planned, :initial => true
  	state :requested
  	state :accepted
  	state :rejected
  	state :withdrawn

    event :accept do 
      transitions :to => :accepted , :from => [:requested, :rejected]
    end

    event :reject do 
      transitions :to => :rejected , :from => [:requested,:accepted] 
    end

    event :accept_withdraw do 
      transitions :to => :planned , :from => [:withdrawn]
    end

    event :reject_withdraw do 
      transitions :to => :accepted , :from => [:withdrawn]
    end

		event :withdraw do 
      transitions :to => :withdrawn , :from => [:accepted]
  	end
    event :cancel do 
      transitions :to => :planned , :from => [:requested]
    end

    event :convert_to_holiday, :before => :update_holiday do 
      transitions :to => :accepted , :from => [:requested] 
    end

  end

  def calculate_holidays
    sum_holidays = 0 
    sum_sick_leaves = 0 
    user_holiday = UserHoliday.find_by_user_id_and_year(self.user.id,self.term_start.year)
    if self.holiday_type_id == 2
      user_holiday.accepted = 0
      user_holiday.planned = 0
      user_holiday.waiting = 0
      self.user.planned_holidays.each do |planned_holiday|
        
        user_holiday.accepted += planned_holiday.holidays_count if planned_holiday.accepted?
        user_holiday.planned += planned_holiday.holidays_count if planned_holiday.planned?
        user_holiday.waiting += planned_holiday.holidays_count if planned_holiday.requested?
      end
    else
      user_holiday.accepted_sick_leaves = 0
      user_holiday.waiting_sick_leaves = 0
      user_holiday.rejected_sick_leaves = 0
      self.user.planned_holidays.each do |planned_holiday|
        user_holiday.accepted_sick_leaves += planned_holiday.holidays_count if planned_holiday.accepted?
        user_holiday.waiting_sick_leaves += planned_holiday.holidays_count if planned_holiday.requested?
        user_holiday.rejected_sick_leaves += planned_holiday.holidays_count if planned_holiday.rejected?
      end
    end
    user_holiday.save!
  end

  def holidays_count
    count = 0;
    (self.term_start..self.term_end).map do |date|
      unless (date.saturday? || date.sunday?)
        count = count +1
      end
    end
    return count
  end
  
  def editable?
    self.planned?
  end
  
  def deleteable?
    self.planned?
  end
  
  def requesteable?
    self.planned? && self.term_start> Date.today
  end 
  def accessible?
    self.requested? || (self.rejected? && self.term_start> Date.today)
  end 

  def rejectable?
    self.requested? || (self.accepted? && self.term_start> Date.today)
  end 

  def withdraw_accessible?
    self.withdrawn?
  end 

  def withdraw_rejectable?
    self.withdrawn?
  end 
  def withdrawable?
    self.accepted?  && self.term_start> Date.today
  end
  def cancelable?
    self.requested? 
  end
  
  def update_holiday
    self.holiday_type_id = 2 
    self.save
  end 

  def delete_time_sheet_work_items
    self.time_sheets.each do |time_sheet|
      unless time_sheet.planned_work_time.nil?
        time_sheet.work_time_type = WorkTimeType.find(1)
        time_sheet.planned_holiday = nil
        time_sheet.save
      else
        time_sheet.destroy
      end
    end
  end

  def update_time_sheets
    (self.term_start..self.term_end).map do |date|
      unless (date.saturday? || date.sunday?)
        ts = TimeSheet.where("user_id = ? and work_date = ?", self.user_id, date).first
        if self.rejected?
          if ts
            if ts.planned_work_time.nil?
              ts.destroy
            else
              ts.planned_holiday_id = nil
              ts.work_time_type_id = 1
              ts.save 
            end 
          end
        else
          if ts
            ts.planned_holiday = self
            ts.work_time_type_id = self.holiday_type_id 
            ts.save 
          else
            self.time_sheets.create!(:user_id => self.user.id, :work_date => date, :planned_holiday_id => self.id, :work_time_type_id => self.holiday_type.id)
          end
        end
      end
    end
  end

end 