const sgMail = require("@sendgrid/mail");
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
      .then(() => {
        db.query(
          `
          SELECT user_id, users.email, bins.name, sum(user_bins.score)
          FROM user_bins
          JOIN users ON user_bins.user_id = users.id
          JOIN bins ON bins.id = user_bins.bin_id
          WHERE users.id = 3
          GROUP BY user_id, bins.name, users.email;
        `
        ).then(({ rows: user }) => {
          let total = 0;
          for (let bin of user) {
            total += Number(bin.sum);
          }

          // ----------- commented out so it won't run everytime -------------------

          // if (total >= 60) {
          //   sgMail.setApiKey(process.env.SENDGRID_API_KEY);

          //   console.log("inside email sending");

          //   const msg = {
          //     to: "samarahjhodge@gmail.com",
          //     from: "julian.m.bustos@gmail.com", // Use the email address or domain you verified above
          //     subject: "Score Update from [which-bin]",
          //     text: `Your new score is 200 you have reached maximum treeness`,
          //     html: `<strong>Your new score is 200 you have reached maximum treeness</strong>
          //   <img src="https://cdn.dribbble.com/users/1616426/screenshots/4846715/the-forest.jpg" width="500" height="600">
          //   <img src="/images/badge.png" width="500" height="600">
          //   `,
          //   };
          //   //ES6
          //   sgMail.send(msg).then(
          //     () => {},
          //     (error) => {
          //       console.error(error);

          //       if (error.response) {
          //         console.error(error.response.body);
          //       }
          //     }
          //   );
          // }

          console.log("total", total);
        });
      })
      .catch((error) => console.log(error));
  });

  return router;
};
