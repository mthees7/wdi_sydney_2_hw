$(document).ready(function () {
  setSecretWord();
  wordDisplay();
  guessesLeft();
  $('#guessButton').click(makeGuess);
  $('#resetButton').click(resetGame);
  $('#giveUpButton').click(giveUpGame);
});


var secretWord =  null;
var guesses = [];
var guessesRemaining = 8;

//-----------------------------------------------
//This section sets up the secret word that needs to be guessed
var wordList = ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'];

var setSecretWord =  function() {
  secretWord = _.sample(wordList);
};

var letters = function () {
  return secretWord.split('');
};

//-----------------------------------------------
//This section displays the letters and/or spaces, letters guessed, and the guesses remaining
var wordDisplay = function () {
  $('#wordString').text(checkGuess());
};

var guessedLettersDisplay = function (g) {
  var $guessedLetters = $('<span />');
  $guessedLetters.text( g );
  $('#guessedLetters').append($guessedLetters);
};

var guessesLeft = function () {
  var $guessesLeft = $('<span />');
  $guessesLeft.text(guessesRemaining);
  $('#guessesLeft').append($guessesLeft);
};

//-----------------------------------------------
//This section is what happens when a guess is made
var makeGuess = function () {
  var guess = ($('#letterField')).val();

  if (guesses.indexOf(guess) >= 0) {
    alert('You have already guessed that letter');
  } else {
    guesses.push(guess);//this will put the numbers in a javascript array
    guessedLettersDisplay(guess);
    guessesRemain();
    wordDisplay();
  };
  $('#letterField').val('');
  $('#letterField').focus();
};

var guessesRemain = function () {
  var $guessesLeft = $('<span />');
  guessesRemaining = (parseInt(guessesRemaining) - 1);
  $guessesLeft.text(guessesRemaining);
  $('#guessesLeft').html($guessesLeft);
};

//-----------------------------------------------
//This section searches to find if the guess is included in the word and checks if the player has won or lost the game
var checkGuess = function () {
  var display_string = _.map(letters(), function (l) {
      if (_.contains(guesses, l)) {
        return l;
      } else {
        return '_';
      }
  }).join('');
  if (display_string === secretWord) {
    alert('You Win!');
  };
  loseGame();
  return display_string;
};

var loseGame = function () {
  if (guessesRemaining === 0){
    $('#wordString').text(secretWord);
    alert('You lose');
    resetGame();         // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  };
};



//-----------------------------------------------
//This section resets the game and allows the player to give up

var resetGame = function () {
  setSecretWord();
  guessesRemaining = 8;
  $('#guessesLeft').empty();
  $('#guessedLetters').html('');
  guesses = [];
  wordDisplay();
  guessesLeft();
  $('#letterField').focus();
  checkGuess();
  $('#wordString').text(secretWord);
};

var giveUpGame = function () {
  $('#wordString').text(secretWord);
  guessesRemaining = 1;
};


// Bugs
// - losing doesn't reset game OR displays word
// - reset makes double guesses left numbers for first try
// -

















