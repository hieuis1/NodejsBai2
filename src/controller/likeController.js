import initModels from "../model/init-models.js";
import sequelize from "../model/connect.js";
import { responeData } from "../config/respone.js";

const model = initModels(sequelize);

export const getLike = async (req, res) => {
  try {
    let data = await model.like_res.findAll();
    responeData(res, data, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", "that bai", 500);
  }
};

export const addLike = async (req, res) => {
  try {
    let { user_id, res_id } = req.body;
    let data = { user_id, res_id, date_like: new Date() };

    model.like_res.create(data);
    responeData(res, data, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", "that bai", 500);
  }
};
export const unLike = async (req, res) => {
  try {
    let { user_id, res_id } = req.body;
    let data = await model.like_res.destroy({
      where: {
        user_id,
        res_id,
      },
    });
    responeData(res, data, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", "that bai", 500);
  }
};

export const getLikebyRes = async (req, res) => {
  try {
    const { res_id } = req.params;
    let data = await model.like_res.findAll({
      where: {
        res_id,
      },
      include: ["user"],
    });
    let content = {
      likeAmonut: data.length,
      data,
    };
    responeData(res, content, "thanh cong", 200);
  } catch (error) {
    responeData(res, "", "that bai", 500);
  }
};
