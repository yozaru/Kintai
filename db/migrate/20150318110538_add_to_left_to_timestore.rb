class AddToLeftToTimestore < ActiveRecord::Migration
  def change
    add_column :timestores, :left, :time
  end
end
