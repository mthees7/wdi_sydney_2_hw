$( document ).ready(function() {


var carousel = document.getElementById('carousel');
var next = document.getElementById('next');
var previous = document.getElementById('previous');

$('#carousel').css('left', '0');
$(".carousel-direction").hide();


$("#window").on("mouseover", function(){
    $(".carousel-direction").show()
});
$("#window").on("mouseout", function(){
    $(".carousel-direction").hide()
});

var slidenext = function() {
  console.log(carousel.style.left)
  $( "#carousel" ).animate({ "left": "-=612px" }, "slow" );
};
var slideprevious = function() {
  console.log(carousel.style.left)
  $( "#carousel" ).animate({ "left": "+=612px" }, "slow" );
};


$( "#next" ).click(slidenext);
$( "#previous" ).click(slideprevious);

// Slides the images to the left or goes back to the first image if it has reached the end
// function toLeft(){
//     console.log('before animate()', $('#carousel').css('left'));
//         left: '+=612px'
//     }

// Slides the images to the right or goes back to the last image if it has reached the end
  // function toRight(){
  //   $('#next').click(function () {
  //     $('#carousel').css('margin-left: -612px');
  //     });
    // }

//Hook up the next and previous buttons to call the toLeft and toRight functions

});