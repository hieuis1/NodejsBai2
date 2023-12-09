import initModels from "../model/init-models.js";
import sequelize from "../model/connect.js";

const model = initModels(sequelize);

export const getLike = async (req, res) => {
  try {
    let data = await model.like_res.findAll();
    res.status(200).send(data);
  } catch (error) {
    res.status(500).send("that bai");
  }
};

export const addLike = async (req, res) => {
  try {
    let { user_id, res_id } = req.body;
    let data = { user_id, res_id, date_like: new Date() };

    model.like_res.create(data);
    res.status(200).send("thanh cong");
  } catch (error) {
    res.status(500).send("that bai");
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
    res.status(200).send("thanh cong");
  } catch (error) {
    res.status(500).send("that bai");
  }
};
