# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_sheet do
    user nil
    work_date "2013-01-16"
    time_frame nil
    work_sites nil
    start_time "2013-01-16 09:29:48"
    end_time ""
    lateness false
    holiday false
  end
end
