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

  private

  def group_params
    params.permit(:group_name, :group_description)
  end
end
