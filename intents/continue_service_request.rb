require 'geocoder'

SLOT_VALUES = ['continue service', 'continue please', 'yes please', 'continue']

intent 'ContinueServiceRequest' do
  answer = request.slot_value("answer")

  if SLOT_VALUES.include?(answer)
    coordinates = request.request['context']['Geolocation']['coordinate']
    puts coordinates

    address = Geocoder.address([coordinates['latitudeInDegrees'], coordinates['longitudeInDegrees']])

    puts address

    tell("OK, your location is #{address}")
  else
    tell('Thank you for using Honk. Bye.')
  end
end
