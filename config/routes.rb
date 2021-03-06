Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :api_base do
    post "/users/login" => "users#login"
    get "/users/groups" => "users#get_user_groups"
    get "/users/:id/status_posts" => "users#get_user_status_posts"
    resources :users
  
    post "/groups/:group_id/add_users" => "group_members#create"
    get "/groups/:group_id/members" => "groups#get_members"
    resources :groups

    resources :messages
    resources :status_posts

    post "/status_posts/:id/add_comment" => "status_comments#create"
    get "/status_posts/:id/status_comments" => "status_posts#get_status_post_comments"
    resources :status_comments
  end

  # New version goes here
  # scope module: :v2, constraints: ApiConstraint.new(version: 2) do
  #   concerns :api_base
  # end

  scope module: :v1, constraints: ApiConstraint.new(version: 1, default: true) do
    concerns :api_base
  end
end
