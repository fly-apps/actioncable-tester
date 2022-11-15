Rails.application.routes.draw do
  resources :streams do
    scope module: :streams do
      resources :pings, only: :create
      resources :batches, only: :create
    end
  end


  # ./config/routes.rb
  get "/ping", to: "pings#ping"
  get "/ping/:start_time/pong", to: "pings#pong", as: :pong
  get "/pinger", to: "pings#pinger", as: :pinger

  root "readme#index"
end
