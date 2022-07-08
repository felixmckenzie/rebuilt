module MessagesHelper
  def find_message_sender(message)
    User.find(message.user_id)
  end
end
