Rails.application.routes.draw do
  root to: "pages#welcome"
  resources :meetups, only: %w(new create)
end
