module MessagesHelper
  def set_user_to_message_sender(message)
    User.find(message.user_id)
  end
end
