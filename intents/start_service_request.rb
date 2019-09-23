SERVICES = {
    tow: {
        price: 'seventy five dollars',
        eta: 'twenty minutes'
    },
    lockout: {
        price: 'seventy five dollars',
        eta: 'fifteen minutes'
    },
    fuel: {
        price: 'twenty five dollars',
        eta: 'fifty minutes'
    },
    battery: {
        price: 'thirty dollars',
        eta: 'fifteen minutes'
    },
    tire: {
        price: 'two hundred dollars',
        eta: 'ten minutes'
    }
}

intent 'StartServiceRequest' do
  service = request.slot_value("service")

  price = SERVICES[service.to_sym][:price]
  eta = SERVICES[service.to_sym][:eta]

  output_speech = "#{service} service price is #{price}. Typical estimated arrival is #{eta}. Would you like to continue with #{service} service?"

  ask(output_speech, session_attributes: { service: service })
end
