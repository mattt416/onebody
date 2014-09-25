class Location < ActiveRecord::Base
  has_one :family
  has_many :people, through: :family

  geocoded_by :location
  after_validation :geocode

  def address
    address1.to_s + (address2.present? ? "\n#{address2}" : '')
  end

  def location
    if [address1, city, state].all?(&:present?)
      {
        street: address,
        city: city,
        state: state,
        postalCode: zip,
        adminArea1: country
      }
    end
  end

  def mapable?
    latitude.to_f != 0.0 and longitude.to_f != 0.0
  end

  def short_zip
    zip.to_s.split('-').first
  end
end
