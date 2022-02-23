

-- 고객정보 확인

SELECT b.name
, b.userId as '아이디'
, (select concat(a.emailId,'@', code.value) 
  from user a, code 
  where code.id= a.emailDomain and a.id = b.id) as '유저이메일'
  , (SELECT CONCAT(a.province," ",a.city," ",a.gu," ", a.dong," " ,a.detail)
	FROM address a
    where a.user_id = b.id) '자주 사용하는 주소'
, b.point '포인트'
, p.title '상품명'
, o.grandPrice
,(SELECT cc.name
 FROM cardCompany cc, preferredpayment pp
 WHERE pp.cardCompanyCD = cc.id) '자주 사용하는 결제수단'

FROM user b
LEFT JOIN orders o on b.id=o.user_id
LEFT JOIN item i on b.id = i.user_id 
LEFT JOIN product p on i.product_id = p.id
LEFT JOIN address a on a.user_id = b.id
LEFT JOIN preferredpayment pp on pp.user_id = b.id
WHERE b.venderNy = 0 and a.preferredNy = 1;

-- 고객정보 확인 끝

-- 고객별 주문정보 확인

SELECT 
 od.id '주문번호'
,us.name '주문자명'
, it.product_id '상품코드'
, pr.title '상품이름'
, ( pr.price - pr.price/pr.discount) '가격'
, pr.discount '할인률'
, it.quantity '갯수'
, co.name '쿠폰이름'
, co.discount '쿠폰할인률'
, (SELECT 가격 - 가격/co.discount
FROM coupon co, product pr, item it
WHERE it.coupon_id = co.id and it.product_id = pr.id) '쿠폰할인 적용가'
, (SELECT a.name 
	FROM options a, options b , option_item c
    WHERE a.id = b.parent_id and b.id=c.option_id) '옵션1'
, op.name '옵션2'
, (SELECT a.value
	FROM code a, orders b
	WHERE a.id = b.paymentCD) '결제방법'
, (SELECT a.name
	FROM cardcompany a, orders b
	WHERE a.id = b.cardCompanyCD) '카드사'
, dcc.DiscountPercentage '카드할인률'
, (SELECT a.value 
	FROM CODE a
	WHERE a.id=pr.shippingfeeCD) '배송비'
, (SELECT a.value
	FROM CODE a
	WHERE a.id = od.statusCD) '상태'



FROM orders od
LEFT JOIN User us on od.user_id = us.id
LEFT JOIN item it on it.id = od.item_id 
LEFT JOIN coupon co on co.id = it.coupon_id
LEFT JOIN product pr on pr.id = it.product_id
LEFT JOIN Option_item op_it on op_it.item_id = it.id
LEFT JOIN Options op on op.id = op_it.Option_id
LEFT JOIN product pro on pr.id = op.product_id
LEFT JOIN discountoncard dcc on pr.id=dcc.product_id
WHERE od.cardCompanyCD = dcc.companyCD;

-- 주문내역 조회 끝

-- 상품정보
SELECT pr.title
,(SELECT ct.name
FROM Category ct, product pr
WHERE ct.id = pr.category) 'lower 카테고리'
,(SELECT pa.name
FROM Category ct, product pr, Category pa
WHERE ct.id = pr.category and ct.parent=pa.id) 'middle 카테고리'
,(SELECT paa.name
FROM Category ct, product pr, Category pa, Category paa
WHERE ct.id = pr.category and ct.parent=pa.id and pa.parent = paa.id) 'top 카테코리'
,pr.price
,pr.seller
,pr.brand
,pr.stock '재고'
FROM Product pr;
