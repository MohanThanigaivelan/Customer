class AddDeletedToCustomer1s < ActiveRecord::Migration[5.2]
  def change
    add_column :customer1s, :deleted, :boolean,:default => false
  end
end
