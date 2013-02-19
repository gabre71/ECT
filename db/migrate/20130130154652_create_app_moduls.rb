class CreateAppModuls < ActiveRecord::Migration
  def change
    create_table :app_moduls do |t|
      t.references :app_data
      t.references :modul

      t.timestamps
    end
    add_index :app_moduls, :app_data_id
    add_index :app_moduls, :modul_id
  end
end
