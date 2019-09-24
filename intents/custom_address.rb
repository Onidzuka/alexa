intent 'CustomAddress' do
  street_address = request.slot_value("streetAddress")

  if street_address.blank?
    ask("OK, what is your address?")
  else
    tell("OK, your address is #{street_address}.")
  end
end
