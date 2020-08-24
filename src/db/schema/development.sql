INSERT INTO users (username, email, password)
VALUES
  ('Jehanne Hodge',     'samarahjhodge@gmail.com',      '1234'),
  ('Dmitry Petrov',     'dmitry.petrov0918@gmail.com',  '1234'),
  ('Julian Bustos',     'julian.m.bustos@gmail.com',    '1234'),
  ('Francis Bourgouin', 'cohana@roy.com',               '1234'),
  ('Dominic Tremblay',  'sven@jones.com',               '1234'),
  ('Vasily Klimkin',    'susan@reynolds.com',           '1234'),
  ('James Cash',        'alec@quon.com',                '1234'),
  ('Lovemore Jokonya',  'victor@jain.com',              '1234'),
  ('Janelle Stiehl',    'lindsay.chu@email.biz',        '1234'),
  ('Emma McPhail',      'sam.stanic@erich.biz',         '1234');

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

