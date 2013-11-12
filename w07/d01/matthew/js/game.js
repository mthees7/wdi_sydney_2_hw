var word = {
  secretWord: "",
  wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],

  // Selects a random word from the word list sets the secret word
  setSecretWord: function(){
    secretWord = _.sample(this.wordList)
    return secretWord
  },

  // Takes an array of letters as input and returns an array of two items:
  // 1) A string with the parts of the secret word that have been guessed correctly and underscore for the parts that haven't
  // 2) An array of all the guessed letters that were not in the secret word
  checkLetters: function(guessedLetters){

  }
};

//===================================
$(document).ready(function () {
  var $answer = $('<div />');
  $answer.addClass('answer');
  $answer.text(word.setSecretWord())
  $('#theWord').append($answer)
});
//===================================


var displayGuess = function(guess) {
  var $box = $('<div />');
  $box.addClass('box');
  $box.text(guess);
  $('#guessedLetters').append($box);

  $('#guessesLeft').empty();
  var $guesses = $('<div />');
  $guesses.addClass('numbGuesses');
  $guesses.text(player.guessesLeft);
  $('#guessesLeft').append($guesses);
};




var player = {
  MAX_GUESSES: 8,
  guessesLeft: 7,
  guessedLetters: [],

  // Takes a new letter as input and updates the game
  makeGuess: function(letter){
    var guess = $('#letterField').val();
    player.guessedLetters.push(guess);
    displayGuess(guess);
    player.guessesLeft = (player.guessesLeft - 1)
    $('#letterField').val('');
    $('#letterField').focus();
  },

  // Check if the player has won and end the game if so
  checkWin: function(wordString){},

  // Check if the player has lost and end the game if so
  checkLose: function(wrongLetters){}
};

var game = {
  // Resets the game
  resetGame: function(){},

  // Reveals the answer to the secret word and ends the game
  giveUp: function(){},

  // Update the display with the parts of the secret word guessed, the letters guessed, and the guesses remaining
  updateDisplay: function(secretWordWithBlanks, guessedLetters){}
};



window.onload = function(){
  // Start a new game
  $('#guess').click(player.makeGuess);
  // Add event listener to the letter input field to grab letters that are guessed
  // Add event listener to the reset button to reset the game when clicked
  // Add event listener to the give up button to give up when clicked
};