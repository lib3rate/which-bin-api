const sgMail = require('@sendgrid/mail');
sgMail.setApiKey('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');
// sgMail.setApiKey(process.env.SENDGRID_API_KEY);
console.log(process.env.SENDGRID_API_KEY)
// const apiKey = process.env.SENDGRID_API_KEY;
const msg = {
  to: 'julian.m.bustos@gmail.com',
  from: 'samarahjhodge@gmail.com', // Use the email address or domain you verified above
  subject: 'Score Update from [which-bin]',
  text: `Your new score is 200 you have reached maximum treeness`,
  html: `<strong>Your new score is 200 you have reached maximum treeness</strong>
  <img src="https://cdn.dribbble.com/users/1616426/screenshots/4846715/the-forest.jpg" width="500" height="600">
  `,

};
//ES6
sgMail
  .send(msg)
  .then(() => {}, error => {
    console.error(error);

    if (error.response) {
      console.error(error.response.body)
    }
  });
//ES8
// (async () => {
//   try {
//     await sgMail.send(msg);
//   } catch (error) {
//     console.error(error);

//     if (error.response) {
//       console.error(error.response.body)
//     }
//   }
// })();