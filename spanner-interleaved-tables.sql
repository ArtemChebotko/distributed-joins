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


INSERT INTO users (user_id, user_name)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', 'Alice');

INSERT INTO users (user_id, user_name)
VALUES ('0d2b2319-9c0b-4ecb-8953-98687f6a99ce', 'Bob');

INSERT INTO accounts (user_id, account_id, account_type)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', '83428a85-5c8f-4398-8019-918d6e1d3a93', 'Checking');

INSERT INTO accounts (user_id, account_id, account_type)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', '811b56c3-cead-40d9-9a3d-e230dcd64f2f', 'Savings');

INSERT INTO accounts (user_id, account_id, account_type)
VALUES ('0d2b2319-9c0b-4ecb-8953-98687f6a99ce', '81def5e2-84f4-4885-a920-1c14d2be3c20', 'Checking');

INSERT INTO transactions (user_id, account_id, transaction_id, transaction_amount, transaction_date)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', '83428a85-5c8f-4398-8019-918d6e1d3a93', '733f5f46-df2b-11eb-ba80-0242ac130004', 9.99, '2021-01-01');

INSERT INTO transactions (user_id, account_id, transaction_id, transaction_amount, transaction_date)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', '83428a85-5c8f-4398-8019-918d6e1d3a93', '90661a6a-df2b-11eb-ba80-0242ac130004', 30.01, '2021-01-02');

INSERT INTO transactions (user_id, account_id, transaction_id, transaction_amount, transaction_date)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', '811b56c3-cead-40d9-9a3d-e230dcd64f2f', 'b4db3cc2-df2b-11eb-ba80-0242ac130004', 100, '2021-01-03');

INSERT INTO transactions (user_id, account_id, transaction_id, transaction_amount, transaction_date)
VALUES ('1cafb6a4-396c-4da1-8180-83531b6a41e3', '811b56c3-cead-40d9-9a3d-e230dcd64f2f', 'c894ad16-df2b-11eb-ba80-0242ac130004', 50, '2021-01-04');

INSERT INTO transactions (user_id, account_id, transaction_id, transaction_amount, transaction_date)
VALUES ('0d2b2319-9c0b-4ecb-8953-98687f6a99ce', '81def5e2-84f4-4885-a920-1c14d2be3c20', 'de2c0606-df2b-11eb-ba80-0242ac130004', 1.99, '2021-01-05');


SELECT * 
FROM users JOIN accounts USING (user_id) 
WHERE user_id = '1cafb6a4-396c-4da1-8180-83531b6a41e3';

SELECT *
FROM accounts JOIN transactions USING (account_id)
WHERE account_id = '83428a85-5c8f-4398-8019-918d6e1d3a93'
ORDER BY transaction_date DESC;
