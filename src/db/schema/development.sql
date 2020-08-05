INSERT INTO users (username, email, password)
VALUES
  ('Sylvia Palmer',   'Sylvia.Palmer@erich.biz',  '1234'),
  ('Tori Malcolm',    'tori@malcolm.com',         '1234'),
  ('Mildred Nazir',   'mildred@nazir.com',        '1234'),
  ('Cohana Roy',      'cohana@roy.com',           '1234'),
  ('Sven Jones',      'sven@jones.com',           '1234'),
  ('Susan Reynolds',  'susan@reynolds.com',       '1234'),
  ('Alec Quon',       'alec@quon.com',            '1234'),
  ('Viktor Jain',     'victor@jain.com',          '1234'),
  ('Lindsay Chu',     'lindsay.chu@email.biz',    '1234'),
  ('Samantha Stanic', 'sam.stanic@erich.biz',     '1234');

INSERT INTO bins (name)
VALUES
  ('organic'),
  ('recycling'),
  ('garbage');

-- SELECT sum(score) FROM user_bins
-- WHERE user_id = 2;

INSERT INTO user_bins (user_id, bin_id, score)
VALUES
  (1, 1, 25),
  (2, 3, 0),
  (3, 2, 50),
  (4, 3, 0),
  (5, 2, 50),
  (6, 2, 50),
  (10, 2, 50),
  (9, 1, 25),
  (10, 2, 50),
  (7, 2, 50),
  (8, 3, 0),
  (3, 1, 25),
  (4, 3, 0),
  (7, 1, 25),
  (1, 2, 50);

