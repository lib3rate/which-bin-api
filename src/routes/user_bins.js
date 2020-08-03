const router = require("express").Router();

module.exports = (db) => {
  router.get("/user_bins", (request, response) => {
    db.query(
      `
      SELECT * FROM user_bins;
    `
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
