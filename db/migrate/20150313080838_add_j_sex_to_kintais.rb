class AddJSexToKintais < ActiveRecord::Migration
  def change
    add_column :kintais, :sex, :string
  end
end
