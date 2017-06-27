module MessagesHelper
  def message_date(message)
    I18n.l message.created_at
  end
end
