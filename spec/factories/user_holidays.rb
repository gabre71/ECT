# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_holiday do
    user nil
    year "MyString"
    holidays 1
  end
end
