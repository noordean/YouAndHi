module V1
  class MessagesController < ApplicationController
    # POST /messages
    def create
      all_message_params = {
        message_content: message_params[:message_content],
        group_id: message_params[:group_id],
        posted_by: get_current_user
      }
      if !a_group_member?(message_params[:group_id])
        json_response({ message: "You do not belong to this group" }, :forbidden)
      else
        @message = Message.create!(all_message_params)
        json_response(@message, :created)
      end
    end

    # PUT "/messages/:id"
    def update
      message = message_owner(params[:id])
      if !message
        json_response({
                        message: "This can only be edited by the message owner"
                      },
                      :forbidden)
      elsif params[:message_content].nil?
        json_response({
                        message: "You need to supply the message content"
                      }, :bad_request)
      else
        message.update(message_content: params[:message_content])
        json_response(message: "Message updated successfully")
      end
    end

    # DELETE "/messages/:id"
    def destroy
      message = message_owner(params[:id])
      if !message
        json_response({
                        message: "This can only be deleted by the message owner"
                      }, :forbidden)
      elsif Message.destroy(params[:id])
        json_response(message: "Message deleted successfully")
      else
        json_response({
                        message: "Unable to delete message"
                      }, :internal_server_error)
      end
    end

    private

    def message_params
      params.permit(:message_content, :group_id, :posted_by)
    end
  end
end
