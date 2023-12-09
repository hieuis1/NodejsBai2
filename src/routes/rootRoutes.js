import express from "express";
import likeRoute from "./likeRoute.js";

const rootRoutes = express.Router();

rootRoutes.use("/like", likeRoute);

export default rootRoutes;
