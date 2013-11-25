Games::Application.routes.draw do
  root :to => 'games#games'
  get '/magic_8_ball' => 'games#magic_8_ball'
  get '/secret_number' => 'games#secret_number'
  get '/rock_paper_scissors' => 'games#rock_paper_scissors'
  get '/rock_paper_scissors/:throw' => 'games#rock_paper_scissors_play'
  get '/secret_number/:guess' => 'games#secret_number_play'
  get '/magic_8_ball/:q' => 'games#magic_8_ball_play'
end

