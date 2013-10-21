class GamesController < ApplicationController
  def magic8
  end


  def magic8ball_answer
    ball_answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

    @answer = ball_answers.sample

  end


  def randomnumber
  end


  def randomnumber_answer
    array = (1..9).to_a
    @random = array.sample

    if params[:guess].to_i == @random
      render 'correct_guess'
    else
      render 'incorrect_guess'
    end
  end


  def rockpaperscissors
  end


  def rockpaperscissors_answer
    rails = ["Rock", "Paper", "Scissors"]
    @rails_choice = rails.shuffle.first

    case params[:user_selection]

      when "Rock"
        if @rails_choice == "Rock"
          render "you_tie"
        elsif @rails_choice == "Paper"
          render "you_lose"
        else
          render "you_win"
        end
      when "Paper"
        if @rails_choice == "Paper"
          render "you_tie"
        elsif @rails_choice == "Scissors"
          render "you_lose"
        else
          render "you_win"
        end
      when "Scissors"
        if @rails_choice == "Scissors"
          render "you_tie"
        elsif @rails_choice == "Rock"
          render "you_lose"
        else
          render "you_win"
        end
    end
  end


end