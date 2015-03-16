class CreateTimestores < ActiveRecord::Migration
  def change
    create_table :timestores do |t|
      t.time :check_at
      t.string :idm
      t.integer :user_id
      t.boolean :entry_flag

      t.timestamps null: false
    end
  end
end
