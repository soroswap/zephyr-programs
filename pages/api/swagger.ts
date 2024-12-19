import { NextApiRequest, NextApiResponse } from "next";
import swaggerPaths from "utils/swagger/swagger";
const swaggerJSDoc = require('swagger-jsdoc')

const swaggerDefinition = {
    openapi: '3.0.0',
    info: {
        title: 'API Documentation',
        version: '1.0.0',
        description: 'This is the API documentation for my Next.js application',
    },
    // servers: [
    //     {
    //         url: 'http://localhost:3100',
    //     },
    // ],
    ...swaggerPaths
}

const options = {
    swaggerDefinition,
    apis: ['./pages/api/**/*.{ts,tsx}'],
}

const swaggerSpec = swaggerJSDoc(options)

export default function handler(req: NextApiRequest, res: NextApiResponse) {
    try{
        res.status(200).json(swaggerSpec)
    } catch (error) {
        console.error('Swagger spec error:', error);
        res.status(500).json({ error: 'Unable to generate Swagger spec' });
    }
}
