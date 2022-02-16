select * from infrcode;
select * from infrmember;
use gyugyu;
select
a.ifcgseq,
b.ifcdseq,
b.ifcdname,
b.ifcdorder,
b.ifcduseny,
b.ifcddelny
from infrcodegroup a 
	left join infrcode b on b.ifcgseq = a.ifcgseq
    where a.ifcgdelny =0 and
			b.ifcddelny=0 and
            a.ifcguseny=1 and
            b.ifcduseny=1
	order by a.ifcgseq asc ,b.ifcdseq asc;
    
    select * from infrmember;
    select * from infrcode;
    
    select 
		a.ifmmSeq '고객번호',
        a.ifmmadminny '관리자여부' ,
        (select ifnull ((select ifcdname from infrcode where ifcdseq=a.ifmmadminny),'일반')) '권한',
        a.ifmmname '이름',
        a.ifmmid 'id',
        a.ifmmgendercd '성별 코드',
        (select ifcdname from infrcode where ifcdseq = a.ifmmgendercd) as '성별'
        ,a.ifmmdob '생일'
        ,b.ifmatypecd '주소 구분'
        ,(select ifcdname from infrcode where ifcdseq = b.ifmatypecd) '주소 종류'
        , b.ifmatitle '주소명'
        , b.ifmaaddress1 '기본주소'
        , b.ifmaaddress2 '상세주소'
        , b.ifmazipcode '우편번호'
        , c.ifaotypecd '주소 종류 코드'
        , (select ifcdname from infrcode where ifcdseq = c.ifaotypecd) '주소종류'
        , c.ifaosnstypecd 'sns 코드'
        , (select ifcdname from infrcode where ifcdseq = c.ifaosnstypecd)  'sns 명'
        , c.ifaotitle 'sns 종류'
        , c.ifaourl 'url주소'
        , d.ifmetypecd '이메일 타입 코드'
        , (select ifcdname from infrcode where ifcdseq = d.ifmetypecd) as '이메일타입'
        , d.ifmeemailfull '전체 이메일'
        , e.ifjqQuestionCd '질문 코드'
        , (select ifcdname from infrcode where ifcdseq = e.ifjqQuestionCd) as '질문'
        , e.ifjqanswer '질문 답'
        , f.ifnaseq '국적코드'
        , g.ifnaname '국적'
        , h.ifMpTypeCd '폰 타입'
        , (select ifcdname from infrcode where ifcdseq = h.ifMpTypeCd) '폰 타입 이름'
        ,h.ifmpnumber '폰 번호 1'
        ,concat(substring(h.ifmpnumber,1,3),'-',substring(h.ifmpnumber,4,4),'-',substring(h.ifmpnumber,7,4)) '폰 번호2'
        ,ifnull(c.ifaosnstypecd,"-") as 'sifaosnstyped'
        from
			infrmember a
            left join infrmemberaddress b on b.ifmadelny = 0 and b.ifmadefaultny = 1 and b.ifmmseq = a.ifmmseq
            left join infrmemberaddressonline c on c.ifaoDelNy = 0 and c.ifaodefaultny = 1 and c.ifmmseq = a.ifmmseq
            left join infrmemberemail d on d.ifmedelNy=0 and d.ifmedefaultny =1 and d.ifmmseq = a.ifmmseq
            left join infrMemberJoinQna e on e.ifJqDelNy =0 and e.ifmmseq = a.ifmmseq
            left join infrMemberNationality f on f.ifmndelNy =0 and f.ifmnDefaultNy = 1 and f.ifmmseq = a.ifmmseq
				left join infrnationality g on g.ifnaseq = f.ifnaSeq
			left join infrmemberphone h on h.ifmpdelny=0 and h.ifmpdefaultny =1 and h.ifmmseq = a.ifmmseq
            
		where 1=1
			and a.ifmmdelny= 0
            -- and b.ifmatypecd = 46
            -- and c.ifaosnstype = 37
            -- and a.ifmmseq = 2
    ;
    select * from infrmemberaddressonline;
    select * from infrmember;
    select * from infrcode;
    
    
    
    
    
    
    select a.ifatseq '관리자코드'
			,(select ifatname from infrauth where ifatseq = a.ifatseq) '관리자명'
            ,a.ifmuseq '권한 코드'
            ,(select ifmuname from infrmenu where ifmuseq = a.ifmuseq) '권한 명'
            ,a.ifaurolecd '역할 코드'
            ,(select ifcdname from infrcode where ifcdseq = a.ifaurolecd) '역할 명'
		from infrauthmenu a;
        