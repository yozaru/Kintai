class AddYtaishaToKintais < ActiveRecord::Migration
  def change
    add_column :kintais, :ytaisha, :time
  end
end
