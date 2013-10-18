<!-- [12:26 PM] ll: the point of this lab is to save us having to request the same data from omdbapi again and again
    we look up a movie ONCE and any time we want to view that movie again we retrieve the data from the CSV file
[12:27 PM] Joel Turnbull: updated gist: Hint: A better way to do this might be to save the actual JSON data we get back from omdbapi, if you can find a nice way to do that. -->
<!--

1. When you store the information, don't JSON it (don't run JSON on it), store it exactly as you would get it from HTTParty
because once it is in the file, if you read it out again, it is a string, regardless of what you think
so when you take it out as a string, run JSON string on it
and it will convert it to useful hashes for you
that one took me a long time yesterday afternoon to figure out
i kept thinking that whatever is stored in the file is stored as an array or hash or whatever we had it originally
but the computer doesn't know that, once it's in the file as .txt it's a string

2. With URLs, you'll want to use sinatra's routing system to generate it
I'm still working on how to get that one done, but look at the picture on the whiteboard -->