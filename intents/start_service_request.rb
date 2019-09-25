require './lib/services'

intent 'StartServiceRequest' do
  service = request.slot_value("service")

  if service && SERVICES.keys.include?(service.to_sym)
    price = SERVICES[service.to_sym][:price]
    eta = SERVICES[service.to_sym][:eta]

    output_speech = "#{service} service price is #{price}. ETA is #{eta}. Would you like to continue with #{service} service?"

    ask(output_speech, session_attributes: { service: service })
  else
    ask("I could not identify your request. Please try again. You can pick from fuel, lockout, and tow.")
  end
end
