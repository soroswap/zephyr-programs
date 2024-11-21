import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import swaggerUi from 'swagger-ui-express';
import swaggerJsDoc from 'swagger-jsdoc';
import routes from './routes';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

// swagger config
const swaggerOptions = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Zephyr Programs API',
            version: '1.0.0',
            description: 'API to get information from Soroswap, Phoenix and Aqua'
        },
    },
    apis: ['./src/routes/*.ts'],
};

const swaggerDocs = swaggerJsDoc(swaggerOptions);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocs));

// Access routes
app.use('/api', routes);

export default app;