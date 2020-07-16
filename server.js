'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// Environment variables
const LOCATION = process.env.LOCATION;

// Arguments
const FIRSTNAME = process.argv[2];
const LASTNAME = process.argv[3];

// App
const app = express();
app.get('/', (req, res) => {
  res.send(`Hello ${FIRSTNAME} ${LASTNAME} from ${LOCATION}`);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
