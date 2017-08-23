class AddCustomerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :customer, :text
  end
end
