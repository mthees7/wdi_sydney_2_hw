var game = {
  secretWord: "",
  wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],
  letters: [],
  guesses: [],


  // Selects a random word from the word list sets the secret word
  setSecretWord: function(){
    this.secretWord = _.sample(wordList);
    this.letters = this.secretWord.split('');
  },

  // Returns the secret word with unguessed letters replaced with _
  guess: function (){

  },

  makeGuess: function(letter){

    return _.map(this.letters, function (l) {
      if (_contains(this.guesses, l)) {
        return l;
      } else {
        return '_';
      }
    }).join('');

  }
};

var player = {
  MAX_GUESSES: 8,
  guessedLetters: [],
  // letters: []

  // Takes a new letter as input and updates the game


};