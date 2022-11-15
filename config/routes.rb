Rails.application.routes.draw do
  resources :streams do
    scope module: :streams do
      resources :pings, only: :create
    end
  end

  root "readme#index"
end
