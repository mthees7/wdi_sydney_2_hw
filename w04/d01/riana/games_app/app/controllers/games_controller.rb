class GamesController < ApplicationController
  def home
  end

  def magic
  end
  def magic_question
    @decision = rand(3)
    @response = ""
    case @decision
    when '1'
      @response = "Absolutely"
    when '2'
      @response = "No way"
    else
      @response = "Undecided"
    end
  end

  def secret
    @guess = params[:guess].to_i
    @num = rand(1..10)
    @response = ""

    if @num == @guess
      @response = "Correct"
    else
      @response = "Incorrect"
    end

  end

  def rock_paper_scissors_play
    @possibilities = ["rock","paper","scissors"]
    @app_choice = @possibilities[rand(0..2)]
    @user_choice = params[:throw]
    @outcome = ""
    if @user_choice == @app_choice
      @outcome = "Draw, play again."
    else
      @outcome = "To Do"
    end
  end

end