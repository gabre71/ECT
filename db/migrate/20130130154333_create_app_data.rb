class CreateAppData < ActiveRecord::Migration
  def change
    create_table :app_data do |t|
      t.string :name

      t.timestamps
    end
  end
end
