_.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
};


$(document).ready(function () {

  $('#submit').click(function (event) {
    event.preventDefault();

    var title = $('#movierequest').val();

    var data = {
      movierequest: title
    };

    $.get('/movies.json', data, function (result) {
      console.log(result, result.Poster);
      var template = $('#movie_template').html();
      var movie_templater = _.template( template );
      $('#movies').append( movie_templater( result ) );
    });

  });

});