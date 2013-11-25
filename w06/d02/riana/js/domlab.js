/*
No homepage is safe from the logo bandit!

Open up www.google.com in Chrome or Firefox, and open up the console.
Find the Google logo and store it in a variable.
Modify the source of the logo IMG so that it's a Yahoo logo instead.
Find the Google search button and store it in a variable.
Modify the text of the button so that it says "Yahooo!" instead.
*/
var yahooLogo = "http://l.yimg.com/ao/i/mp/properties/frontpage/eclipse/img/y7-logo_default.v2retina.png";
var oldLogo = document.getElementById('hplogo').style.backgroundImage = 'url(' + yahooLogo + ')';
var searchbtn = document.getElementById('gbqfsa').innerHTML = 'yahoo';
