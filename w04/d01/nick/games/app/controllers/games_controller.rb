class GamesController < ApplicationController

  def magic_8_ball_play
    @user_question = params[:q].gsub(" ", "%20")
    @answer = [
      "This is without doubt true",
      "You are correct in your thinking",
      "There can be no impossibility",
      "The truth is unclear",
      "This is without doubt false",
      "There is no chance",
      "Unfortunately this is an untruth"
    ].shuffle.first

  end

  def secret_number_play
    @user_guess = params[:guess].to_i
    @answer = (1..10).to_a.shuffle.first

    if @user_guess == @answer
       @result = "You guessed right"
    else
      @result = "You are wrong, please try again"
    end

  end

  def rock_paper_scissors_play
    @user_choice = params[:throw]
    @server_choice = ['rock', 'paper', 'scissors'].shuffle.first

    if @user_choice == @server_choice
      @result = "It's a draw"


    elsif  (@user_choice == 'rock') && (@server_choice == 'scissors')
      @result = "You win"


    elsif (@user_choice == 'paper') && (@server_choice == 'rock')
      @result = "You win!"

    elsif (@user_choice == 'scissors') && (@server_choice == 'paper')
      @result = "You win!"

    else
      @result = "You lose!"

    end

  end

end