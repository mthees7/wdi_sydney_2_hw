class GamesController < ApplicationController

  def secret_number_play
    @user_guess = params[:guess]
    @server_choice = (1..10).to_a
    @answer = @server_choice.shuffle.first

    if @user_guess == @answer
       @result = "You guessed right"
    else
      @result = "You guessed wrong"
    end

  end

  def rock_paper_scissors_play
    @user_choice = params[:throw]
    @server_choice = ['rock', 'paper', 'scissors'].shuffle.first

    if @user_choice == @server_choice
      @result = "Draw"


    elsif  (@user_choice == 'rock') && (@server_choice == 'scissors')
      @result = "You win"


    elsif (@user_choice == 'paper') && (@server_choice == 'rock')
      @result = "You win"

    elsif (@user_choice == 'scissors') && (@server_choice == 'paper')
      @result = "You win"

    else
      @result = "You lose"

    end

  end

  def magic_8_ball_play
    @question = params[:q]
    @user_question = @question.gsub(' ','%20')
    @answer = ['You are on the right path young one', 'Follow your heart', 'I see death in your future',
      'You are on the wrong path', 'Maybe Baby'].shuffle.first



  end



end