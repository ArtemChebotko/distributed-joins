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


INSERT INTO accounts_by_user (user_id, user_name, account_id, account_type)
VALUES (1cafb6a4-396c-4da1-8180-83531b6a41e3, 'Alice', 83428a85-5c8f-4398-8019-918d6e1d3a93, 'Checking');

INSERT INTO accounts_by_user (user_id, user_name, account_id, account_type)
VALUES (1cafb6a4-396c-4da1-8180-83531b6a41e3, 'Alice', 811b56c3-cead-40d9-9a3d-e230dcd64f2f, 'Savings');

INSERT INTO accounts_by_user (user_id, user_name, account_id, account_type)
VALUES (0d2b2319-9c0b-4ecb-8953-98687f6a99ce, 'Bob', 81def5e2-84f4-4885-a920-1c14d2be3c20, 'Checking');

INSERT INTO transactions_by_account (account_id, transaction_id, transaction_amount)
VALUES (83428a85-5c8f-4398-8019-918d6e1d3a93, 733f5f46-df2b-11eb-ba80-0242ac130004, 9.99);

INSERT INTO transactions_by_account (account_id, transaction_id, transaction_amount)
VALUES (83428a85-5c8f-4398-8019-918d6e1d3a93, 90661a6a-df2b-11eb-ba80-0242ac130004, 30.01);

INSERT INTO transactions_by_account (account_id, transaction_id, transaction_amount)
VALUES (811b56c3-cead-40d9-9a3d-e230dcd64f2f, b4db3cc2-df2b-11eb-ba80-0242ac130004, 100);

INSERT INTO transactions_by_account (account_id, transaction_id, transaction_amount)
VALUES (811b56c3-cead-40d9-9a3d-e230dcd64f2f, c894ad16-df2b-11eb-ba80-0242ac130004, 50);

INSERT INTO transactions_by_account (account_id, transaction_id, transaction_amount)
VALUES (81def5e2-84f4-4885-a920-1c14d2be3c20, de2c0606-df2b-11eb-ba80-0242ac130004, 1.99);


SELECT * FROM accounts_by_user
WHERE user_id = 1cafb6a4-396c-4da1-8180-83531b6a41e3;

SELECT account_id, transaction_id, transaction_type, transaction_amount, 
       ToDate(transaction_id) AS transaction_date
FROM transactions_by_account
WHERE account_id = 83428a85-5c8f-4398-8019-918d6e1d3a93;
