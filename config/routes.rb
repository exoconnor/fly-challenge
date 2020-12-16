Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :missions, only: [:index, :show] do
    resources :photos, only: [:index, :show], controller: :mission_photos
  end
end
