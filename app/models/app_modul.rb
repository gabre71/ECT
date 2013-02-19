class AppModul < ActiveRecord::Base
  belongs_to :app_data
  belongs_to :modul
  # attr_accessible :title, :body
end
