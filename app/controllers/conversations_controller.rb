# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # eager or pre loads messages, and retrieves all conversations where the current user is the sender or the current user is the recipient
    @conversations = Conversation.includes(:messages).where(sender_id: current_user.id).or(Conversation.where(recipient_id: current_user.id))
  end

  def create
      # If conversation exists between a sender and recipient, create action will find the first instance, else it will create a new conversation
    @conversation = if Conversation.between(params[:sender_id], params[:recipient_id]).present?
                      Conversation.between(params[:sender_id], params[:recipient_id]).first
                    else
                      Conversation.create!(conversation_params)
                    end
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
