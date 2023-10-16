Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get '/joke', to: 'joke#index'
end
