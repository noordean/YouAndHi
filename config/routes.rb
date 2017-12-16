Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/api/v1" do
    get "/users" => "users#index"
    post "/users/new" => "users#create"
    post "/users/login" => "users#login"

    post "/groups/new" => "groups#create"
  end
end
