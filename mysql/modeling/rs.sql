			SELECT 
				u.id,
				u.userId,
				u.password,
				u.name,
				u.birthDate,
				u.gender,
				u.phoneNumber,
				u.personalDataCollectNy,
				u.eventNotificationNy,
				u.emailFull,
				ad.fullAddress,
				ad.detail,product
				ad.postalNo,
				od.item_id,image
				pro.title,
				(SELECT value FROM code WHERE id = od.statusCD) as status,
				od.date,
				od.grandPrice,
				od.shippingAddress,
				od.shippingDetailAddress,category
				re.title,
				re.content,
				re.rating,
				re.publishedAt,
                (SELECT title FROM product WHERE re.Product_id = product.id) as titleRe
				
			FROM
				user as u
			left join address ad on u.id = ad.user_id
			left join orders od on u.id = od.id
			left join item it on od.item_id = it.id
			left join product pro on pro.id = it.product_id
			left join review re on u.id = re.User_id;