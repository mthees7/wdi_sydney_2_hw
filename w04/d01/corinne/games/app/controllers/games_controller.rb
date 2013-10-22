class GamesController < ApplicationController

  def home
  end

  # ****************** MAGIC 8 BALL ******************

  def magic_8_ball
  end

  def magic_8_ball_redirect
    @question = params['question'].gsub(' ', '%20')
    redirect_to "/magic_8_ball/#{@question}"
  end

  def magic_8_ball_answer
    @answer = ["You are a fool", "Obviously", "No way, Jose!", "Why are you asking me?", "I dunno", "Meh... yeah?", "Yeah.... no"].sample
  end


  # ****************** SECRET NUMBER *****************

  def secret_number
  end

  def secret_number_guess
    guess = params[:guess].to_i
    answer = (1..10).to_a.sample

    if answer == guess
      render "secret_number_correct"
    else
      render "secret_number_incorrect"
    end
  end



  # ****************** ROCK PAPER SCISSORS ***********

  def rock_paper_scissors
  end

  def rock_paper_scissors_choice
    human_weapon = params[:choice]
    computer_weapon = ["rock", "paper", "scissors"].sample

    if human_weapon == computer_weapon
      render "rock_paper_scissors_tie"
    elsif human_weapon == "rock"
      if computer_weapon == "paper"
      render "rock_paper_scissors_lose"
      else
      render "rock_paper_scissors_win"
      end
    elsif human_weapon == "paper"
      if computer_weapon == "scissors"
      render "rock_paper_scissors_lose"
      else
      render "rock_paper_scissors_win"
      end
    elsif human_weapon == "scissors"
      if computer_weapon == "rock"
      render "rock_paper_scissors_lose"
      else
      render "rock_paper_scissors_win"
      end
    end

  end

end























