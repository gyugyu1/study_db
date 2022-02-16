CREATE TABLE book3 (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `publisher_cd` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


CREATE TABLE publisher (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

insert into book3(
name
,publisher_cd
) values(
'4차산업의미래'
,4
);



insert into publisher(
name
) values(
'아이북스'
);
select * from book3;
select * from publisher;

select
a.no
,a.name
,a.publisher_cd
,b.name
from book3 as a
-- left join publisher as b on b.no = a.publisher_cd;
inner join publisher as b on b.no = a.publisher_cd;

select
a.no
,a.name
,a.publisher_cd
,(select name from publisher where no = a.publisher_cd) as leer
from book3 as a;

select
a.no
,a.name
,a.publisher_cd
,getPublisherName
from book3 as a;


update book3
set 
publisher_cd = null
where no = 2;
