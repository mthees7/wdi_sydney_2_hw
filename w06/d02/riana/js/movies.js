/*
It's like IMDB, but much much smaller!

Create an object to store the following information about your favorite movie:
title (a string), duration (a number), and stars (an array of strings).

Create a function to print out the movie information like so:
"Puff the Magic Dragon lasts for 30 minutes. Stars: Puff, Jackie, Living Sneezes."
*/

var movies = function(title, duration, stars){
  return {
    title: title,
    duration: duration,
    stars: stars,
    information: function(){
                  console.log("The movie " + this.title + " runtime " + this.duration + " mins. Starring " + this.stars);
                }
  }
};

var movie1 = movies('Ted',106,['Mark Wahlberg','Mila Kunis','Seth MacFarlane']);

.foreach(function(element){console.log(element);})