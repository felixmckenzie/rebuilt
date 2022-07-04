module ConversationsHelper

def set_recipient(conversation, user, recipient)
if conversation.sender_id == current_user.id
    recipient = User.find(conversation.recipient_id)
else
    recipient = User.find(conversation.sender_id)
end
recipient
end

end