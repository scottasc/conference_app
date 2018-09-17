Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/speakers" => 'speakers#index'
    post "/speakers" => 'speakers#create'
    get "/speakers/:id" => 'speakers#show'
    patch "/speakers/:id" => 'speakers#update'
    delete "/speakers/:id" => 'speakers#destroy'

    get "/meetings" => 'meetings#index'
    post "/meetings" => 'meetings#create'
    get "/meetings/:id" => 'meetings#show'
    patch "/meetings/:id" => 'meetings#update'
    delete "/meetings/:id" => 'meetings#destroy'
  end
end
