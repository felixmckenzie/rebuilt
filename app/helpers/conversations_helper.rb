# frozen_string_literal: true

module ConversationsHelper
  def set_recipient(conversation, _user, _recipient)
    if conversation.sender_id == current_user.id
      User.find(conversation.recipient_id)
    else
      User.find(conversation.sender_id)
    end
  end
end
