class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_name
      t.string :manager
      t.string :location

      t.timestamps
    end
  end
end
