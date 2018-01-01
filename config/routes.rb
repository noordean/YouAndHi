Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/api/v1" do
    get "/users" => "users#index"
    post "/users/new" => "users#create"
    post "/users/login" => "users#login"
    get "/users/groups" => "users#get_user_groups"

    post "/groups/new" => "groups#create"
    post "/groups/:group_id/add_users" => "group_members#create"
    get "/groups/:group_id/members" => "groups#get_members"
    post "/messages/new" => "messages#create"
  end
end
