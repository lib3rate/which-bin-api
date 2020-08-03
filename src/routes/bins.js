const router = require("express").Router();

module.exports = (db) => {
  router.get("/bins", (request, response) => {
    db.query(
      `
      SELECT * FROM bins;
    `
    ).then(({ rows: bins }) => {
      response.json(
        bins.reduce(
          (previous, current) => ({ ...previous, [current.id]: current }),
          {}
        )
      );
    });
  });
  return router;
};
