class CreatePlannedWorkTimes < ActiveRecord::Migration
  def change
    create_table :planned_work_times do |t|
      t.references :user
      t.date :from_date
      t.date :to_date
      t.references :time_frame
      t.references :work_site

      t.timestamps
    end
    add_index :planned_work_times, :user_id
    add_index :planned_work_times, :time_frame_id
    add_index :planned_work_times, :work_site_id
    
  end
end
