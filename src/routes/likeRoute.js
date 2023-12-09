import express from "express";
import { addLike, getLike, unLike } from "../controller/likeController.js";

const likeRoute = express.Router();

likeRoute.get("/get-like", getLike);
likeRoute.post("/add-like", addLike);
likeRoute.delete("/un-like", unLike);

export default likeRoute;
