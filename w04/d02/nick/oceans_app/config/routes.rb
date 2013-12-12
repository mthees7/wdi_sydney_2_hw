OceansApp::Application.routes.draw do
  root :to => 'oceans#index'
  get '/oceans' => 'oceans#index'
  get '/ocean/:id' => 'oceans#show', :as => 'ocean'
  get '/oceans/new' => 'oceans#new'
  post '/oceans' => 'oceans#create'
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  post '/ocean/:id' => 'oceans#update'
  post '/ocean/:id/delete' => 'oceans#destroy', :as => 'ocean_delete'
end