import { Router } from "express";
import { getHandlerEvents } from "../controllers/eventsController";

const router = Router();

router.get('/', getHandlerEvents);

export default router;

