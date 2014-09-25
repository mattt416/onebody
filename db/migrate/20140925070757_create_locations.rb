class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip, limit: 10
      t.string :country, limit: 2
      t.float :latitude
      t.float :longitude
    end
  end
end
