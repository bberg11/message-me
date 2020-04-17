Rails.application.routes.draw do
  root "chat_room#index"

  get "login", to: "logins#new"
  post "login", to: "logins#create"
  delete "logout", to: "logins#destroy"
end
