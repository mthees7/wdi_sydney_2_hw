
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

// COPYRIGHT BITCHES





