require 'byebug'

intent 'ContinueServiceRequest' do
  answer = request.slot_value("answer")

  if answer == 'yes'
    ask('OK, your location is 2437 Barry Avenue, Los Angeles, California.')
  else

    tell('Thank you for using Honk. Bye.')
  end
end
