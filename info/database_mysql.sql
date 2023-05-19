CREATE TABLE `account` (
  `id` bigserial PRIMARY KEY,
  `owner` varchar(255) NOT NULL,
  `balance` bigint NOT NULL,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamz NOT NULL DEFAULT "now()"
);

CREATE TABLE `entries` (
  `id` bigserial PRIMARY KEY,
  `account_id` bigint,
  `amount` bigint NOT NULL COMMENT 'can be negatif or positive',
  `created_at` timestamz NOT NULL DEFAULT "now()"
);

CREATE TABLE `transfer` (
  `id` bigserial PRIMARY KEY,
  `from_account_id` bigint,
  `to_account_id` bigint,
  `amount` bigint NOT NULL COMMENT 'must be positive',
  `created_at` timestamz NOT NULL DEFAULT "now()"
);

CREATE INDEX `account_index_0` ON `account` (`owner`);

CREATE INDEX `entries_index_1` ON `entries` (`account_id`);

CREATE INDEX `transfer_index_2` ON `transfer` (`from_account_id`);

CREATE INDEX `transfer_index_3` ON `transfer` (`to_account_id`);

CREATE INDEX `transfer_index_4` ON `transfer` (`from_account_id`, `to_account_id`);

ALTER TABLE `entries` ADD FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

ALTER TABLE `transfer` ADD FOREIGN KEY (`from_account_id`) REFERENCES `account` (`id`);

ALTER TABLE `transfer` ADD FOREIGN KEY (`to_account_id`) REFERENCES `account` (`id`);
