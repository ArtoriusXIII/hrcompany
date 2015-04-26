class CreateRegionCompensations < ActiveRecord::Migration
  def change
    create_table :region_compensations do |t|
      t.string :region_name
      t.string :country_name
      t.string :state
      t.decimal :number_of_employees
      t.decimal :salary_total

      t.timestamps
    end
  end
end
