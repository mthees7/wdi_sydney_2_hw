_.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
};

$(document).ready(function () {

  $('form').submit (function (event) {
    event.preventDefault()

    var data = {
      title: $('#title').val()
    }

    $.get('/movie.json', data, function (result) {
      var template = $('#movie_template').html();
      var movie_templater = _.template( template );
// is movie_templater a function? what is it doing?
      $('#movie').html( movie_templater( result.movie ) );
    });

  });

});

