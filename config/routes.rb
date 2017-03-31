Rails.application.routes.draw do
  root to: "pages#welcome"
  get 'meetups/new'
end
