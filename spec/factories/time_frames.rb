# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_frame do
    name "MyString"
    from_time "2013-01-14 16:31:09"
    to_time "2013-01-14 16:31:09"
    work_sites nil
  end
end
