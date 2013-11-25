GamesApp::Application.routes.draw do
  root :to => 'games#home'
  get '/games/magic' => 'games#magic'
  get '/games/magic_question' => 'games#magic_question'

  get '/games/secret' => 'games#secret'
  get '/games/secret/guess' => 'games#guess'

  get '/games/rock_paper_scissors_play' => 'games#rock_paper_scissors_play'
  get '/games/rock_paper_scissors/:throw' => 'games#rock_paper_scissors_play'

end
