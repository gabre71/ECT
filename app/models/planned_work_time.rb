class PlannedWorkTime < ActiveRecord::Base
	before_create :set_work_time_type
  after_create :create_time_sheets
  after_save :update_time_sheets
  after_destroy :delete_time_sheet_work_items
  belongs_to :user
  belongs_to :time_frame
  belongs_to :work_site
  belongs_to :work_time_type

  has_many :time_sheets 

  attr_accessible :from_date, :to_date, :user_id, :time_frame_id, :work_site_id, :work_time_type_id


private

  def delete_time_sheet_work_items
    self.time_sheets.each do |time_sheet|
      if time_sheet.work_time_type_id == 1
        time_sheet.destroy
      else
        time_sheet.planned_work_time_id = nil
        time_sheet.time_frame_id = nil
        time_sheet.work_site_id = nil
        time_sheet.save
      end
    end
  end

  def create_time_sheets
    (self.from_date..self.to_date).map do |date|
      unless (date.saturday? || date.sunday?)
        @ts = TimeSheet.where("user_id = ? and work_date = ?", self.user_id, date).first
        unless @ts
          self.time_sheets.create!(:user_id => self.user_id, :work_date => date, :time_frame_id => self.time_frame_id, :work_time_type_id => self.work_time_type_id)
        else
          @ts.planned_work_time = self
          @ts.time_frame = self.time_frame
          @ts.work_site = self.work_site 
          @ts.save 
        end
      end
    end
  end

  def set_work_time_type
    self.work_time_type = WorkTimeType.first 
  end 
 
  def update_time_sheets
  	(self.time_sheets).map do |time_sheet|
  		time_sheet.work_site_id = self.work_site_id
  		time_sheet.save
  	end
  end

end

