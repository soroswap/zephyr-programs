import { Router } from "express";
import { getHandlerTokens } from "../controllers/tokensController";

const router = Router();

router.get('/', getHandlerTokens);

export default router;