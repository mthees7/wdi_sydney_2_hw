Games::Application.routes.draw do
  root :to => 'games#home'


  get '/magic_8_ball' => 'games#magic_8_ball'
  get '/magic_8_ball_redirect' => 'games#magic_8_ball_redirect'
  get '/magic_8_ball/:question' => 'games#magic_8_ball_answer'


  get '/secret_number' => 'games#secret_number'
  get '/secret_number/:guess' => 'games#secret_number_guess'


  get '/rock_paper_scissors' => 'games#rock_paper_scissors'
  get '/rock_paper_scissors/:choice' => 'games#rock_paper_scissors_choice'

end
