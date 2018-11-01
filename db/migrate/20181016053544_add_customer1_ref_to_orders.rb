class AddCustomer1RefToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :customer1, foreign_key: true
  end
end
