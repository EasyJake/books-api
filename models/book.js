// models/book.js file

const mongoose = require('mongoose');
const { Schema } = mongoose
// mongoose.connect("mongodb://localhost:27017/booksAPI");

// SCHEMA
const bookSchema = new Schema({
    title: String,
    description: String,
    year: Number,
    quantity: Number,
    imageURL: String,
});

// MODEL AND EXPORT
const Book = mongoose.model('Book', bookSchema);
module.exports = Book;