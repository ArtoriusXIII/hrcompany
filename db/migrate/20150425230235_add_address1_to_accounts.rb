class AddAddress1ToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :address1, :string
  end
end
