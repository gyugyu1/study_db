drop table code;

create table code(
code integer auto_increment primary key,
name varchar(20),
ifuse tinyint
);



select * from code;


create table code_name(
seq integer auto_increment not null,
value varchar(20) not null,
ifuse tinyint,
code_id integer not null,
code_num integer,
primary key(seq),
foreign key(code_num) references code(code) on delete cascade);

select * from codetestmembercode;
select * from code_name;
select * from code;

insert into code(name, ifuse) values('성별',1);
insert into code(name, ifuse) values('질문',1);
insert into code(name, ifuse) values('취미',1);
insert into code(name, ifuse) values('지역',1);
insert into code(name, ifuse) values('전화_타입',1);
insert into code(name, ifuse) values('지역',1);
insert into code(name, ifuse) values('지역_타입',1);
insert into code(name, ifuse) values('모바일_용도',1);
insert into code(name, ifuse) values('모바일_통신사',1);
insert into code(name, ifuse) values('이메일_용도',1);
insert into code(name, ifuse) values('이메일_도메인',1);
insert into code(name, ifuse) values('sns',1);
insert into code(name, ifuse) values('유효기간',1);

insert into code_name(value,ifuse,code_id,code_num) values("남자",1,1,1);
insert into code_name(value,ifuse,code_id,code_num) values("여자",1,2,1);
insert into code_name(value,ifuse,code_id,code_num) values("기타",1,3,1);
insert into code_name(value,ifuse,code_id,code_num) values("춠신 초등학교는?",1,1,2);
insert into code_name(value,ifuse,code_id,code_num) values("아버지의 이름은?",1,2,2);
insert into code_name(value,ifuse,code_id,code_num) values("첫사랑의 이름은?",1,3,2);
insert into code_name(value,ifuse,code_id,code_num) values("음주",1,1,3);
insert into code_name(value,ifuse,code_id,code_num) values("축구",1,2,3);
insert into code_name(value,ifuse,code_id,code_num) values("낚시",1,3,3);
insert into code_name(value,ifuse,code_id,code_num) values("요리",1,4,3);
insert into code_name(value,ifuse,code_id,code_num) values("농구",1,5,3);
insert into code_name(value,ifuse,code_id,code_num) values("격투기",1,6,3);
insert into code_name(value,ifuse,code_id,code_num) values("음악감상",1,7,3);
insert into code_name(value,ifuse,code_id,code_num) values("영화감상",1,8,3);
select * from code_name;
insert into code_name(value,ifuse,code_id,code_num) values("서울",1,1,4);
insert into code_name(value,ifuse,code_id,code_num) values("경기도",1,2,4);
insert into code_name(value,ifuse,code_id,code_num) values("충청도",1,3,4);
insert into code_name(value,ifuse,code_id,code_num) values("전라도",1,4,4);
insert into code_name(value,ifuse,code_id,code_num) values("경상도",1,5,4);
insert into code_name(value,ifuse,code_id,code_num) values("제주도",1,6,4);
insert into code_name(value,ifuse,code_id,code_num) values("강원도",1,7,4);

insert into code_name(value,ifuse,code_id,code_num) values("모바일",1,1,5);
insert into code_name(value,ifuse,code_id,code_num) values("집전화",1,2,5);
insert into code_name(value,ifuse,code_id,code_num) values("팩스",1,3,5);

insert into code_name(val,ifuse,code_id,code_num) values("skt",1,1,6);
insert into code_name(val,ifuse,code_id,code_num) values("kt",1,2,6);
insert into code_name(val,ifuse,code_id,code_num) values("lgu",1,3,6);

insert into code_name(val,ifuse,code_id,code_num) values("개인",1,1,7);
insert into code_name(val,ifuse,code_id,code_num) values("회사",1,2,7);

insert into code_name(val,ifuse,code_id,code_num) values("naver.com",1,1,8);
insert into code_name(val,ifuse,code_id,code_num) values("google.com",1,2,8);
insert into code_name(val,ifuse,code_id,code_num) values("daum.com",1,3,8);
insert into code_name(val,ifuse,code_id,code_num) values("kakao.com",1,4,8);

insert into code_name(val,ifuse,code_id,code_num) values("페이스북",1,1,9);
insert into code_name(val,ifuse,code_id,code_num) values("인스타그램",1,2,9);
insert into code_name(val,ifuse,code_id,code_num) values("트위터",1,3,9);


insert into code_name(val,ifuse,code_id,code_num) values("1년",1,1,10);
insert into code_name(val,ifuse,code_id,code_num) values("3년",1,2,10);
insert into code_name(val,ifuse,code_id,code_num) values("5년",1,3,10);
insert into code_name(val,ifuse,code_id,code_num) values("탈퇴시",1,4,10);
select * from code_name;

insert into code_name(val,ifuse,code_id,code_num) values("출신 초등학교는?",1,1,2);
insert into code_name(val,ifuse,code_id,code_num) values("아버지의 이름은?",1,2,2);
insert into code_name(val,ifuse,code_id,code_num) values("나의 고향은?",1,3,2);

select * from member;

select * from member_hobby;
drop table member_hobby;
create table member_hobby(
seq integer auto_increment,
member_code int unsigned not null,
hobby_code integer,
primary key(seq),
foreign key(member_code) references member(membercode));
select * from code_name;
insert into member_hobby(member_code, hobby_code) values(1, 4);
insert into member_hobby(member_code, hobby_code) values(1, 7);
insert into member_hobby(member_code, hobby_code) values(1, 6);

insert into address(member_code,address_detail,address_typeCD, locationCD, zipcode) values(1,'마포구 서교동', 1,1,12345);
insert into address(member_code,address_detail,address_typeCD, locationCD, zipcode) values(1,'강남구 첨담동', 2,1,48832);

select * from code_name;
select * from sns;
insert into sns (member_code, Snscd, snsurl, defaultny) values (1, 2,'instagram/sdks',1);
insert into sns (member_code, Snscd, snsurl, defaultny) values (1, 1,'facebook/ddor',0);

select * from project;

insert into project(member_code,name,startdate,orderer,role,enddate) values (1,'빅데이터 구축',20170601,'현대','빅데이터 구축',20180601);
insert into project(member_code,name,startdate,orderer,role,enddate) values (1,'웹페이지 구축',20200301,'현대','DB관리',20210101);

update project
set orderer= '삼성'
where seq = 2;

select * from member_hobby;

select * from member_hobby;
from member as a left join member_hobby as b on a.membercode = b.member_code;
select val from code_name
where code_id=( select hobby_code from member_hobby);
select * from h;
select * from member_hobby;
select val from code_name where code_num= 3 and code_id= (select hobby_code from member_hobby where (select code_num from code_name where code_num=3);

select name from member where membercode= (select member_code from member_hobby where hobby_code=);




select * from member_hobby;


select name, hobby_code from member as a,member_hobby as b
 where a.membercode = b.member_code;
 
select addressval from code_name,member where code_num =3 and code_id = (select hobby_code from member_hobby where member_code=1);
; infrcodeinfrememberhobby


select * from member;

select * from code;	-- code
select * from code_name;	-- code_num

select 
membercode
, name
, gender
,(select val from code_name where code_id = gender and code_num=1) as genderName
from member;



select * from infrcodegroup;