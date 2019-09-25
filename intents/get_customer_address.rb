require './lib/services'

intent 'GetCustomerAddress' do
  address_number = request.slot_value("addressNumber")
  street_address = request.slot_value("streetAddress")

  if address_number.present?
    street_addresses = request.session_attribute("street_addresses")

    tell("OK, your street address is #{street_addresses[address_number.to_i - 1]}")
  else
    if street_address.blank?
      ask("OK, what is your street address?")
    else
      tell("OK, your address is #{street_address}.")
    end
  end
end
