const express = require('express');
const router = express.Router();
const xlmPriceRoutes = require('./users');
const pairsRoutes = require('./users');
const tokenstRoutes = require('./products');
const eventsRoutes = require('./products');

// Use user and product routes
router.use('/', xlmPriceRoutes);
router.use('/pairs', pairsRoutes);
router.use('/tokens', tokenstRoutes);
router.use('/events', eventsRoutes);

module.exports = router;
