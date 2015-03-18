class CreateTodayEntries < ActiveRecord::Migration
  def change
    create_table :today_entries do |t|
      t.integer :user_id
      t.time :entry
      t.time :last_out

      t.timestamps null: false
    end
  end
end
