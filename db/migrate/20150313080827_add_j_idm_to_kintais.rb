class AddJIdmToKintais < ActiveRecord::Migration
  def change
    add_column :kintais, :idm, :string
  end
end
