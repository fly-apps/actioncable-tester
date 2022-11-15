Rails.application.routes.draw do
  get "/timeouts", to: "timeout_diagnostics#index"
  root "readme#index"
end
