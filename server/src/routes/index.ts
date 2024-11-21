import { Router } from "express";
import fs from 'fs';
import path from 'path';

const router = Router();
const routesPath = __dirname;

// Function to remove file extension
const removeExtension = (fileName: string) => fileName.split('.').shift();

// Read all files in the routes directory
fs.readdirSync(routesPath).filter( fileName => {
    const name = removeExtension(fileName);
    if(name !== 'index') {
        import(path.join(routesPath, fileName)).then( module => {
            router.use(`/${name}`, module.default);
        });
    }
});

export default router;