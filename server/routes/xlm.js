const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('XLM Price');
});

module.exports = router;