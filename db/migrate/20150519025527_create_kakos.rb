class CreateKakos < ActiveRecord::Migration
  def change
    create_table :kakos do |t|
      t.string :employee_id
      t.string :name
      t.string :sex
      t.string :project
      t.string :job
      t.integer :month
      t.integer :worktime

      t.timestamps null: false
    end
  end
end
