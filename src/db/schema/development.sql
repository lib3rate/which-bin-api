INSERT INTO users (name, email, password, score)
VALUES
  ('Sylvia Palmer',   'Sylvia.Palmer@erich.biz',  '1234', 0),
  ('Tori Malcolm',    'tori@malcolm.com',         '1234', 0),
  ('Mildred Nazir',   'mildred@nazir.com',        '1234', 0),
  ('Cohana Roy',      'cohana@roy.com',           '1234', 0),
  ('Sven Jones',      'sven@jones.com',           '1234', 0),
  ('Susan Reynolds',  'susan@reynolds.com',       '1234', 0),
  ('Alec Quon',       'alec@quon.com',            '1234', 0),
  ('Viktor Jain',     'victor@jain.com',          '1234', 0),
  ('Lindsay Chu',     'lindsay.chu@email.biz',    '1234', 0),
  ('Samantha Stanic', 'sam.stanic@erich.biz',     '1234', 0);

INSERT INTO recycling (name)
VALUES
  ('Glass'),
  ('Plastic'),
  ('Aluminum'),
  ('Plastic Bottle'),
  ('Plastic Fork'),
  ('Soda Can'),
  ('Book'),
  ('Paper'),
  ('Mason Jar'),
  ('Paper Envelope');
   
INSERT INTO organics (name)
VALUES
  ('banana peals'),
  ('tomatoes'),
  ('egg shells'),
  ('apples'),
  ('chicken bones'),
  ('beef bones'),
  ('coffee grounds'),
  ('cheese'),
  ('fish bones'),
  ('tea bag');

INSERT INTO garbage (name)
VALUES
  ('Fabric'),
  ('Black Plastic Container'),
  ('Hot Drink Cup'),
  ('Wrapping Paper'),
  ('Styrofoam'),
  ('Cigarette Butt'),
  ('Light Bulb'),
  ('Gum Wrapper'),
  ('Straw'),
  ('Milk Box');

-- INSERT INTO user_waste (user_id, recycling_id, organics_id, garbage_id)
-- VALUES
--   -- Sylvia Palmer recycled Plastic bottle
--   (1, 4, NULL, NULL),
--   ('Black Plastic Container'),
--   ('Hot Drink Cup'),
--   ('Wrapping Paper'),
--   ('Styrofoam'),
--   ('Cigarette Butt'),
--   ('Light Bulb'),
--   ('Gum Wrapper'),
--   ('Straw'),
--   ('Milk Box');

-- INSERT INTO user_waste (user_id, organics_id)
-- VALUES
--   -- Sylvia Palmer has Plastic bottle
--   (1, 7),
--   ('Black Plastic Container'),
--   ('Hot Drink Cup'),
--   ('Wrapping Paper'),
--   ('Styrofoam'),
--   ('Cigarette Butt'),
--   ('Light Bulb'),
--   ('Gum Wrapper'),
--   ('Straw'),
--   ('Milk Box');

-- INSERT INTO available_interviewers (day_id, interviewer_id)
-- SELECT 1 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

-- INSERT INTO available_interviewers (day_id, interviewer_id)
-- SELECT 2 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

-- INSERT INTO available_interviewers (day_id, interviewer_id)
-- SELECT 3 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

-- INSERT INTO available_interviewers (day_id, interviewer_id)
-- SELECT 4 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

-- INSERT INTO available_interviewers (day_id, interviewer_id)
-- SELECT 5 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

-- WITH
-- appointments AS (
--   SELECT id as appointment_id, day_id FROM appointments ORDER BY RANDOM() LIMIT 10
-- ),
-- students(name) AS(
--   VALUES
--     ('Liam Martinez'),
--     ('Richard Wong'),
--     ('Lydia Miller-Jones'),
--     ('Archie Cohen'),
--     ('Chad Takahashi'),
--     ('Leopold Silvers'),
--     ('Maria Boucher'),
--     ('Jamal Jordan'),
--     ('Michael Chan-Montoya'),
--     ('Yuko Smith')
-- )

-- INSERT INTO interviews (student, appointment_id, interviewer_id)
-- SELECT
--   DISTINCT ON 
--   (s.name) name,
--   a.appointment_id AS appointment_id,
--   available_interviewers.interviewer_id AS interviewer_id
-- FROM (
--   SELECT
--     *, row_number() OVER(ORDER BY appointment_id) AS rnum
--   FROM appointments
-- ) AS a
-- JOIN (
--   SELECT
--     *, row_number() OVER(ORDER BY name) AS rnum
--   FROM students
-- ) AS s
-- ON a.rnum = s.rnum
-- JOIN available_interviewers
-- ON a.day_id = available_interviewers.day_id;
