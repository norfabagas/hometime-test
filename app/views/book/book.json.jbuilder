json.status @status

json.messages @messages

  json.guest do
    json.first_name @guest.first_name
    json.last_name @guest.last_name
    json.email @guest.email
    json.phones @guest.phones.pluck(:phone_number)
  end

  json.reservation @reservation

end