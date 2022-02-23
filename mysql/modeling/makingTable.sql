CREATE TABLE IF NOT EXISTS `shoppingmall`.`User` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` INT NOT NULL,
  `birthdate` DATE NOT NULL,
  `phoneNumber` INT NOT NULL,
  `userId` VARCHAR(10) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `personalDataCollectNy` TINYINT NOT NULL,
  `eventNotificationNy` TINYINT NOT NULL,
  `preferedPayment` TINYINT NULL,
  `email` VARCHAR(45) NOT NULL,
  `venderNy` TINYINT NOT NULL,
  `administratorNy` TINYINT NOT NULL,
  `point` INT NULL,
  `resgisteredAt` DATETIME NOT NULL,
  `lastLogin` DATETIME NOT NULL,
  `lastPasswordChange` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `shoppingmall`.`Address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_id` INT UNSIGNED NOT NULL,
  `typeCD` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `preferredNy` TINYINT NOT NULL,
  `postalNo` INT NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `gu` VARCHAR(45) NOT NULL,
  `detail` VARCHAR(45) NOT NULL,
  `dong` VARCHAR(45) NULL,
  `roadName` VARCHAR(45) NULL,
  `roadNum` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Address_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `shoppingmall`.`CodeGroup` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `order` INT NULL,
  `desc` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Code` (
  `id` INT NOT NULL,
  `CodeGroup_id` INT UNSIGNED NOT NULL,
  `parent_id` INT NULL,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Code_CodeGroup1_idx` (`CodeGroup_id` ASC) VISIBLE,
  INDEX `fk_Code_Code1_idx` (`parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Code_CodeGroup1`
    FOREIGN KEY (`CodeGroup_id`)
    REFERENCES `shoppingmall`.`CodeGroup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Code_Code1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `shoppingmall`.`Code` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`CardCompay` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `savingPercentage` TINYINT NULL,
  `noInterestMonth` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`PreferredPayment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `paymentCD` INT NOT NULL,
  `cardCompanyCD` TINYINT NULL,
  `cardNumber` VARCHAR(45) NULL,
  `bankAccountNumber` VARCHAR(45) NULL,
  `cardVaildDate` DATE NULL,
  `cardCvc` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_preferredPayment_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_preferredPayment_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Coupon` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `User_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `discount` INT NOT NULL,
  `expireAt` DATETIME NOT NULL,
  `getDateAt` DATETIME NULL,
  `usedNy` TINYINT NOT NULL,
  `categoryAble` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Coupon_Customer1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Coupon_Customer1`
    FOREIGN KEY (`User_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Coupon_id` INT UNSIGNED NULL,
  `price` INT NOT NULL,
  `quantity` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Item_Coupon1_idx` (`Coupon_id` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Coupon1`
    FOREIGN KEY (`Coupon_id`)
    REFERENCES `shoppingmall`.`Coupon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `User_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `seller` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  `from` VARCHAR(45) NOT NULL,
  `shippingFeeCD` INT NOT NULL,
  `overseaNy` TINYINT NOT NULL,
  `discount` INT NULL,
  `description` VARCHAR(45) NULL,
  `publishedAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `saleStartAt` DATETIME NOT NULL,
  `saleEndAt` DATETIME NOT NULL,
  `ratingTotal` SMALLINT NOT NULL,
  `category` INT NOT NULL,
  `refundNy` TINYINT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `modelName` VARCHAR(45) NOT NULL,
  `manufactuer` VARCHAR(45) NOT NULL,
  `numberAs` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Product_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Option` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_id` INT UNSIGNED NOT NULL,
  `parent_id` INT UNSIGNED NULL,
  `type` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `stock` INT NULL,
  `addingPrice` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ItemOption_Product1_idx` (`Product_id` ASC) VISIBLE,
  INDEX `fk_Option_Option1_idx` (`parent_id` ASC) VISIBLE,
  CONSTRAINT `fk_ItemOption_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `shoppingmall`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Option_Option1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `shoppingmall`.`Option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `shoppingmall`.`Image` (
  `itemDesc_no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_id` INT UNSIGNED NOT NULL,
  `itemImage` VARCHAR(300) NULL,
  PRIMARY KEY (`itemDesc_no`),
  INDEX `fk_ItemDesc_Product1_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_ItemDesc_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `shoppingmall`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `shoppingmall`.`DiscountOnCard` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_id` INT UNSIGNED NOT NULL,
  `companyName` VARCHAR(45) NOT NULL,
  `DiscountPercentage` TINYINT NOT NULL,
  `companyCD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DiscountOnCard_Product1_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_DiscountOnCard_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `shoppingmall`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Review` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_id` INT UNSIGNED NOT NULL,
  `User_id` INT UNSIGNED NOT NULL,
  `parentReview_id` INT UNSIGNED NULL,
  `title` VARCHAR(45) NOT NULL,
  `rating` SMALLINT NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `publishedAt` DATE NOT NULL,
  `reportedNumber` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Review_Product1_idx` (`Product_id` ASC) VISIBLE,
  INDEX `fk_Review_Customer1_idx` (`User_id` ASC) VISIBLE,
  INDEX `fk_Review_Review1_idx` (`parentReview_id` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `shoppingmall`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Customer1`
    FOREIGN KEY (`User_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Review1`
    FOREIGN KEY (`parentReview_id`)
    REFERENCES `shoppingmall`.`Review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_id` INT UNSIGNED NOT NULL,
  `Coupon_id` INT UNSIGNED NULL,
  `price` INT NOT NULL,
  `quantity` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Item_Coupon1_idx` (`Coupon_id` ASC) VISIBLE,
  INDEX `fk_Item_Product1_idx` (`Product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Coupon1`
    FOREIGN KEY (`Coupon_id`)
    REFERENCES `shoppingmall`.`Coupon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `shoppingmall`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_id` INT UNSIGNED NOT NULL,
  `Coupon_id` INT UNSIGNED NOT NULL,
  `User_id` INT UNSIGNED NOT NULL,
  `price` INT NOT NULL,
  `quantity` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Item_Product1_idx` (`Product_id` ASC) VISIBLE,
  INDEX `fk_Item_Coupon1_idx` (`Coupon_id` ASC, `User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `shoppingmall`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_Coupon1`
    FOREIGN KEY (`Coupon_id` , `User_id`)
    REFERENCES `shoppingmall`.`Coupon` (`id` , `User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `shoppingmall`.`Order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_id` INT UNSIGNED NOT NULL,
  `Item_id` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `grandPrice` INT NOT NULL,
  `paymentCD` TINYINT NOT NULL,
  `pointDiscount` INT NULL,
  `shippingAddress` VARCHAR(45) NOT NULL,
  `shippingDetailAddress` VARCHAR(45) NOT NULL,
  `paymentCardNy` TINYINT NOT NULL,
  `cardCompanyCD` TINYINT NULL,
  `transperAccount` INT NULL,
  `savingPoint` INT NOT NULL,
  `statusCD` TINYINT NOT NULL,
  `messege` VARCHAR(45) NULL,
  `freeShippingNy` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Customer_Product_Order_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Order_Item1_idx` (`Item_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Product_Order_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Item1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `shoppingmall`.`Item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `shoppingmall`.`Option_item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Option_id` INT UNSIGNED NOT NULL,
  `Item_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Option_item_Option1_idx` (`Option_id` ASC) VISIBLE,
  INDEX `fk_Option_item_Item1_idx` (`Item_id` ASC) VISIBLE,
  CONSTRAINT `fk_Option_item_Option1`
    FOREIGN KEY (`Option_id`)
    REFERENCES `shoppingmall`.`Option` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Option_item_Item1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `shoppingmall`.`Item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Cart` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Item_id` INT UNSIGNED NOT NULL,
  `User_id` INT UNSIGNED NOT NULL,
  `createdAt` DATE NOT NULL,
  `totalPrice` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cart_Item1_idx` (`Item_id` ASC) VISIBLE,
  INDEX `fk_Cart_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cart_Item1`
    FOREIGN KEY (`Item_id`)
    REFERENCES `shoppingmall`.`Item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cart_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `shoppingmall`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shoppingmall`.`Category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `parent` INT NULL,
  `depth` INT NULL,
  `order` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;








