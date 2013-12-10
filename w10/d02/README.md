# Firstly

Write tests (and code to make them pass) to convert CSS hex colours to rgb() values and back.

Support both full colour #123456 and shorthand #ccc.

RGB format should be something like this: rgb(243, 191, 189).

# Bonus the first

Use regular expressions to allow sloppier RGB strings, i.e. these should all produce the same hex code.

    rgb(50, 80, 90)
    rgb(50,80,90)
    rgb(        50,                   80,                  90          )

# Bonus the first and a half

Have your code return the shorthand version of a hex code where appropriate, i.e.

    The colour #ffaa44 could be expressed in shorthand as #fa4

# Bonus the second

Make your hard work available via Rails: give the user a form that lets them convert between formats and hit submit to see the results. You may wish to return the results via AJAX for a nicer user experience.

# Bonus the third

Rewrite your Number converters in Javascript.

Create a single page app with a "range" slider input that lets you enter a number by dragging the slider.

The page should update in realtime to show the corresponding decimal, hex and binary values.