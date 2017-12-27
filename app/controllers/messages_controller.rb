class MessagesController < ApplicationController
  # POST /api/v1/messages/new
  def create
    all_message_params = {
      message_content: message_params[:message_content],
      group_id: message_params[:group_id],
      posted_by: get_current_user
    }
    @message = Message.create!(all_message_params)
    json_response(@message, :created)
  end

  private

  def message_params
    params.permit(:message_content, :group_id)
  end
end
