class GroupsController < ApplicationController
  # POST /api/v1/group
  def create
    all_group_params = {
      group_name: group_params[:group_name],
      group_description: group_params[:group_description],
      created_by: get_current_user
    }
    @group = Group.create!(all_group_params)
    json_response(@group, :created)
  end

  # GET /api/v1/group/group_id/members
  def get_members
    members = Group.find(params[:group_id]).group_members.includes(:user)
    members_details = []
    members.each do |member|
      members_details << member.user
    end
    json_response(members_details.pluck(:id, :username, :email, :phone_number))
  end

  private

  def group_params
    params.permit(:group_name, :group_description)
  end
end
