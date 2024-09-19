import express from "express";
import cors from "cors";

const app = express();

app.use(cors());
app.use(express.json({ limit: "16kb" }));
app.use(express.urlencoded({ extended: true, limit: "16kb" }))

app.get("/", (req, res) => {
    res.send("Hello World")
})

app.listen(8080, () => {
    console.log("Server is running on port 8080")
})