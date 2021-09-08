json.status @status
if !@messages.nil?
  json.messages @messages
else
  json.guest do
    json.first_name @guest.first_name
    json.last_name @guest.last_name
    json.email @guest.email
    json.phones @guest.phones.pluck(:phone_number)
  end
  json.reservation @reservation
end