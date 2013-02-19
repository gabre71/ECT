class CreateTimeFrames < ActiveRecord::Migration
  def change
    create_table :time_frames do |t|
      t.string :name, :null => false   
      t.time :from_time, :null => false
      t.time :to_time, :null => false
      t.time :cc_start_time
      t.time :cc_end_time
      t.boolean :inactive, :default => false
      t.timestamps
    end
  end
end
