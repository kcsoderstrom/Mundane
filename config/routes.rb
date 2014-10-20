Rails.application.routes.draw do
  resources :help_mes, only: [:index] do
    patch "resolve"
    patch "claim"
  end
  post "update_table", to: "help_mes#update_table"

end
