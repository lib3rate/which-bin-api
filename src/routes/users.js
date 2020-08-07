const router = require("express").Router();

module.exports = (db) => {
  router.get("/users", (request, response) => {
    db.query(
      `
      SELECT user_id, bins.name, sum(user_bins.score)
      FROM user_bins
      JOIN users ON user_bins.user_id = users.id
      JOIN bins ON bins.id = user_bins.bin_id
      WHERE users.id = 3
      GROUP BY user_id, bins.name;
    `
    ).then(({ rows: user }) => {
      console.log(user);
      response.json(user);
    });
  });

  return router;
};

