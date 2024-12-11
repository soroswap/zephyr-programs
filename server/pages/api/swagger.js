const swaggerJSDoc = require('swagger-jsdoc')

const swaggerDefinition = {
    openapi: '3.0.0',
    info: {
        title: 'API Documentation',
        version: '1.0.0',
        description: 'This is the API documentation for my Next.js application',
    },
}

const options = {
    swaggerDefinition,
    apis: ['src/pages/api/*.js'],
}

const swaggerSpec = swaggerJSDoc(options)

export default function handler(req, res) {
    res.status(200).json(swaggerSpec)
}
