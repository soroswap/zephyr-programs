import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import swaggerUi from 'swagger-ui-express';
import swaggerJsDoc from 'swagger-jsdoc';
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

// Swagger UI CSS public URL
const customCssUrl = 'https://cdnjs.cloudflare.com/ajax/libs/swagger-ui/4.1.0/swagger-ui.min.css';

// Serve Swagger UI
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument, { customCssUrl }));

// Route Access
app.use('/api', routes);

app.get('/', (req, res) => {
    res.send('Welcome to the Soroswap Finance API');
  });


// // Error handler middleware
// app.use(errorHandler)

export default app;