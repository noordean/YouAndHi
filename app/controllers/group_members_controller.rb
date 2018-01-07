class GroupMembersController < ApplicationController
  # POST /api/v1/groups/group_id/add_users
  def create
    if group_creator(params[:group_id])
      if all_group_user_params[:member].is_a?(Array)
        group_members = handle_array_of_members(all_group_user_params[:member])
        json_response(group_members, :created)
      else
        @group_users = GroupMember.create!(all_group_user_params)
        json_response(@group_users, :created)
      end
    else
      json_response({
                      message: "Only the group creator can add members"
                    }, :forbidden)
    end
  end

  private

  def handle_array_of_members(members)
    group_members = []
    members.each do |member|
      group_member_params = {
        group_id: params[:group_id],
        member: member
      }
      group_member = GroupMember.create!(group_member_params)
      group_members << group_member
    end

    group_members
  end

  def all_group_user_params
    {
      group_id: params[:group_id],
      member: group_users_params[:member]
    }
  end

  def group_users_params
    params.permit(:member)
  end
end
