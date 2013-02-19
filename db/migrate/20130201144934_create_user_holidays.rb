class CreateUserHolidays < ActiveRecord::Migration
  def change
    create_table :user_holidays do |t|
      t.references :user, :null => false
      t.string :year, :null => false
      t.integer :holidays, :default => 0
      t.integer :accepted, :default => 0
      t.integer :planned, :default => 0
      t.integer :waiting, :default => 0
      t.integer :accepted_sick_leaves, :default => 0
      t.integer :rejected_sick_leaves, :default => 0
      t.integer :waiting_sick_leaves, :default => 0

      t.timestamps
    end
    add_index :user_holidays, :user_id
  end
end
