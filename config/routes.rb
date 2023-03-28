Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'main#home', as: 'main_home'
  root 'main#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :categories do
    resources :tasks
   end
  # Defines the root path route ("/")
  # root "articles#index"
end
