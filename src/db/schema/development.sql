INSERT INTO users (username, email, password)
VALUES
  ('Sylvia Palmer',   'Sylvia.Palmer@erich.biz',  '1234'),
  ('Tori Malcolm',    'tori@malcolm.com',         '1234'),
  ('Mildred Nazir',   'julian.m.bustos@gmail.com','1234'),
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

INSERT INTO user_bins (user_id, bin_id, score)
VALUES
  (1, 1, 25),
  (2, 3, 10),
  -- (3, 2, 25),
  (3, 2, 0),
  (4, 3, 10),
  (5, 2, 25),
  (6, 2, 25),
  (10, 2, 25),
  (9, 1, 25),
  (10, 2, 25),
  (7, 2, 25),
  (8, 3, 10),
  -- (3, 1, 25),
  (3, 1, 0),
  (4, 3, 10),
  (7, 1, 25),
  (1, 2, 25),
  (1, 3, 10);

