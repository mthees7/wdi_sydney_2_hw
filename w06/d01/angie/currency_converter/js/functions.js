/* Title: Currency Converter App
Objectives:

create and use variables
create and use functions

Find the exchange rate between dollars and pounds

Store the exchange rate in a variable

Converting dollars to pounds:

Store a dollar amount into a variable.
Convert it to pounds and output "$NN is £NN".
Converting pounds to dollars:

Now store a pound amount into a variable.
Convert it to dollar and output "£NN is $NN."
Cleaning it up:

Can you make sure the output is only 2 decimal places?
Refactoring

Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
Do the same for poundsToDollars

var celsiusToFahrenheit = function(celsius) {
  var fahrenheit = (celsius * 9/5 + 32) ;
  var calcelsius = (fahrenheit - 32) * 5/9;
  console.log(fahrenheit)
  console.log(calcelsius)
}

celsiusToFahrenheit(31)

*/

// This is the varible way
// var amount= prompt( " Enter the  Rand amount you wish to exchange?")

//   x = amount
//   var exchange_rate = 0.0618;
//   var result = x * exchange_rate;
//   console.log(" you converted " + x + " Rands, Which gives you " + result + " Pounds");

// var amount= prompt( " Enter the Pound amount you wish to exchange?")

// var x = amount
//   var exchange_rate = 16.1839;
//   var result = x * exchange_rate;
//   console.log(" you converted " + x + "Pounds, Which gives you " + result + "Rands");



// This is the Refactored Functions way
var exchange = prompt("Would you like to A: Convert Rands to Pounds or B: Pounds to Rands?")
var amount= prompt( " Enter the amount you wish to exchange?")



var converter = function(exchange, amount) {
  if (exchange === "A") {
    result = amount * 0.0618;
    console.log(" you converted " + amount + " Rands, Which gives you " + result + " Pounds");
  }
  else if (exchange === "B"){
    result = amount * 16.1839;
    console.log(" you converted " + amount + " Pounds, Which gives you " + result + " Rands");
  }
}

converter(exchange, amount)
