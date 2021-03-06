Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create, :new, :destroy]
    resources :reviews, only: [:new, :create]
  end
  root 'pages#home'
  get 'top' => 'cocktails#top'
  mount Attachinary::Engine => "/attachinary"
end
