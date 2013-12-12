/*
Keep track of which books you read and which books you want to read!

Create an array of objects, where each object describes a book and has properties for the
title (a string), author (a string), and alreadyRead (a boolean indicating if you read it yet).
Iterate through the array of books. For each book, log the book title and book author like so: "The Hobbit by J.R.R. Tolkien".
Now use an if/else statement to change the output depending on whether you read it yet or not.
If you read it, log a string like 'You already read "The Hobbit" by J.R.R. Tolkien',
and if not, log a string like 'You still need to read "The Lord of the Rings" by J.R.R. Tolkien.'
*/
var readingList = function(title, author, alreadyRead){
  return{
    title: title,
    author: author,
    alreadyRead: alreadyRead,
    summary: function(){
      return '"' + this.title + '"' + " by " + this.author;
    }
  }
};

var books = [
  book1 = readingList("The History of Almost Everything", "Bill Bryson", true),
  book2 = readingList("Travelling Without Moving","Alain De Button", true),
  book3 = readingList("A Brief Histor of Time","Stephen Hawking", true),
  book4 = readingList("Catcher in the Rye","J.D. Salinger", false),
  book5 = readingList("The Design of Everyday Things","Don Norman",false)
];

for(var i = 0; i < books.length; i++){
  if (books[i].alreadyRead === true) {
    console.log('You already read ' + books[i].summary());
  } else {
    console.log('You still need to read ' + books[i].summary());
  }
}