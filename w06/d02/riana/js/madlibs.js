<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8" />
  <title></title>
 </head>
 <body>

 <h1>Mad Libs</h1>

 <ul>
  <li>Noun: <input type="text" id="noun">
  <li>Adjective: <input type="text" id="adjective">
  <li>Someone's Name: <input type="text" id="person">
 </ul>

 <button id="lib-button">Lib it!</button>

 <div id="story"></div>
 <script>
    var libButton = document.getElementById('lib-button');
    var storyDiv = document.getElementById('story');
    function makeMadLib(){
      var noun = document.getElementById('noun');
      var adj = document.getElementById('adjective');
      var name = document.getElementById('person');

      storyDiv.innerHTML = (name + " really likes " + adj + " " + noun);
    }
    libButton.addEventListener('click', makeMadLib, false);
 </script>
 </body>
</html>