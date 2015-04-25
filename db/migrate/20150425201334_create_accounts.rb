class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :details
      t.references :employee, index: true

      t.timestamps
    end
  end
end
