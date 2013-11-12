//TO DOD
//do button mouse overs to change the cursor

var word = {
  secretWord: "",
  wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],

  // Selects a random word from the word list sets the secret word
  setSecretWord: function(){
    return this.secretWord = _.sample(this.wordList);
  },

  // Takes an array of letters as input and returns an array of two items:
  // 1) A string with the parts of the secret word that have been guessed correctly and underscore for the parts that haven't
  // 2) An array of all the guessed letters that were not in the secret word
  checkLetters: function(guessedLetters){
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
     if(this.guessCount === 8){
      this.checkLose();
     } else {
        this.guessCount += 1;
        this.guessedLetters.push(letter);
        var result = word.checkLetters(this.guessedLetters);
        game.updateDisplay(result.matched, this.guessedLetters, (this.MAX_GUESSES - this.guessCount));
     }
  },

  // Check if the player has won and end the game if so
  checkWin: function(wordString){
    console.log("You win");
  },

  // Check if the player has lost and end the game if so
  checkLose: function(wrongLetters){

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
  },

  // Reveals the answer to the secret word and ends the game
  giveUp: function(){
    $('#wordString').text(word.secretWord);
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
  game.resetGame();
   $('#letterField').focus();

  // Add event listener to the letter input field to grab letters that are guessed
  $('#letterField').keypress(function(event){
     //get the letter entered
     var letter = String.fromCharCode(event.keyCode);
     //check if the guess is correct
     player.makeGuess(letter);
     //clear the field for the next guess
     $('#letterField').val('');
     //give the input field focus for the next guess
     $('#letterField').focus();
  });

  // Add event listener to the reset button to reset the game when clicked
  $('#resetButton').click(function(event){
    game.resetGame();
    //clear the field for the next guess
    $('#letterField').val('');
  });

  // Add event listener to the give up button to give up when clicked
  $('#giveUpButton').click(function(event){
    game.giveUp();
     //clear the field for the next guess
     $('#letterField').val('');

  });
};