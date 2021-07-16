CREATE TABLE users (
  user_id                  STRING(36) NOT NULL,
  user_name                STRING(1024),
  user_email               STRING(1024),
) PRIMARY KEY (user_id);

CREATE TABLE accounts (
  user_id                  STRING(36) NOT NULL,
  account_id               STRING(36) NOT NULL,
  account_type             STRING(1024),
  account_balance          NUMERIC,
) PRIMARY KEY (user_id, account_id),
  INTERLEAVE IN PARENT users ON DELETE CASCADE;

CREATE TABLE transactions (
  user_id                  STRING(36) NOT NULL,
  account_id               STRING(36) NOT NULL,
  transaction_id           STRING(36) NOT NULL,
  transaction_type         STRING(1024),
  transaction_amount       NUMERIC,
  transaction_date         DATE,
) PRIMARY KEY (user_id, account_id, transaction_id),
  INTERLEAVE IN PARENT accounts ON DELETE CASCADE;

SELECT * 
FROM users JOIN accounts USING (user_id) 
WHERE user_id = '1cafb6a4-396c-4da1-8180-83531b6a41e3';

SELECT *
FROM accounts JOIN transactions USING (account_id)
WHERE account_id = '83428a85-5c8f-4398-8019-918d6e1d3a93'
ORDER BY transaction_date DESC;
