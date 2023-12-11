import express from "express";
import {
  addRate,
  getRate,
  getRatebyRes,
} from "../controller/rateController.js";

const rateRoute = express.Router();

rateRoute.get("/get-rate", getRate);
rateRoute.post("/add-rate", addRate);
rateRoute.get("/get-rate-res/:res_id", getRatebyRes);

export default rateRoute;
