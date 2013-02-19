class CreateWorkSites < ActiveRecord::Migration
  def change
    create_table :work_sites do |t|
      t.string :name,  :null=> false
      t.integer :distance, :default => 0

      t.timestamps
    end
  end
end
