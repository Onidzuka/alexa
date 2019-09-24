require 'geocoder'

SLOT_VALUES = ['continue service', 'continue please', 'yes please', 'continue']

intent 'ContinueServiceRequest' do
  answer = request.slot_value("answer")

  if SLOT_VALUES.include?(answer)
    Geocoder.configure(
        lookup: :google,
        api_key: ENV.fetch('GOOGLE_PLACES_API_KEY')
    )

    coordinates = request.request['context']['Geolocation']['coordinate']
    address = Geocoder.address([coordinates['latitudeInDegrees'], coordinates['longitudeInDegrees']])

    puts coordinates
    puts address

    tell("OK, your location is #{address}")
  else
    tell('Thank you for using Honk. Bye.')
  end
end
