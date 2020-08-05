const router = require("express").Router();

module.exports = (db) => {
  router.get("/users", (request, response) => {
    db.query(
      `
      SELECT bins.name, SUM(user_bins.score)
      FROM user_bins 
      JOIN users ON user_bins.user_id=users.id 
      JOIN bins ON bins.id=user_bins.bin_id
      WHERE users.id=1
      GROUP BY bins.name;
    `
    ).then(({ rows: user }) => {
      response.json(user);
    });
  });

  return router;
};

