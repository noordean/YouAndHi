module V1
  class GroupsController < ApplicationController
    # POST /groups
    def create
      all_group_params = {
        group_name: group_params[:group_name],
        group_description: group_params[:group_description],
        created_by: get_current_user
      }
      @group = Group.create!(all_group_params)
      json_response(@group, :created)
    end

    # GET /groups/:id/members
    def get_members
      members = Group.find(params[:group_id]).group_members.includes(:user)
      members_details = []
      members.each do |member|
        members_details << member.user
      end
      json_response(members_details.pluck(:id, :username, :email, :phone_number))
    end

    # PUT "/groups/:id"
    def update
      group = group_creator(params[:id])
      if !group
        json_response({
                        message: "This can only be renamed by the group creator"
                      },
                      :forbidden)
      elsif params[:group_name].nil?
        json_response({
                        message: "You need to supply the group name"
                      }, :bad_request)
      elsif group_already_exists?(params[:group_name])
        json_response({ message: "Group already exists" }, :conflict)
      else
        group.update(group_name: params[:group_name])
        json_response(message: "Group updated successfully")
      end
    end

    # DELETE "/groups/:id"
    def destroy
      group = group_creator(params[:id])
      if !group
        json_response({
                        message: "This can only be deleted by the group creator"
                      }, :forbidden)
      elsif Group.destroy(params[:id])
        json_response(message: "Group deleted successfully")
      else
        json_response({
                        message: "Unable to delete group"
                      }, :internal_server_error)
      end
    end

    private

    def group_already_exists?(name)
      if Group.find_by(group_name: name)
        true
      end
    end

    def group_params
      params.permit(:group_name, :group_description)
    end
  end
end
