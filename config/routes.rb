Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/api/v1" do
    get "/users" => "users#index"
    post "/user/signup" => "users#create"
    post "/user/signin" => "users#signin"
  end
end
