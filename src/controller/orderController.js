import { responeData } from "../config/respone.js";
import sequelize from "../model/connect.js";
import initModels from "../model/init-models.js";

const model = initModels(sequelize);

export const getOrder = async (req, res) => {
  try {
    let data = await model.order.findAll();
    responeData(res, data, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", "thanh cong", 500);
  }
};

export const addOrder = async (req, res) => {
  try {
    let { user_id, food_id, amount, arr_sub_id } = req.body;
    let data = await model.order.findOne({
      order: [["code", "DESC"]],
      limit: 1,
    });
    let code = parseInt(data.code.substring(5), 10) + 1;
    let newCode = "ORDER" + code.toString();
    let content = {
      user_id,
      food_id,
      amount,
      arr_sub_id,
      code: newCode,
    };
    if (amount > 0) {
      model.order.create(content);
      responeData(res, "", "thanh cong", 200);
    } else {
      responeData(res, "", "so luong ko hop le", 500);
    }
  } catch (error) {
    responeData(res, "", "that bai", 500);
  }
};
