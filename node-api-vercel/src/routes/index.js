const express = require('express');
const router = express.Router();

const pairsRoutes = require('./pairs');
const eventsRoutes = require('./events');
const tokensRoutes = require('./tokens');

// Use user and product routes
router.use('/pairs', pairsRoutes);
router.use('/events', eventsRoutes);
router.use('/tokens', tokensRoutes);

module.exports = router;