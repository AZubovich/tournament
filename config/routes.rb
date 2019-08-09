Rails.application.routes.draw do
  root to: 'pages#profile'
  get 'profile', to: 'pages#profile'
  devise_for :users
   # ,  :controllers => { :omniauth_callbacks => 'callbacks' }
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
