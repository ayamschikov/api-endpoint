Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :publishers, only: %i[show]
    resources :shops, only: %i[show]
  end
end
