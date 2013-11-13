_.each(_.range(1, 101), function(num) {
    var number = '';
    if (num % 3 === 0)
        str = 'Fizz';
    if (num % 5 === 0)
        str += 'Buzz';
    if (_.isEmpty(str))
        str = num;
    document.getElementById('helloWorld').innerHTML += str + '<br>';
});