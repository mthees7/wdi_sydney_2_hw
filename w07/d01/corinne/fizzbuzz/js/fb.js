$(document).ready(function () {
  show_numbers();
});

var numbers = _.range(1, 101);

var show_numbers = function () {
  _.each(numbers, display_number); //Underscore
};

var display_number = function (n) {
  var $num_diplay = $('<div />');
  if (n % 15 === 0) {
    $num_diplay.text( 'FizzBuzz' );
  } else if (n % 5 === 0) {
    $num_diplay.text( 'Buzz' );
  } else if (n % 3 === 0) {
    $num_diplay.text( 'Fizz' );
  } else {
    $num_diplay.text( n );
  };

  $num_diplay.appendTo('body');
};
