CREATE TABLE accounts_by_user (
  user_id                  UUID,
  account_id               UUID,
  account_type             TEXT,
  account_balance          DECIMAL,
  user_name                TEXT STATIC,
  user_email               TEXT STATIC,
  PRIMARY KEY (user_id, account_id)
);

CREATE TABLE transactions_by_account (
  account_id               UUID,
  transaction_id           TIMEUUID,
  transaction_type         TEXT,
  transaction_amount       DECIMAL,
  -- transaction_date is not needed
  PRIMARY KEY (account_id, transaction_id)
) WITH CLUSTERING ORDER BY (transaction_id DESC);

SELECT * FROM accounts_by_user
WHERE user_id = 1cafb6a4-396c-4da1-8180-83531b6a41e3;

SELECT account_id, transaction_id, transaction_type, transaction_amount, 
       ToDate(transaction_id) AS transaction_date
FROM transactions_by_account
WHERE account_id = 83428a85-5c8f-4398-8019-918d6e1d3a93;
