var rectangle = {
  length: 4,
  width: 4
};

var triangle = {
  sideA: 3,
  sideB: 4,
  sideC: 4
};

function isSquare(shape){
  if(shape.length === shape.width){
    console.log("This is a square.");
  } else {
    console.log("This is not a square.");
  }
}

function r_area(rectangle){
  console.log("The area is " + parseInt(rectangle.length * rectangle.width);
}

function perimeter(shape){
  console.log("The perimeter is " + (2 * (shape.width + shape.height)));
}

function isEquilateral(shape){
  if(shape.sideA === shape.sideB && shape.sideB === shape.sideC){
    return true;

  } else {
    return false;
  }
}

function isIsosceles(shape){
  if(shape.sideA != shape.sideB || shape.sideA != shape.sideC){
    return true;
  } else {
    return false;
  }
}

function t_area(shape){
 var s = ((shape.sideA + shape.sideB + shape.sideC) /2);
 var a =  Math.SQRT2(s (s - shape.sideA)(s - shape.sideB)(s - shape.sideC) );
 console.log('The triangle area is ' + a);
}

function isObtuse(shape){
  if (!isEquilateral && !isIsosceles){
    return true;
  } else {
    return false;
  }

}

isSquare(rectangle);
r_area(rectangle);
perimeter(rectangle);
isEquilateral(triangle);
isIsosceles(triangle);
t_area(triangle);
isObtuse(triangle);