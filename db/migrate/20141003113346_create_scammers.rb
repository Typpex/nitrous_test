class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :licence
      t.string :sexual_orientation
      t.date :birthday
      t.text :address
      t.timestamps
    end
  end
end
