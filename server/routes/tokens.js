const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('Tokens list');
});

module.exports = router;