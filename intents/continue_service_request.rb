require 'geocoder'

SLOT_VALUES = ['continue service', 'continue please', 'yes please', 'continue']

intent 'ContinueServiceRequest' do
  answer = request.slot_value("answer")

  if SLOT_VALUES.include?(answer)
    coordinates = request.request['context']['Geolocation']['coordinate']
    puts coordinates

    result = Geocoder.search([coordinates['latitudeInDegrees'], coordinates['longitudeInDegrees']]).first
    tell("OK, your location is #{result.address}")
  else
    tell('Thank you for using Honk. Bye.')
  end
end
