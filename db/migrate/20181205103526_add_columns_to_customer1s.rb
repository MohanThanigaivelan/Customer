class AddColumnsToCustomer1s < ActiveRecord::Migration[5.2]
  def change
    add_column :customer1s, :provider, :string
    add_column :customer1s, :uid, :string
  end
end
