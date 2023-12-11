import express from "express";
import { addOrder, getOrder } from "../controller/orderController.js";

const orderRoute = express.Router();

orderRoute.get("/get-order", getOrder);
orderRoute.post("/add-order", addOrder);

export default orderRoute;
