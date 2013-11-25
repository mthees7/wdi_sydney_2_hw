GalleryApp::Application.routes.draw do
  root :to => 'pages#home'

  resources :artists, :artworks
end
