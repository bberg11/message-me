Rails.application.routes.draw do
  root "chat_room#index"

  get "login", to: "logins#new"
  post "login", to: "logins#create"
  delete "logout", to: "logins#destroy"

  get "signup", to: "users#new"
  resources :users, only: [:show, :edit, :update, :create]

  post "message", to: "messages#create"

  mount ActionCable.server, at: "/cable"
end
