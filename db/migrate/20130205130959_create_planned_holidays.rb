class CreatePlannedHolidays < ActiveRecord::Migration
  def change
    create_table :planned_holidays do |t|
      t.references :user, :null => false
      t.date :term_start
      t.date :term_end
      t.references :approver
      t.references :holiday_type, :null => false
      t.string :status

      t.timestamps
    end
    add_index :planned_holidays, :user_id
    add_index :planned_holidays, :approver_id
    add_index :planned_holidays, :holiday_type_id
  end
end
