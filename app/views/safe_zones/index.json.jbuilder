json.array!(@safe_zones) do |safe_zone|
  json.extract! safe_zone, :id, :location_name, :person_name, :address, :latitude, :longitude
  json.url safe_zone_url(safe_zone, format: :json)
end
