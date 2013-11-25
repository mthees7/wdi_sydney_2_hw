Gamelab::Application.routes.draw do
  root :to => 'games#start'

  get '/magic8ball' => 'games#magic8'
  get '/randomnumber' => 'games#randomnumber'
  get '/rockpaperscissors' => 'games#rockpaperscissors'

  get '/magic8ball_answer' => 'games#magic8ball_answer'
  get '/randomnumber_answer/:guess' => 'games#randomnumber_answer'
  get '/rockpaperscissors_answer' => 'games#rockpaperscissors_answer'

end
