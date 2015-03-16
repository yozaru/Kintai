class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :employeeid
      t.string :name
      t.string :job
      t.string :project
      t.string :sex
      t.string :idm

      t.timestamps null: false
    end
  end
end
