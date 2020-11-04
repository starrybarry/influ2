CREATE TABLE `users` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_contacts` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `value` varchar(255) NOT NULL,
    `type` ENUM('email', 'phone') NOT NULL,
    `user_id` bigint(20) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_user_contacts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

