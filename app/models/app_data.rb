class AppData < ActiveRecord::Base
	has_many :app_moduls
  attr_accessible :name
end
