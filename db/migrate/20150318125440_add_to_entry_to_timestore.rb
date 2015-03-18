class AddToEntryToTimestore < ActiveRecord::Migration
  def change
    add_column :timestores, :entry, :time
  end
end
