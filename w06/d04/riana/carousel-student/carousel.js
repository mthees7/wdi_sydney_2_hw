$(document).ready(function(){
  var carousel = document.getElementById('carousel');
  var next = document.getElementById('next');
  var previous = document.getElementById('previous');
  var width = parseInt($("#window").css("width"));
  var this_img = 0;
  var rotate = null
  carousel.style.marginLeft = 0;

  //auto scroll when screen is inactive http://jsfiddle.net/tCtJq/
  var waitForInactivity = function (){
    clearTimeout(rotate);
    rotate = setTimeout(autoRotate, 10000);
  }

  var autoRotate = function(){
    toRight();
    waitForInactivity();
  }

  //mouseover event listener to change next and previous button opacity
  $('#next, #previous').mouseover(function(event){
    $(this).addClass('highlighted');
    $(this).css('cursor','pointer');
  });

  $(document).keydown(function(event){
    var code = event.keyCode || event.which;
    if(code == 39){
      toRight();
    } else if (code == 37){
      toLeft();
    }
  });

  //mouseexit event listener to reset the next and previous button opacity
  $('#next, #previous').mouseleave(function(event){
    $(this).removeClass('highlighted');
  });

  // Slides the images to the left or goes back to the first image if it has reached the end
  function toLeft(){
    if(this_img === 0){
      $('#carousel').animate({'margin-left': -(($("img").length - 1) * width) + 'px'}, 3000);
      this_img = ($("img").length - 1);

    } else {
        this_img -= 1;
        $('#carousel').animate({'margin-left': -(this_img * width) + 'px'}, 3000);
    }
  }

  // Slides the images to the right or goes back to the last image if it has reached the end
  function toRight(){
    if(this_img === ($("img").length - 1) ){
      this_img = 0;
      $('#carousel').animate({'margin-left': (this_img * width) + 'px'}, 3000);
    } else {
      this_img += 1;
      $('#carousel').animate({'margin-left': -(this_img * width) + 'px'}, 3000);
    }
  }

  //Hook up the next and previous buttons to call the toLeft and toRight functions
  $('#next').click(function(event){
    toRight();
    waitForInactivity();
  });
  $('#previous').click(function(event){
    toLeft();
    waitForInactivity();
  });
  waitForInactivity();

});