class CreateCustomerdbs < ActiveRecord::Migration[5.2]
  def change
    create_table :customerdbs do |t|
      t.string :name
      t.text :dob
      t.text :address
      t.text :phone
      t.timestamps
    end
  end
end
