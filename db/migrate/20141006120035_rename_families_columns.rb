class RenameFamiliesColumns < ActiveRecord::Migration
  def change
    rename_column :families, :address1, :old_address1
    rename_column :families, :address2, :old_address2
    rename_column :families, :city, :old_city
    rename_column :families, :state, :old_state
    rename_column :families, :zip, :old_zip
    rename_column :families, :country, :old_country
    rename_column :families, :latitude, :old_latitude
    rename_column :families, :longitude, :old_longitude

    print 'Updating locations ...'
    Family.all.each do |family|
      location = family.build_location
      location.address1 = family.old_address1
      location.address2 = family.old_address2
      location.city = family.old_city
      location.state = family.old_state
      location.zip = family.old_zip
      location.country = family.old_country
      location.latitude = family.old_latitude
      location.longitude = family.old_longitude
      family.save
    end
    puts
  end
end
