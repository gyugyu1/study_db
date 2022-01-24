use world;

CREATE TABLE cafe (
  `seq` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `ttable` INT NULL,
  `chair` INT NULL,
  `address` VARCHAR(45) NULL,
  `location` INT NULL,
  `owner` VARCHAR(45) NULL,
  `closingtime` time NULL,
  `openingtime` time NULL,
  `onlinestore` boolean NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB;

insert into cafe(
seq
,name
,ttable
,chair
,address
,location
,owner
,closingtime
,openingtime
,onlinestore
) values (
1
,'별다방'
,1
,2
,'서울시 어디동'
,1
,'장동건'
,120000
,010000
,true
);

insert into cafe(
seq
,name
,ttable
,chair
,address
,location
,owner
,closingtime
,openingtime
,onlinestore
) values (
10
,'할리스커피'
,7
,7
,'서울시 잠실'
,4
,'유제석'
,150000
,040000
,true
);


-- varchar 은 ' 또는 " 로 감싼다.
-- int 는 사용하지 않아도 된다.
-- 컴마는 앞쪽을 선호 : 이건 호불호가 갈린다.

select * from cafe;
select * from cafe where name ='메카커피';
select * from cafe where name ='별다방' and ttable = 1;
select * from cafe where name ='별다방' or owner = '백종원';
select * from cafe where openingtime =040000 and closingtime=150000;


select * from cafe where name like '%커피%';
