import express from "express";
import likeRoute from "./likeRoute.js";
import rateRoute from "./rateRoute.js";
import orderRoute from "./orderRoute.js";

const rootRoutes = express.Router();

rootRoutes.use("/like", likeRoute);
rootRoutes.use("/rate", rateRoute);
rootRoutes.use("/order", orderRoute);

export default rootRoutes;
