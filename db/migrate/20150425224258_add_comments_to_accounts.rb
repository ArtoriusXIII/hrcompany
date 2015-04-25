class AddCommentsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :comments, :text
  end
end
