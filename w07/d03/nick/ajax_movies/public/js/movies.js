_.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
};

$(document).ready(function () {
    $('#movie_link').click(function (event) {
    event.preventDefault();

    var data = {
      movie_name: $('#movie_name').val()
    };

    $.get ('/movie.json', data, function(result) {
      console.log(result)
      var template = $('#movie_template').html();
      var movie_templater = _.template( template );
      $('#movie').html( movie_templater( result ) );
    });
  });
});