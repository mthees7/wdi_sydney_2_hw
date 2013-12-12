/* JavaScript Calculator

Create a calculator in JavaScript.

Requirements

Prompt the user to enter an operator and two operands.
Support the following operations: addition, subtraction, multiplication, and division.
Output may appear in the console or in an alert.
Bonus

Support the modulus operator.
Support the square root operator.
Support more than two operands (hint: array)

*/

var operator = prompt("Please select on of the following: would you like to ? subtract - , add + , multiply *, divide /");
var num1 = prompt("What is your first number?");
var num2 = prompt("What is the second number?");

var calculator = function(num1, num2, operator) {

  if (operator === "+" || operator === "add"){

    var result = num1 + num2;
    console.log( num1 + " + " + num2 + " = " + result );
  }

  else if (operator === "-" || operator === "subtract"){

    var result = num1 - num2;
    console.log( num1 + " - " + num2 + " = " + result );
  }

  else if (operator === "/" || operator === "divide"){

    var result = num1 / num2 ;
    console.log( num1 + " / " + num2 + " = " + result );
  }

  else if (operator === "*" || operator === "multiply"){

    var result = num1 * num2;
    console.log( num1 + " * " + num2 + " = " + result );
  }

}
calculator(num1, num2, operator)