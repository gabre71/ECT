class CreateWorkTimeTypes < ActiveRecord::Migration
  def change
    create_table :work_time_types do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
