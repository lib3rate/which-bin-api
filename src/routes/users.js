const router = require("express").Router();

module.exports = (db) => {
  router.get("/users", (request, response) => {
    db.query(
      `
      SELECT users.username, sum(user_bins.score) as score
      FROM user_bins
      JOIN users ON user_id = users.id
      WHERE users.id = 3
      GROUP BY users.username;
    `
    ).then(({ rows: user }) => {
      console.log(user);
      response.json(user);
      // response.json(
      //   users.reduce(
      //     (previous, current) => ({ ...previous, [current.id]: current }),
      //     {}
      //   )
      // );
    });
  });

  return router;
};
