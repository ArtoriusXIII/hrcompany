class AddAddress1ToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :address1, :string
  end
end
