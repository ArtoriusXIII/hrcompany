class AddAddress2ToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :address2, :string
  end
end
