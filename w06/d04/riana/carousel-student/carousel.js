$(document).ready(function(){
  var carousel = document.getElementById('carousel');
  var next = document.getElementById('next');
  var previous = document.getElementById('previous');
  var width = 612;
  var current_width = 0;
  var this_img = 0;

  carousel.style.marginLeft = 0;

  //mouseover event listener to change next and previous button opacity
  $('#next, #previous').mouseover(function(event){
    $(this).addClass('highlighted');
  });

  //mouseexit event listener to reset the next and previous button opacity
  $('#next, #previous').mouseleave(function(event){
    $(this).removeClass('highlighted');
  });

  //right arrow key press event listener to change the next button opacity
  $('#next').keydown(function(event){
    if(event.keyCode === 39){
      $(this).addClass('highlighted');
    }
  });

  //left arrow key press event listent to change the previous button opacity

  // Slides the images to the left or goes back to the first image if it has reached the end
  function toLeft(){
    if(current_width === 0){
      current_width = -1224;
      $('#carousel').animate({'margin-left': (($("img").length - 1) * -612) + 'px'}, 3000);
    } else {
        current_width += width;
        $('#carousel').animate({'margin-left': (current_width) + 'px'}, 3000);
    }
  }

  // Slides the images to the right or goes back to the last image if it has reached the end
  function toRight(){
    if(current_width === -1224 ){
      current_width = 0;
      $('#carousel').animate({'margin-left': current_width + 'px'}, 3000);
    } else {
      current_width -= width;
      $('#carousel').animate({'margin-left': current_width + 'px'}, 3000);
    }
  }

  //Hook up the next and previous buttons to call the toLeft and toRight functions
  $('#next').click(function(event){
    toRight();
  });
  $('#previous').click(function(event){
    toLeft();
  });

});