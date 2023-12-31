// app.js file
const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const app = express();
require('dotenv').config();

// Body parser middleware
app.use(express.json());
app.use(cors());

// MONGOOSE
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });
    console.log('connected to mongo on: ', process.env.MONGO_URI);

const PORT = process.env.PORT || 3000;

// Root index route
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Books routes setup
const bookController = require('./controllers/books_controller');
app.use('/books', bookController);

// Start the server

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
