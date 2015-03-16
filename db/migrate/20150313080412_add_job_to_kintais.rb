class AddJobToKintais < ActiveRecord::Migration
  def change
    add_column :kintais, :job, :string
  end
end
