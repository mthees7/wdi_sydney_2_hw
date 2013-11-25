var subway = {
  NLine: ['Times Square','34th','28th on the N','23rd on the N','Union Square','8th on the N'],
  LLine: ['8th','6th','Union Square','3rd','1st'],
  SixLine: ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']
};
var interchange = "Union Square";

var startLine = 'NLine';
var startStation = startLine[0];
var startIndex = startLine['TimeSquare'];

var endLine = 'NLine';
var endStation = endLine[subway.NLine.length -1];
var endIndex = endLine['8th on the N'];

var route = function routeStations(startLine, startStation, endLine, endStation, startIndex, endIndex){
              console.log("Stations on your route: ");

              if(startLine === endLine){

                for(var i = startIndex; i <= endIndex; i++){
                  return subway[startLine][i];
                }

              } else {


              }

            }