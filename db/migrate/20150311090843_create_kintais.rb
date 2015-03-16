class CreateKintais < ActiveRecord::Migration
  def change
    create_table :kintais do |t|
      t.string :employee_id
      t.string :name
      t.time :shusha
      t.time :taisha

      t.timestamps null: false
    end
  end
end
