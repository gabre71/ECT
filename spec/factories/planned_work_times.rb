# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :planned_work_time do
    user nil
    from_date "2013-01-16"
    to_date "2013-01-16"
    time_frame nil
  end
end
