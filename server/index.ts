import express from "express";
import cors from "cors";

import pairsRouter from "./routes/pairs";

const app = express();

app.use(cors());
app.use(express.json({ limit: "16kb" }));
app.use(express.urlencoded({ extended: true, limit: "16kb" }))

app.get("/", (req, res) => {
    res.send("Hello World")
})

// Routes
app.use('/api/pairs', pairsRouter);

app.listen(8080, () => {
    console.log("Server is running on port 8080")
})