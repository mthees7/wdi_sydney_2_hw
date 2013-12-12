// I still need to re-do hangman - this is a code reference for myself based on Rianas submitted code.

$(document).ready(function() {
  $('#letterGuess').click(userGuess);

  var word {
    secretWord: '',
    wordList = ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'];
    //select a random word for the game
    setSecretWord: function(word) {
    this.secretWord = _.sample(wordList);
    this.letters = this.secretWord.split('');
  };

  // create a string with correct guesses and a _ for other letters
  // create an array of guessed letters not in the secret word
    gameInProgress: function(guessedLetters){
    var result = {
      matched: "",
      unmatched: [],
      remaining: []
  }
    _.each(this.secretWord.split(''), function(letter){
    if(_.contains(guessedLetters, letter)){
      result.matched += letter;
    } else {
      result.matched += ' _ ';
      result.remaining.push(letter);
      result.unmatched = _.difference(guessedLetters, word.secretWord);
    }
  });
    //console.log(result);
    return result;
  }
};

var player = {
  MAX_GUESSES: 8,
  guessedLetters: [],
  guessCount: 0,

  // Takes a new letter as input and updates the game
  makeGuess: function(letter){
      $('#letterField').val('');
      this.guessedLetters.push(letter);
      var result = word.checkLetters(this.guessedLetters);

      if(this.guessCount === 8){
        game.giveUp();
        $("#letterField").prop('disabled', true);
        this.gameStatus(result.matched);
      } else {
        this.guessCount += 1;
        game.updateDisplay(result.matched, this.guessedLetters, (this.MAX_GUESSES - this.guessCount));
        if (!_.contains(result.matched,'_')){
          this.gameStatus(result.matched);
        }
      }
  };

// Check if the player has won and end the game if so
  gameStatus: function(wordString){
    if(_.contains(wordString, '_')){
      $('#outcome').show();
      $('#gamePlayArea').hide();
    } else {
      $('#outcome').show();
      $('#gamePlayArea').hide();
    }
  }
};

var game = {
  // Resets the game
  resetGame: function(){
    //console.log("resetGame called");
    word.setSecretWord();
    player.guessedLetters = [];
    player.guessCount = 0;
    this.updateDisplay('','','');
    $("#letterField").prop('disabled', false);
    $('#letterField').val('');
  },

  // Reveals the answer to the secret word and ends the game
  giveUp: function(){
    $('#wordString').text(word.secretWord);
    $("#letterField").prop('disabled', true);
  },

  // Update the display with the parts of the secret word guessed, the letters guessed, and the guesses remaining
  updateDisplay: function(secretWordWithBlanks, guessedLetters, guessesLeft){
    //console.log("so far" + secretWordWithBlanks, "guessed" + guessedLetters, "Left" + guessesLeft);
    $('#guessedLetters').text(guessedLetters);
    $('#guessesLeft').text(guessesLeft);
    $('#wordString').text(secretWordWithBlanks);
  }
};

window.onload = function(){
  // Start a new game
  $('#outcome').hide();
  game.resetGame();
  $('#letterField').focus();

  // Add event listener to the letter input field to grab letters that are guessed
  $('#letterField').keypress(function(event){
     //get the letter entered
     var letter = String.fromCharCode(event.keyCode);
     //check if the guess is correct
     player.makeGuess(letter);

  });

  // Add event listener to the reset button to reset the game when clicked
  $('#resetButton').click(function(event){
    game.resetGame();
    //clear the field for the next guess
  });

  // Add event listener to the give up button to give up when clicked
  $('#giveUpButton').click(function(event){
    game.giveUp();
  });

  $('#newButton').click(function(event){
    game.resetGame();
    $('#outcome').hide();
    $('#gamePlayArea').show();
  });
};