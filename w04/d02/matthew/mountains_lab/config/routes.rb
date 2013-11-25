MountainsLab::Application.routes.draw do
  root :to => 'mountains#home'
  get '/' => 'mountains#home'


  get '/new' => 'mountains#new'
  post '/create' => 'mountains#create'


  get '/mountain/:id' => 'mountains#view', :as => "view"


  post 'mountain/:id/delete' => 'mountains#destroy', :as => "mountain_delete"


  get 'mountain/:id/edit' => 'mountains#edit', :as => "mountain_edit"
  post '/mountain/:id' => 'mountains#update', :as => "update"



end
