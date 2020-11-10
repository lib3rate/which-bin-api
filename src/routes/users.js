const router = require("express").Router();

module.exports = (db) => {
  router.get("/users", (request, response) => {
    db.query(
      `
      SELECT users.username, user_id, bins.name, sum(user_bins.score)
      FROM user_bins
      JOIN users ON user_bins.user_id = users.id
      JOIN bins ON bins.id = user_bins.bin_id
      WHERE users.id = 3
      GROUP BY users.username, user_id, bins.name;
    `
    ).then(({ rows: user }) => {
      response.json(user);
    });
  });

  router.put("/users", (request, response) => {
    const { username, email, password } = request.body.item;

    db.query(
      `
      INSERT INTO users (username, email, password)
      VALUES ($1::string, $2::string, $3::integer);
      `,
      [username, email, password]
    )
      .then(() => {
        response.status(204).json({});
        insertItem(request.body.item);
      })
      .then(() => {
        db.query(
          `
          SELECT users.username, user_bins.user_id, sum(user_bins.score) as score
          FROM user_bins
          JOIN users ON user_id = users.id
          GROUP BY user_bins.user_id, users.username
          ORDER BY score DESC;
        `
        ).then(({ rows: user_bins }) => {
          response.json(user_bins);
        });
      });
    })
  return router;
};

