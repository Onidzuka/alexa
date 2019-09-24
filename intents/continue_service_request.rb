require 'geocoder'

SLOT_VALUES = ['continue service', 'continue please', 'yes please', 'continue', 'find me']

intent 'ContinueServiceRequest' do
  answer = request.slot_value("answer")

  if SLOT_VALUES.include?(answer)
    Geocoder.configure(
      lookup: :google,
      api_key: ENV.fetch('GOOGLE_PLACES_API_KEY')
    )

    coordinates = request.request['context']['Geolocation']['coordinate']
    locations = Geocoder.search([coordinates['latitudeInDegrees'], coordinates['longitudeInDegrees']]).select {|g| g.street_number.present?}
    street_addresses = locations.map(&:street_address)

    near_addresses = ''

    street_addresses.each_with_index do |street_address, index|
      number = index + 1
      near_addresses += "Address number #{number} is: #{street_address}. "
    end

    city = locations.first.city
    state = locations.first.state
    zip_code = locations.first.postal_code

    ask("OK, you are in #{city}, #{state}. Your zip code is: #{zip_code.split('').join(' ')}. I found #{locations.count} addresses near you: #{near_addresses}. Say address number, to continue with. Or, say add custom address, if your address is not listed.")
  else
    ask("I could not identify your request. Would you like to continue?")
  end
end
