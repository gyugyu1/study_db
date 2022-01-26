drop table books;
drop table info;
select * from avai;
CREATE TABLE books (
  `bookcode` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `publisher` VARCHAR(45) NULL,
  `price` INT NULL,
  `publishingdate` DATE NULL,
  `relatedbook` VARCHAR(45) NULL,
  `picture` VARCHAR(45) NULL,
  PRIMARY KEY (`bookcode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_as_ci;

CREATE TABLE booksale (
  `bookcode` INT NOT NULL,
  `salevolume` INT NULL,
  `review` varchar(200) NULL,
  PRIMARY KEY (`bookcode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_as_ci;

CREATE TABLE IF NOT EXISTS info (
  `placecode` INT UNSIGNED NOT NULL,
  `image` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `minimalhour` INT NULL,
  `maximaluser` INT NULL,
  `explanation` VARCHAR(400) NULL,
  PRIMARY KEY (`placecode`))
ENGINE = InnoDB;

CREATE TABLE avai (
  `placecode` INT NOT NULL,
  `wifi` TINYINT NULL,
  `mirror` TINYINT NULL,
  `chairtable` TINYINT NULL,
  `toilet` TINYINT NULL,
  `lounge` TINYINT NULL,
  `shower` TINYINT NULL,
  `airconditioner` TINYINT NULL,
  `boiler` TINYINT NULL,
  `piano` TINYINT NULL,
  `doorlock` TINYINT NULL,
  PRIMARY KEY (`placecode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_as_ci;

insert into books(
bookcode
,name
,author
,publisher
,price
,publishingdate
,relatedbook
,picture
) values (
1
,'웹표준의정석'
,'고경희'
,'이지스퍼블리싱'
,27000
,20210101
,'자바의정석'
,'사진'
);

insert into booksale(
bookcode
,salevolume
,review
) values (
1
,12
,'너무 좋아요!'
);

insert into info(
placecode
,image
,type
,minimalhour
,maximaluser
,explanation
) values (
1
,'사진2'
,'practiceroom'
,1
,4
,'레슨, 보컬, 성악 등 원하는 음악을 마음껏 연습할 수 있는곳'
);

insert into avai(
placecode
,wifi
,mirror
,chairtable
,toilet
,lounge
,shower
,airconditioner
,boiler
,piano
,doorlock
) values (
true
,true
,true
,true
,true
,true
,true
,false
,false
,false
,false
)
