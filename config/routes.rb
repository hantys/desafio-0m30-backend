Rails.application.routes.draw do
  resources :citizens

  root "citizens#index"
end
