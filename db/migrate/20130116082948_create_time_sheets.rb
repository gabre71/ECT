class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.references :user, :null => false
      t.date :work_date, :null => false
      t.references :planned_work_time
      t.references :planned_holiday
      t.references :work_site
      t.time :start_time
      t.time :end_time
      t.time :cc_start_time
      t.time :cc_end_time
      t.boolean :lateness
      t.references :work_time_type, :null => false
      t.references :time_frame
      t.timestamps
    end
    add_index :time_sheets, :user_id
    add_index :time_sheets, :planned_work_time_id
    add_index :time_sheets, :work_site_id
    add_index :time_sheets, :time_frame_id
    add_index :time_sheets, :work_time_type_id
  end
end
