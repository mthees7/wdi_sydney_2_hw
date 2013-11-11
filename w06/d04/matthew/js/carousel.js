
$("#carousel").css("left",0);



$( "#previous" ).click(function() {
  if (parseInt(($( "#carousel" ).css("left"))) >= 0) {
    $("#carousel").animate({ "left": (-($("#carousel").width() - 612) + 'px') }, "slow" )
  } else {
    $( "#carousel" ).animate({ "left": "+=612px" }, "slow");
  }
});

$( "#next" ).click(function(){
  if (parseInt(($( "#carousel" ).css("left"))) < -612) {
    $("#carousel").animate({ "left": '0px' }, "slow" )
  } else {
    $( "#carousel" ).animate({ "left": "-=612px" }, "slow");
  }

});






// Slides the images to the left or goes back to the first image if it has reached the end
function toLeft(){
}


// Slides the images to the right or goes back to the last image if it has reached the end
function toRight(){
}

//Hook up the next and previous buttons to call the toLeft and toRight functions
