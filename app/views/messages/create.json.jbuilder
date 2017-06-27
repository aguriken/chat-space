json.name @message.user.name
json.date @message.created_at.strftime('%y/%m/%d %H:%M:%S')
json.body @message.body
