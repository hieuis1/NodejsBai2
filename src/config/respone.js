export const responeData = (res, data, message, code) => {
  const respone = {
    content: data,
    message,
    date: new Date(),
  };
  res.status(code).send(respone);
};
