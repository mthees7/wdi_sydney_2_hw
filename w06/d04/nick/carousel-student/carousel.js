carousel.style.marginLeft = 0;

var carouselWidth = $('#carousel').outerWidth();
var windowWidth = $('#window').width();

// Slides the images to the left or goes back to the first image if it has reached the end

 var toLeft = function () {
  if (parseInt($("#carousel").css('left')) < 0) {
    $('#carousel').animate( {
      left: "+=612px"
    });
  } else {
      $('#carousel').animate({
      left: -(carouselWidth - windowWidth)
    });
  };
 }

// Slides the images to the right or goes back to the last image if it has reached the end
// This complicated little line simple calculates the width of the entire carousel and allows the right scroll if there is sufficient width for the window
var toRight = function () {
  if (-parseInt($("#carousel").css('left')) < (carouselWidth - windowWidth)) {
    $('#carousel').animate( {
      left: "-=612px"
    });
  } else {
    $('#carousel').animate({
      left: 0
    });
  };
}

//Hook up the next and previous buttons to call the toLeft and toRight functions

$(document).ready(function() {
  $("#previous").on('click', function() {
    toLeft();
  });

  $("#next").on('click', function() {
    toRight();
  });
});

// Add event listeners for mouseover and mouseexit to change the opacity of the next and previous buttons.
// control by keyboard


// animation
