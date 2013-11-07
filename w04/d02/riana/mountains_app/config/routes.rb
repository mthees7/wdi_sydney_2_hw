MountainsApp::Application.routes.draw do
  root :to => 'mountains#home'

  get '/mountains' => 'mountains#home'
  get '/mountains/new' => 'mountains#new'
  post '/mountains' => 'mountains#create'
  get '/mountains/:id' => 'mountains#show', :as => 'mountain'
  post '/mountains/:id' => 'mountains#update'
  get '/mountains/:id/edit' => 'mountains#edit', :as => 'mountain_edit'
  get '/mountains/:id/delete' => 'mountains#delete', :as => 'mountain_delete'
end
