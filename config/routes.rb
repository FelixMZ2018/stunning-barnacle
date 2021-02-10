Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'messages/index', to: 'messages#index'
      post 'messages/create', to: 'messages#create'
      get 'messages/show/:id', to: 'messages#show'
      delete 'messages/destroy/:id', to: 'messages#destroy'
      
    end
end
end
