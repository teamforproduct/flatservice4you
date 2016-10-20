class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :engine
      t.string :registration_no
      t.string :vin
      t.string :actual_mileage
      t.string :yearly_mileage
      t.integer :driving_profile
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
