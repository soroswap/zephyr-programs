import { Router } from "express";
import { getHandlerPairs } from "../controllers/pairsController";

const router = Router();

router.get('/', getHandlerPairs);

export default router;