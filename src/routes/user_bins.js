const router = require("express").Router();

module.exports = (db) => {
  router.get("/user_bins", (request, response) => {
    db.query(
      `
        SELECT *
        FROM user_bins
        JOIN users ON user_id = users.id
        ORDER BY score DESC
        LIMIT 10;
      `
      // `
      //   SELECT users.username, user_bins.id, sum(user_bins.score) as score
      //   FROM user_bins
      //   JOIN users ON user_id = users.id
      //   GROUP BY user_bins.user_id
      //   ORDER BY score DESC
      //   LIMIT 10;
      // `
    ).then(({ rows: user_bins }) => {
      response.json(
        user_bins.reduce(
          (previous, current) => ({ ...previous, [current.id]: current }),
          {}
        )
      );
    });
  });

  return router;
};
