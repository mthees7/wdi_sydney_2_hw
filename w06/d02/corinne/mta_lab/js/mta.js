
// Get the program to work for a single line before trying to tackle multiple lines.

// Don't worry about user input. Start off by just hardcoding your stop and line choices in local variables.

// Remember, you've done this in Ruby before. Look at your code and figure out how to do it in JavaScript.

// Consider diagraming the lines by sketching out the subway lines and their stops and intersection.

// Make subway lines are keys in a hash, while the values are an array of all the stops on each line.

// The key to the lab is finding the index positions of each stop.
// Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)


var Nline = ["Nts", "N34", "N28", "N23", "Aus", "N08"];
var Lline = ["L08", "L06", "Aus", "L03", "L01"];



var first_stop = prompt("What is your first stop? (Refer to the codes displayed on the page)");
var second_stop = prompt("What is your first stop? (Refer to the codes displayed on the page)");

var first_index = Nline.indexOf(first_stop)
var second_index = Nline.indexOf(second_stop)


var journey = function (first_stop, second_stop) {

  if (first_index <= second_index) {
      var answer = "The stops along your journey are " + Nline.slice(first_index, second_index);
  } else if (first_index >= second_index) {
      var answer = "The stops along your journey are " + Nline.slice(second_index, first_index).reverse();
  }
      alert(answer);
}


journey(first_stop, second_stop);























