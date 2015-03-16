class AddProjectToKintais < ActiveRecord::Migration
  def change
    add_column :kintais, :project, :string
  end
end
