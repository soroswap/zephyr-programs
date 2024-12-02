import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import swaggerUi from 'swagger-ui-express';
import routes from './routes';
import { errorHandler } from './middlewares/errorHandler';
import yaml from 'yamljs';
import path from 'path';

dotenv.config();

const port = process.env.PORT || 3000;
const app = express();

app.use(cors());
app.use(express.json());

// Load the Swagger document
const swaggerDocument = yaml.load(path.join(__dirname, 'swagger.yaml'));

const swaggerUiAssetPath = require('swagger-ui-dist').getAbsoluteFSPath();

// Servir los archivos estáticos de Swagger UI
app.use('/api-docs', express.static(swaggerUiAssetPath));

// Swagger UI CSS public URL
const customCssUrl = 'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.1.0/swagger-ui.min.css';

// Serve Swagger UI
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument, { customCssUrl }));

// Route Access
app.use('/api', routes);

app.get('/', (req, res) => {
    res.send('Welcome to the Soroswap Finance API <3 ');
  });

// // Error handler middleware
app.use(errorHandler)

module.exports = app;
