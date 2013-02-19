class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :time_sheets 
  has_many :planned_work_times
  has_many :user_holidays
  has_many :planned_holidays
  has_many :sick_leaves , :class_name => "PlannedHoliday" ,:conditions => "holiday_type_id = 3"
  belongs_to :manager, :class_name => "User" , :foreign_key => :manager_id
  has_many :managed_users, :class_name => "User", :foreign_key => :manager_id

  belongs_to :deputy, :class_name => "User" , :foreign_key => :deputy_id

  has_many :managers_substituted, :class_name => "User", :foreign_key => :deputy_id

 # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :name, :skype, :phone, :role_ids, :as => :admin
  attr_accessible   :password, :username, 
                    :email, :name, :skype, 
                    :phone, :password_confirmation, 
                    :remember_me, :manager_id, :deputy_id
  
  validates_presence_of :username
	validates_uniqueness_of :username, :case_sensitive => false
  #validate :other_then_deputy

  def other_then_deputy
    unless self.deputy.nil?
       if self.manager == self.deputy
         errors.add(:manager, "can't be eq with deputy")
         false
       else
        true
       end
     else
       true
     end
  end
  def substituted_users
    users = Array.new
    self.managers_substituted.each do |manager|
        users += manager.managed_users
    end
    return users.uniq
  end

  def all_managed_users
    (self.substituted_users + self.managed_users).uniq
  end

  def is_manager?
    all_managed_users.count>0
  end
  
  def accepted_holiday_count
    self.user_holidays.find_by_year(Time.now.year).accepted
  end
  
  def in_progress_holiday_count
    self.user_holidays.find_by_year(Time.now.year).waiting
  end

  def planned_holiday_count
    self.user_holidays.find_by_year(Time.now.year).planned
  end

  def unused_holiday_count
    self.user_holidays.find_by_year(Time.now.year).holidays - self.accepted_holiday_count - self.in_progress_holiday_count - self.planned_holiday_count
  end

  def accepted_sick_leave_count
    self.user_holidays.find_by_year(Time.now.year).accepted_sick_leaves
  end

  def in_progress_sick_leave_count
    self.user_holidays.find_by_year(Time.now.year).waiting_sick_leaves
  end
  
  def rejected_sick_leave_count
    self.user_holidays.find_by_year(Time.now.year).rejected_sick_leaves
  end

  def acceptable_holidays
    self.planned_holidays.find_all_by_status(["requested", "withdrawn", "accepted", "rejected"])
  end

  def add_holiday(year, holidays)
    user_holiday = self.user_holidays.find_by_year(year)
    if user_holiday.nil?
      self.user_holidays.create(:year => year, :holidays=> holidays)
    else
      user_holiday.holidays= holidays
    end
    user_holiday.save
  end
end
