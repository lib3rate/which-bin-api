const router = require("express").Router();

module.exports = (db, insertItem) => {
  router.get("/user_bins", (request, response) => {
    db.query(
      `
        SELECT users.username, user_bins.user_id, sum(user_bins.score) as score
        FROM user_bins
        JOIN users ON user_id = users.id
        GROUP BY user_bins.user_id, users.username
        ORDER BY score DESC
        LIMIT 10;
      `
    ).then(({ rows: user_bins }) => {
      response.json(user_bins);
    });
  });

  router.put("/user_bins", (request, response) => {
    // if (process.env.TEST_ERROR) {
    //   setTimeout(() => response.status(500).json({}), 1000);
    //   return;
    // }

    const { userId, binId, score } = request.body.item;

    db.query(
      `
        INSERT INTO user_bins (user_id, bin_id, score)
        VALUES ($1::integer, $2::integer, $3::integer);
      `,
      [userId, binId, score]
    )
      .then(() => {
        response.status(204).json({});
        insertItem(request.body.item);
      })
      .catch(error => console.log(error));
  });

  return router;
};
