# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app_datum, :class => 'AppData' do
    name "MyString"
  end
end
