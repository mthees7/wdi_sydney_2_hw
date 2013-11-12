/* 1. FizzBuzz with Underscore

###Goal: Get used to looking at underscore documentation and using underscore methods.

### FizzBuzz:
* Write a program that prints the numbers from 1 to 100.
  But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz".
  For numbers which are multiples of both three and five print "FizzBuzz".
* FizzBuzz is a common interview screener for programming interviews.
* Your job is to implement a solution using underscore methods.

#### Bonus: Complete this exercise in Ruby.
*/

/*Javascript version
for(var i = 1; i <= 100; i++){
  if(((i % 3) === 0) && ((i % 5) === 0)){
    console.log("FizzBuzz");
  } else if ((i % 3) === 0) {
    console.log("Fizz");
  } else if ((i % 5) === 0) {
    console.log("Buzz");
  } else {
    console.log(i);
  }
}*/

/*Underscore version*/
var number = _.range(1,101);
var check_number = function (n){
  if(((n % 3) === 0) && ((n % 5) === 0)){
    console.log("FizzBuzz");
  } else if ((n % 3) === 0) {
    console.log("Fizz");
  } else if ((n % 5) === 0) {
    console.log("Buzz");
  } else {
    console.log(n);
  }
};
_.each(number, check_number);
