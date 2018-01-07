Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/api/v1" do
    post "/users/login" => "users#login"
    get "/users/groups" => "users#get_user_groups"
    resources :users
  
    post "/groups/:group_id/add_users" => "group_members#create"
    get "/groups/:group_id/members" => "groups#get_members"
    resources :groups

    resources :messages
    resources :status_posts

    post "/status_posts/:id/add_comment" => "status_comments#create"
  end
end
