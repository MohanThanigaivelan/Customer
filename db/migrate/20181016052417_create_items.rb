class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :serial_no
      t.string :name
      t.integer :cost
      t.integer :stock

      t.timestamps
    end
  end
end
