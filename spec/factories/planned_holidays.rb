# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :planned_holiday do
    user nil
    term_start "2013-02-05"
    term_end "2013-02-05"
    approver nil
    holiday_type nil
  end
end
