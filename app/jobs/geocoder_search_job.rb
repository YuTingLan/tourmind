class GeocoderSearchJob < ApplicationJob
  queue_as :default

  def perform(restaurant)
    location = Geocoder.search(restaurant.address).first.coordinates
    if location.present?
      restaurant.lat =  location.first
      restaurant.long =  location.last
      restaurant.save
    end
  end
end
