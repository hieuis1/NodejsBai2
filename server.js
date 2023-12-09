import express from "express";
import cors from "cors";
import rootRoutes from "./src/routes/rootRoutes.js";
const app = express();
app.use(express.json());
app.use(cors());
app.listen(8080);
app.use(rootRoutes);
