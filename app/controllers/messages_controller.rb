class MessagesController < ApplicationController
  before_action :find_conversation, only: %i[index create new]

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.save
    redirect_to conversation_messages_path(@conversation) 
  end

  def update
    # Finds message from message id. The param is passed from mark_as_read_path route on the message index page 
    @message = Message.find(params[:id])
    @message.update!(read: true)
    redirect_to conversation_messages_path(@message.conversation_id)
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :read)
  end


  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
