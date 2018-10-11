class CreateCustomer1s < ActiveRecord::Migration[5.2]
  def change
    create_table :customer1s do |t|
      t.string :name
      t.date :dob
      t.text :address
      t.numeric :phone

      t.timestamps
    end
  end
end
