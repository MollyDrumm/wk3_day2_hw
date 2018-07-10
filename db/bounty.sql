  DROP TABLE IF EXISTS bounty;

  CREATE TABLE bounty (
    id SERIAL4 PRIMARY KEY,
    bounty_name VARCHAR(255),
    danger_level VARCHAR(255),
    favourite_weapon VARCHAR(255),
    bounty_value INT4
  );
