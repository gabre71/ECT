class CreateModuls < ActiveRecord::Migration
  def change
    create_table :moduls do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
