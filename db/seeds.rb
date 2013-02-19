# encoding: utf-8
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :username => "rgabora", :name => "Gábora René", :email => "rgabora@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 3 
puts 'user: ' << user.name
user.add_role :admin
puts "role"
user.user_holidays.create!(:year => '2013', :holidays => 30)
puts "holiday"
user = User.find_or_create_by_email :username => "psusan", :name => "Susán Péter", :email => "psusan@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 3 , :deputy_id => 4
puts 'user: ' << user.name
user.add_role :admin
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "szfarkas", :name => "Farkas Szabolcs", :email => "szfarkas@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 3 , :deputy_id => 2
puts 'user: ' << user.name
user.add_role :admin
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "abalassa", :name => "Balassa András", :email => "abalassa@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 3 , :deputy_id => 2
puts 'user: ' << user.name
user.add_role :admin
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "mherczeg", :name => "Herczeg Miklós", :email => "mherczeg@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 4 
puts 'user: ' << user.name
user.add_role :user
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "pnagy", :name => "Nagy Péter", :email => "mnagy@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 2 
puts 'user: ' << user.name
user.add_role :user
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "vbendik", :name => "Bendik Viktor", :email => "vbendik@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 4 
puts 'user: ' << user.name
user.add_role :user
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "ggyulai", :name => "Gyulai Gábor", :email => "ggyulai@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 4 
puts 'user: ' << user.name
user.add_role :user
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "gmajor", :name => "Major Gábor", :email => "gmajor@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 4 
puts 'user: ' << user.name
user.add_role :user
user.user_holidays.create!(:year => '2013', :holidays => 30)

user = User.find_or_create_by_email :username => "ipodmaniczky", :name => "Podmaniczky Izolda", :email => "ipodmaniczky@eldacon.hu", :password => "aA123456", :password_confirmation => "aA123456", :manager_id => 3 
puts 'user: ' << user.name
user.add_role :user
user.user_holidays.create!(:year => '2013', :holidays => 30)

puts 'Default WorkTimeTimes'

wt = WorkTimeType.find_or_create_by_name({ :name => "Munkanap" }, :without_protection => true)
puts 'WorkTimeType: ' << wt.name

wt = WorkTimeType.find_or_create_by_name({ :name => "Szabadság" }, :without_protection => true)
puts 'WorkTimeType: ' << wt.name

wt = WorkTimeType.find_or_create_by_name({ :name => "Betegszabadság" }, :without_protection => true)
puts 'WorkTimeType: ' << wt.name

puts 'Default Site'

ws = WorkSite.find_or_create_by_name({ :name => "Office" , :distance=> 0}, :without_protection => true)
puts 'WorkSite: ' << ws.name

ws = WorkSite.find_or_create_by_name({ :name => "GenoID" , :distance=> 0}, :without_protection => true)
puts 'WorkSite: ' << ws.name

ws = WorkSite.find_or_create_by_name({ :name => "Podmaniczky" , :distance=> 0}, :without_protection => true)
puts 'WorkSite: ' << ws.name


tf = TimeFrame.find_or_create_by_name({:name => "Kora reggel (7:30)", :from_time => "7:30", :to_time => "16:00", :cc_start_time => "7:30", :cc_end_time => "16:00", :inactive=> false})
puts 'TimeFrame: ' << tf.name

tf = TimeFrame.find_or_create_by_name({:name => "Kora reggel (8:00)", :from_time => "8:00", :to_time => "16:30", :cc_start_time => "8:00", :cc_end_time => "16:30", :inactive=> false})
puts 'TimeFrame: ' << tf.name

tf = TimeFrame.find_or_create_by_name({:name => "Normál (8:30)", :from_time => "8:30", :to_time => "17:00", :cc_start_time => "8:30", :cc_end_time => "17:00", :inactive=> false})
puts 'TimeFrame: ' << tf.name

tf = TimeFrame.find_or_create_by_name({:name => "Késői (9:00)", :from_time => "9:00", :to_time => "17:30", :cc_start_time => "9:00", :cc_end_time => "17:30", :inactive=> false})
puts 'TimeFrame: ' << tf.name
