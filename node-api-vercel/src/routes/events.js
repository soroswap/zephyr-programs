const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('Events list');
});

module.exports = router;