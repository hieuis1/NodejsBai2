import express from "express";
import {
  addLike,
  getLike,
  getLikebyRes,
  unLike,
} from "../controller/likeController.js";

const likeRoute = express.Router();

likeRoute.get("/get-like", getLike);
likeRoute.post("/add-like", addLike);
likeRoute.delete("/un-like", unLike);
likeRoute.get("/get-like-res/:res_id", getLikebyRes);

export default likeRoute;
