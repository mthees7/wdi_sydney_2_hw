$(document).ready(function () {
  $('#add_color').click(add_color);
  $('#clear').click(clear_colors);

  $('#colors').on('click', '.box', select_color);
  $('#canvas').on('mouseover', '.pixel', hover_paint);
  $('#canvas').on('click', '.pixel', paint);
  // $('#canvas').on('mouseup', '.pixel', stop_painting);

  $('#add_img').click(add_image);

  create_pixels(5000);
});

var add_color = function () {
  var color = $('#color').val();
  var $box = $('<div />').addClass('box');
  $box.css({
    backgroundColor: color
  });
  $('#colors').prepend($box);
  $('#color').focus().val('#ffffff');
};

var select_color = function () {
    var $box = $(this);
    var color = $box.css('background-color');
    $('#selected').css('background-color', color);
};


//------------------------------


var hover_paint = function (event) {
  if (event.ctrlKey) {
    var color = $('#selected').css('background-color');
    $(this).css('background-color', color);
  }
};

var paint = function (event) {
    var color = $('#selected').css('background-color');
    $(this).css('background-color', color);
};



//------------------------

var clear_colors = function () {
  $('#colors').empty();
  $('#selected').css('background-color', '#ffffff');
};

var create_pixels = function (n) {
  _(n).times(function () {
    var $pixel = $('<div />').addClass('pixel');
    $pixel.appendTo('#canvas');
  });
};

//Check if image exists
var image_exist = function () {

};

//load image behind canvas
var img_to_canvas = function () {
  if (image_exist) {
    var $img_canvas =  $('.thumbnail:last').clone().addClass('image_canvas').removeClass('thumbnail');
  $('#canvas').prepend($img_canvas);


  }
};


var add_image = function () {
  var img_src = $('#img_src').val();
  var $img_thumb = $('<img />', {
    'src': img_src,
    'class': 'thumbnail'
  });
  $('#img_thumb_display').append($img_thumb);

  $('#img_src').val('');
  img_to_canvas();

};



// To-Do
// make sure you undrstand!!!!! This is the MOST important
// a box at top where you can paste url
// that image should apear behind the boxes (absolute posotioning)
// figure out how to make it so you hold down alt
// if you understand everything, make it super fancy
//   maybe add animation
//   maybe save the image



















