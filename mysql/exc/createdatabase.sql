create database gyugyu;
use gyugyu;



CREATE TABLE IF NOT EXISTS `infrCodeGroup` (
  `ifcgSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifcgSeqAnother` VARCHAR(45) NULL,
  `ifcgName` VARCHAR(50) NOT NULL,
  `ifcgNameCng` VARCHAR(45) NULL,
  `ifcgUseNy` TINYINT NULL,
  `ifcgOrder` TINYINT NULL,
  `ifcgReferenceV1` VARCHAR(50) NULL,
  `ifcgReferenceV2` VARCHAR(45) NULL,
  `ifcgReferenceV3` VARCHAR(45) NULL,
  `ifcgReferenceI1` INT NULL,
  `ifcgReferenceI2` INT NULL,
  `ifcgReferenceI3` INT NULL,
  `ifcgDesc` VARCHAR(255) NULL,
  `ifcgDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeServer` DATETIME NULL,
  PRIMARY KEY (`ifcgSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `infrCode` (
  `ifcdSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifcdSeqAnother` VARCHAR(45) NULL,
  `ifcdName` VARCHAR(45) NOT NULL,
  `ifcdNameEng` VARCHAR(45) NULL,
  `ifcdNameLang1` VARCHAR(45) NULL,
  `ifcdNameLang2` VARCHAR(45) NULL,
  `ifcdNameLang3` VARCHAR(45) NULL,
  `ifcdNameLang4` VARCHAR(45) NULL,
  `ifcdNameLang5` VARCHAR(45) NULL,
  `ifcdUseNy` TINYINT NULL,
  `ifcdOrder` TINYINT NULL,
  `ifcdReferenceV1` VARCHAR(45) NULL,
  `ifcdReferenceV2` VARCHAR(45) NULL,
  `ifcdReferenceV3` VARCHAR(45) NULL,
  `ifcdReferenceI1` INT NULL,
  `ifcdReferenceI2` INT NULL,
  `ifcdReferenceI3` INT NULL,
  `ifcdDesc` VARCHAR(255) NULL,
  `ifcdDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifcgSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifcdSeq`, `ifcgSeq`),
  INDEX `fk_infrCode_infrCodeGroup_idx` (`ifcgSeq` ASC) VISIBLE,
  CONSTRAINT `fk_infrCode_infrCodeGroup`
    FOREIGN KEY (`ifcgSeq`)
    REFERENCES `infrCodeGroup` (`ifcgSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO `gyugyu`.`infrcodegroup`
(
`ifcgName`,
`ifcgUseNy`,
`ifcgOrder`,
`ifcgDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeServer`)
VALUES
(
'회원보안질문.구분',
1,
14,
0,
now(),
now(),
now(),
now());

select * from infrCodegroup;


INSERT INTO `gyugyu`.`infrcode`
(

`ifcdName`,
`ifcdUseNy`,
`ifcdOrder`,
`ifcdDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifcgSeq`)
VALUES
(
'애온동물의 이름은?',
1,
4,
0,
now(),
now(),
now(),
now(),
14
);

select * from infrcode;
select * from infrcodegroup;
select
a.ifcgseq,
a.ifcgname,
b.ifcdseq,
b.ifcdname,
b.ifcdorder
from infrcodegroup a
left join infrcode b on b.ifcgseq = a.ifcgseq
order by a.ifcgseq, b.ifcdorder;

update infrcode
set ifcdorder = "2"
where ifcdseq=47;





CREATE TABLE IF NOT EXISTS `gyugyu`.`infrNationality` (
  `ifnaSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifnaName` VARCHAR(45) NULL,
  `ifnaNameEng` VARCHAR(45) NULL,
  `ifnaNameKor` VARCHAR(45) NULL,
  `ifnaCode2Char` CHAR(2) NULL,
  `ifnaCode3Char` CHAR(3) NULL,
  `ifnaUseNy` TINYINT NULL,
  `ifnaOrder` TINYINT NULL,
  `ifnaDesc` VARCHAR(255) NULL,
  `ifnaDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeServer` DATETIME NULL,
  PRIMARY KEY (`ifnaSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO `gyugyu`.`infrnationality`
(
`ifnaName`,
`ifnaCode2Char`,
`ifnaCode3Char`,
`ifnaUseNy`,
`ifnaOrder`,
`ifnaDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeServer`)
VALUES

(
'미국',
'US',
'USA',
1,
2,
0,
now(),
now(),
now(),
now());

select * from infrnationality;

CREATE TABLE IF NOT EXISTS `gyugyu`.`infrMemmer` (
  `ifmmSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmmAdminNy` TINYINT NULL,
  `ifmmDormancyNy` TINYINT NULL,
  `ifmmName` VARCHAR(45) NOT NULL,
  `ifmmId` VARCHAR(45) NOT NULL,
  `ifmmPassword` VARCHAR(100) NULL,
  `ifmmPwdModDate` DATETIME NULL COMMENT '비밀번호 수정 날짜',
  `ifmmGenderCd` TINYINT NULL,
  `ifmmDob` DATE NULL COMMENT 'day of birth 생일',
  `ifmmSavedCd` TINYINT NULL COMMENT '회원정보 저장기간\n',
  `ifmmMarriageCd` TINYINT NULL,
  `ifmmMariageDate` DATE NULL,
  `ifmmChildrenNum` TINYINT NULL,
  `ifmmFavoriteColor` VARCHAR(45) NULL,
  `ifmmRecommenderSeq` BIGINT NULL,
  `ifmmEmailConsentNy` TINYINT NULL COMMENT '마케팅 수신동의',
  `ifmmSmsConsentNy` TINYINT NULL,
  `ifmmPushConsentNy` TINYINT NULL,
  `ifmmDesc` VARCHAR(255) NULL,
  `ifmmDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeServer` DATETIME NULL,
  PRIMARY KEY (`ifmmSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

select * from infrmember;

CREATE TABLE IF NOT EXISTS `gyugyu`.`infrMemberNationality` (
  `ifmnSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmnDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeServer` DATETIME NULL,
  `ifmmseq` BIGINT UNSIGNED NOT NULL,
  `ifnaseq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifmnSeq`),
  INDEX `fk_infrMemberNationality_infrMemmer1_idx` (`ifmmseq` ASC) VISIBLE,
  INDEX `fk_infrMemberNationality_infrNationality1_idx` (`ifnaseq` ASC) VISIBLE,
  CONSTRAINT `fk_infrMemberNationality_infrMemmer1`
    FOREIGN KEY (`ifmmseq`)
    REFERENCES `gyugyu`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infrMemberNationality_infrNationality1`
    FOREIGN KEY (`ifnaseq`)
    REFERENCES `gyugyu`.`infrNationality` (`ifnaSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `gyugyu`.`infrAuth` (
  `ifatSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifatAdminNy` TINYINT NULL,
  `ifatName` VARCHAR(45) NOT NULL,
  `ifatNameEng` VARCHAR(45) NULL,
  `ifatUseNy` TINYINT NULL,
  `ifatOrder` TINYINT NULL,
  `ifatDesc` VARCHAR(255) NULL,
  `ifatDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  PRIMARY KEY (`ifatSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `gyugyu`.`infrAuthMenu` (
  `ifauSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifauRoleCd` BIGINT NULL,
  `ifauUseNy` TINYINT NULL,
  `ifauOrder` TINYINT NULL,
  `ifauDesc` VARCHAR(255) NULL,
  `ifauDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifatSeq` BIGINT UNSIGNED NOT NULL,
  `ifmuSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifauSeq`),
  INDEX `fk_infAuthMenu_infrAuth1_idx` (`ifatSeq` ASC) VISIBLE,
  INDEX `fk_infAuthMenu_infrMenu1_idx` (`ifmuSeq` ASC) VISIBLE,
  CONSTRAINT `fk_infAuthMenu_infrAuth1`
    FOREIGN KEY (`ifatSeq`)
    REFERENCES `gyugyu`.`infrAuth` (`ifatSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infAuthMenu_infrMenu1`
    FOREIGN KEY (`ifmuSeq`)
    REFERENCES `gyugyu`.`infrMenu` (`ifmuSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `gyugyu`.`infrMenu` (
  `ifmuSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifauRoleCd` BIGINT NULL COMMENT '조회권한 줄것이냐 관리권한만 줄것이냐\n관리,조회',
  `ifauUseNy` TINYINT NULL,
  `ifauOrder` VARCHAR(45) NULL,
  `ifauDesc` VARCHAR(255) NULL,
  `ifmuAdminNy` TINYINT NULL,
  `ifmuName` VARCHAR(50) NOT NULL,
  `ifmuNameEng` VARCHAR(45) NULL,
  `ifmuUrl` VARCHAR(100) NULL,
  `ifmuParents` BIGINT NULL,
  `ifmuDepth` TINYINT NULL COMMENT '정보성',
  `ifmuUseNy` TINYINT NULL,
  `ifmuOrder` VARCHAR(45) NULL,
  `ifmuDesc` VARCHAR(255) NULL,
  `ifmuDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  PRIMARY KEY (`ifmuSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

