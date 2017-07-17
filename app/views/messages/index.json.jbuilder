json.messages @messages.each do |message|
  json.name message.user.name
  json.date message_date(message)
  json.image message.image.url
  json.body message.body
end
