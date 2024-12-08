// index.js
const express = require('express')
const routes = require('./routes');

const app = express()
const PORT = 4000

app.use('/api', routes);

app.listen(PORT, () => {
  console.log(`API listening on PORT ${PORT} `)
})

app.get('/', (req, res) => {
  res.send('XLM Prices')
})

// Export the Express API
module.exports = app