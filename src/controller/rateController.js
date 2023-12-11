import initModels from "../model/init-models.js";
import sequelize from "../model/connect.js";
import { responeData } from "../config/respone.js";

const model = initModels(sequelize);

export const getRate = async (req, res) => {
  try {
    let data = await model.rate_res.findAll();

    responeData(res, data, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", "that bai", 500);
  }
};

export const addRate = async (req, res) => {
  try {
    let { user_id, res_id, amount } = req.body;

    let data = {
      user_id,
      res_id,
      amount,
      date_rate: new Date(),
    };
    if (amount >= 1 && amount <= 5) {
      model.rate_res.create(data);
      responeData(res, "", "thanh cong", 200);
    } else {
      responeData(res, "", "danh gia phai tu 1 sao den 5 sao", 500);
    }
  } catch (error) {
    responeData(res, "", "that bai" + "", 500);
  }
};

export const getRatebyRes = async (req, res) => {
  try {
    let { res_id } = req.params;

    let data = await model.rate_res.findAll({
      where: {
        res_id,
      },
    });
    responeData(res, data, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", error + "", 500);
  }
};
