OceansApp::Application.routes.draw do
  root :to => 'oceans#home'

  get '/oceans' => 'oceans#index'
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'oceans_edit'
  post '/oceans/:id' => 'oceans#update', :as => 'oceans_update'
  post '/oceans/:id/delete' => 'oceans#destroy', :as => 'oceans_destroy'

  get '/oceans/:id' => 'oceans#show', :as => 'ocean'


end
