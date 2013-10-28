ALTER TABLE `order_form` ADD COLUMN `express_Message` INT(11) NULL AFTER `amount_Payable`; 

CREATE TABLE `tushu`.`work_message`( `id` INT NOT NULL AUTO_INCREMENT, `product_Id` INT, `user_Id` BIGINT(11), PRIMARY KEY (`id`) ) CHARSET=utf8;

CREATE TABLE `tushu`.`work_relationship_image`( `id` INT NOT NULL AUTO_INCREMENT, `work_Id` INT NOT NULL, `image_Id` INT NOT NULL, PRIMARY KEY (`id`) ) CHARSET=utf8; 