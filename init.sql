create database shesg;
use shesg;
create table shesg_links
(
    id                 varchar(40)            primary key   not null comment '主键id',
    shesg_user_id    varchar(40)                          not null comment '用户id',
    url                text                                 null comment 'url链接',
    title              varchar(400)                         null comment '标题',
    image              varchar(400)                         null comment 'link图片地址',
    is_available       tinyint(1) default 1                 not null comment '是否可用 0-不可用 1 - 可用',
    created_at         datetime   default CURRENT_TIMESTAMP not null comment '创建时间',
    updated_at         datetime   default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    type               tinyint(1) default 0                 not null comment '类型 0-普通模块 1-选品模块',
    `rank`             bigint(11) default 0                 not null comment '顺序位次',
    link_sign tinyint(1) default 1                 not null comment '分库分表标志位',
    redirect_url       text                                 null comment '跳转的url链接',
    description        text                                 null comment '链接描述',
    rate               decimal                              null comment '商品的汇率',
    gate_itemcode      varchar(255)                         null comment '敦煌的商品的itemcode',
    commission_amount  decimal(10, 2)                       null comment '佣金金额',
    product_price      decimal(10, 2)                       null comment '商品价格',
    is_delete          tinyint(1) default 0                 not null comment '删除标识，1-已删除，0-未删除',
    index `idx_itemcode` (`gate_itemcode`) using btree comment 'code索引',
    index `idx_type` (`type`) using btree comment '类型索引',
    index `idx_user_id` (`shesg_user_id`) using btree comment '用户索引'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'links';
create table shesg_short_url
(
    id                      varchar(40)       primary key        not null comment '主键id',
    short_url               varchar(255)                         not null comment '短链链接',
    original_url            text                                 not null comment '原本的链接',
    short_url_sign tinyint(1) default 1                 not null comment '分库分表标志位',
    created_at              datetime   default CURRENT_TIMESTAMP not null comment '创建时间',
    updated_at              datetime   default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index `short_url_idx`(`short_url`) using btree
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'shesg短链表';

create table shesg_white_user
(
    user_id                  varchar(40)             primary key not null comment '非洲部落id',
    user_name                varchar(400)                         null comment '用户名',
    white_user_sign tinyint(1) default 1                 not null comment '分库分表标志位',
    created_at               datetime   default CURRENT_TIMESTAMP not null comment '创建时间',
    updated_at               datetime   default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间'
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT 'link_myy_white_user';
create table `shesg_product`
(
    `product_id`        bigint(20)     not null primary key comment '主键',
    `product_url`       varchar(1024)  not null default '' comment '商品地址',
    `product_title`     varchar(512)   not null default '' comment '商品标题',
    `product_image_url` varchar(1024)  not null default '' comment '商品图片地址',
    `product_price`     decimal(10, 2) not null default 0.00 comment '商品价格（美元）',
    `is_delete`         tinyint(1)     not null default 0 comment '删除标识,1-已删除,0-未删除',
    `created_at`        datetime       not null comment '创建时间',
    `updated_at`        datetime       not null comment '更新时间',
    `collection`        varchar(64)    not null default '' comment '集合',
    `category`          varchar(64)    not null default '' comment '类目',
    `details`           text           null comment '商品详情',
    `details_summary`   text           null comment '商品详情摘要'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='shesg商品表';
create table `shesg_user_social_post`
(
    `id`          bigint(20)  not null primary key auto_increment comment '主键',
    `user_id`     varchar(32) not null comment '用户id',
    `social_post` text        null comment '用户的post',
    `created_at`  datetime    not null comment '创建时间',
    `updated_at`  datetime    not null comment '更新时间',
    `openai_recommend_category` varchar(2048) not null default '' comment 'openai推荐的类目'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT ='shesg用户社交平台的post';

insert into `shesg_product` values (255349023330, 'https://www.vivaia.com/item/pointed-toe-ballet-flats-p_10000360.html', 'Pointed-Toe Ballet Flats (Aria 5°)', 'https://cdnimg.vivaia.com/vivaia/products/1677460553-03515b2e-1845-450b-835e-d85d49cf5f45.jpg', 79.00, 0, now(), now(), 'Shoes', 'Flats', 'Aria 5°
Classic pointed-toe flat, wear it everyday for work, commute, at the mall, it is the perfect flat for every occasion. Pair it with a dress, skinny or mom jeans, a tee or a shirt and you are ready to be comfortable all day at every step.

Pointed-toe
Flat 1cm/0.34" heel
Natural Artemisia Argy herbal insole, with heel rebound, arch, and forefoot support
Heel Patch for added comfort
Rubber outsole
Packaged with 90% recycled and 100% recyclable cardboard
Machine washable, remove insoles before washing
Counter Padding

Note: The insole contains natural Artemisia Argyi herbal. People with allergies, please consult a medical professional before wearing.', '');
insert into `shesg_product` values (255349023331, 'https://www.vivaia.com/item/pointed-toe-knot-sandals-p_10001498.html?gid=10001495', 'Pointed-Toe Knot Sandals', 'https://cdnimg.vivaia.com/vivaia/products/1678978348-969ea237-feb4-4722-a23d-1c2d11bdd420.jpg?imresize=800x800', 79.00, 0, now(), now(), 'Shoes', 'Sandals', 'Yaffa
The Yaffa Sandal is designed with a classic mule silhouette, a flattering pointed toe and bold dynamic bow design at the front. A subtle 30mm height heel adds femininity without leaving your feet feeling tired, making these stylish flats perfect for travel, date nights and more.

Pointed toe mules
Knit upper made from plastic bottles
Deodorizing insole
Anti-slip rubber outsole
192g per shoe', '');
insert into `shesg_product` values (255349023332, 'https://www.vivaia.com/item/round-toe-patterned-loafers-p_10003770.html?gid=10003776', 'Round-Toe Embroidered Loafers', 'https://cdnimg.vivaia.com/vivaia/products/1683802489-6d36188d-a4f1-4fd7-9ef6-b52c7d6ae113.jpg?imresize=800x800', 97.00, 0, now(), now(), 'Shoes', 'Loafers', 'Audrey
The classic loafer gets an eco-friendly update! Stylish, comfortable, wide toe-box, perfect for every occasion. We have updated it with several embroidery patterns.

Round-toe
Flat 1cm/0.34" heel
Natural Artemisia Argy herbal insole, with heel rebound, arch and forefoot support
Heel Patch for added comfort
Rubber oustole
Packaged with 90% recycled and 100% recyclable cardboard

Note: The insole contains natural Artemisia Argyi herbal. People with allergies, please consult a medical professional before wearing.', '');
insert into `shesg_product` values (255349023333, 'https://www.vivaia.com/item/wallace-tote-chevron-p_5856.html?gid=5856', 'Wallace Tote-Chevron', 'https://cdnimg.vivaia.com/vivaia/products/1634545157-e5e57b7e-6d54-4b50-801d-d80dfc074f94.jpg?imresize=800x800', 97.00, 0, now(), now(), 'Shoes', 'Shoes', 'Wallace
The Wallace Tote bag is designed with a classic shape with an open interior that can hold up to 15kg and can be used with a clutch bag (not included) for better organization. This stylish women’s tote features an eye-catching color-coordinated pattern and sturdy fabric, making it ideal for everyday use or commuting.

Tote bag
Measurements 16.5"L at base, 22.4"L at top x 5.3"W x 12.6"H （42cm at base, 57cm at top x 13.5cm x 32cm）
Shoulder drop 10.2"/26cm
Made from recycled plastic bottles
One-piece structure
614g weight, 15L capacity
Cold wash and air drying', '');
insert into `shesg_product` values (255349023334, 'https://www.vivaia.com/item/removable-bows-dora-p_10000297.html?gid=10000297', 'Removable Bows-Dora', 'https://cdnimg.vivaia.com/vivaia/products/1644559728-1bf14ff6-2ac1-42ad-870a-b18ec1006e5e.gif?imresize=800x800', 9.90, 0, now(), now(), 'Shoes', 'Bows', 'Dora
Use these ornaments to adorn your VIVAIA shoes or any other shoes! Change the style of your shoe anytime, anywhere. These cute additions will give you endless styling options and make your shoes more dazzling, helping you stand out from the crowd.

1 Pair of Shoe Ornaments = 4 New Shoe Styles
Durable and lightweight
Easy to use
No rubbing & Won\'t fall off
Match a variety of styles
Not machine washable', '');
insert into `shesg_product` values (255349023335, 'https://www.vivaia.com/item/wool-scarf-violet-purple-p_7465.html?gid=7465', 'Wool Scarf-Violet Purple', 'https://cdnimg.vivaia.com/vivaia/products/1640239230-36aec1dd-19e3-49d2-a6e4-1198ee72b1da.jpg?imresize=800x800', 69.00, 0, now(), now(), 'Shoes', 'Shoes', 'Lora
The Lora Scarf features a modern narrow silhouette with a lightweight, barely-there feel and super soft 100% pure wool fabric. Bold accents at the hemline pair perfectly with the subtle texture throughout, making this scarf ideal for both men and women to slip on to keep cozy all winter long.

Model is 5′7″
Measurements 70" L x 11" W  (180cm x 30cm）
Measurements (dark blue) 55" L x 11" W  (140cm x 30cm）
100% wool
Dry clean only
Packaged with 100% biodegradable bag', '');
insert into `shesg_product` values (255349023336, 'https://www.vivaia.com/item/3-in-1-natural-herbs-soft-cushion-insoles-p_10011987.html?gid=10011987', '3-in-1 Cuttable Ultra-Soft Insole', '
https://cdnimg.vivaia.com/vivaia/products/1680260762-3f93a1b9-58df-4eef-bdd2-bcbcff339499.jpg', 19.99, 0, now(), now(), 'Shoes', 'Shoes', 'Ultra Soft Insoles
Easily follow the lines and trim according to size and toe shape needed.

These insoles are comfortable, cushiony, breathable, mold-proof, and moisture-wicking. The perfect replacement for your old insoles.


3-In-1 Insoles
Diamond padded insoles with jersey lining, breathable and moisture-wicking
Added arch support and extra comfort
Natural Artemisia Argy + PU foam insole, with heel rebound, arch, and forefoot support

* Best to replace your insoles every 6 months to maintain the comfort of your VIVAIA shoes

Note: The insole contains natural Artemisia Argyi herbal. People with allergies, please consult a medical professional before wearing.', '');
insert into `shesg_product` values (255349023337, 'https://coliecolingerie.com/collections/mesh-lingerie/products/aster-premium-mesh-lingerie-set', 'ASTER premium mesh lingerie set', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/products/ASTER-premium-mesh-lingerie-set_1800x1800.jpg?v=1673886419', 146.00, 0, now(), now(), 'Lingerie', 'linge', 'The ASTER premium mesh lingerie set comprises the ASTER soft cup bra, ASTER ouvert low rise panties, and HEARTBREAKER high-arch suspender belt and matching garters in your choice of six colours!
Reclaimed mesh: Nylon, Elastane. Lyocell: 95% TENCEL™ Lyocell, 5% Elastane.
100% ethically made in Europe.

• Luxury four piece lingerie set, featuring suspender belt and garters
• Plunge bra shape perfect for wearing under low cut tops
• Wire-free for maximum comfort
• Adjustable ouvert harness panties, suspender belt and detachable thigh harnesses
• Durable, high quality European-knit elastic
• Super soft and breathable TENCEL™ Lyocell gusset for maximum comfort
• Reclaimed power mesh fabric rescued from fast fashion surplus
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023338, 'https://coliecolingerie.com/collections/new/products/lana-high-leg-mesh-lingerie-set', 'LANA HIGH LEG mesh lingerie set', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/files/LANA-HIGH-LEG-mesh-lingerie-set_1800x1800.jpg?v=1683651484', 84.00, 0, now(), now(), 'Lingerie', 'LANA HIGH LEG mesh lingerie set', 'The LANA HIGH LEG mesh lingerie set features a wire-free soft cup bra and high leg, high waist knickers in sustainably-sourced, sheer black mesh with your choice of bold and vibrant complementary colours!
Reclaimed mesh: Nylon, Elastane. Lyocell: 95% TENCEL™ Lyocell, 5% Elastane.
100% ethically made in Europe.

• Cute cut out pin up style design with gold hardware detailing
• Wire-free bra with soft, stretchy and firm power mesh for maximum comfort
• Strong, high quality elastic and full fabric wings for support and durability
• Flattering high leg panties with cheeky shape!
• Reclaimed mesh rescued from fast fashion surplus
• Super soft and breathable TENCEL™ Lyocell gusset for maximum comfort
• Durable, high quality European-knit elastic
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023339, 'https://coliecolingerie.com/collections/new/products/lana-ouvert-mesh-lingerie-set', 'LANA OUVERT mesh lingerie set', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/files/LANA-OUVERT-mesh-lingerie-set_1800x1800.jpg?v=1683651583', 89.00, 0, now(), now(), 'Lingerie', 'LANA OUVERT mesh lingerie set', 'The LANA OUVERT mesh lingerie set features a wire-free soft cup bra and cheeky ouvert high waist knickers in sustainably-sourced, sheer black mesh with your choice of bold and vibrant complementary colours!
Reclaimed mesh: Nylon, Elastane. Lyocell: 95% TENCEL™ Lyocell, 5% Elastane.
100% ethically made in Europe.

• Cute cut out pin up style design with gold hardware detailing
• Wire-free bra with soft, stretchy and firm power mesh for maximum comfort
• Strong, high quality elastic and full fabric wings for support and durability
• Reclaimed mesh rescued from fast fashion surplus
• Super soft and breathable TENCEL™ Lyocell gusset for maximum comfort
• Durable, high quality European-knit elastic
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023340, 'https://coliecolingerie.com/collections/new/products/aster-premium-mesh-lingerie-set', 'ASTER premium mesh lingerie set', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/products/ASTER-premium-mesh-lingerie-set_1800x1800.jpg?v=1673886419', 146.00, 0, now(), now(), 'Lingerie', 'ASTER premium mesh lingerie set', 'The ASTER premium mesh lingerie set comprises the ASTER soft cup bra, ASTER ouvert low rise panties, and HEARTBREAKER high-arch suspender belt and matching garters in your choice of six colours!
Reclaimed mesh: Nylon, Elastane. Lyocell: 95% TENCEL™ Lyocell, 5% Elastane.
100% ethically made in Europe.

• Luxury four piece lingerie set, featuring suspender belt and garters
• Plunge bra shape perfect for wearing under low cut tops
• Wire-free for maximum comfort
• Adjustable ouvert harness panties, suspender belt and detachable thigh harnesses
• Durable, high quality European-knit elastic
• Super soft and breathable TENCEL™ Lyocell gusset for maximum comfort
• Reclaimed power mesh fabric rescued from fast fashion surplus
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023341, 'https://coliecolingerie.com/collections/new/products/heartbreaker-thigh-harness', 'HEARTBREAKER thigh harness (pair)', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/products/HEARTBREAKER-thigh-harness-pair_1800x1800.jpg?v=1673886327', 43.00, 0, now(), now(), 'Lingerie', 'HEARTBREAKER thigh harness (pair)
', 'The HEARTBREAKER thigh harness is your go-to when you want to rock that suspender belt without wearing stockings. These garters are designed to attach to any suspenders, made with super high quality European knit elastic, and available in your choice of black and white.
All elastics OEKO-TEX STANDARD 100 certified.
100% ethically made in Europe.

• Includes two garters
• Anchors your suspender belt when worn without stockings
• Universal - attaches to all suspender belts
• Adjustable straps for a perfect fit
• Soft, OEKO-TEX certified European-knit elastic
• Your choice of black or white elastic
• Handmade to order with custom sizing available
• Gift ready, beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023342, 'https://coliecolingerie.com/collections/new/products/remi-tencel-romper', 'REMI TENCEL™ romper', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/products/REMI-TENCELtm-romper_1800x1800.jpg?v=1673886390', 77.00, 0, now(), now(), 'Lingerie', 'REMI TENCEL™ romper', 'Made from soft, breathable and sustainably produced TENCEL™ Intimate fibers, the REMI playsuit couples a sleek 1960s loungewear style with a forget-you\'re-wearing-it comfiness!
95% TENCEL™ Lyocell, 5% Elastane. All fabric and elastics OEKO-TEX certified.
100% ethically made in Europe.

• Adjustable shoulder straps and fine elasticated waistband for a perfect fit
• Made from TENCEL™ Intimate fibers derived from sustainable wood sources
• Gentle on the skin, offering long-lasting comfort and high breathability
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023343, 'https://coliecolingerie.com/collections/new/products/zoey-tencel-french-knickers', 'ZOEY TENCEL™ french knickers', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/products/ZOEY-TENCELtm-french-knickers_1800x1800.jpg?v=1673886360
', 50.00, 0, now(), now(), 'Lingerie', 'ZOEY TENCEL™ french knickers', 'Loungewear heaven! The ZOEY french knickers are made from soft, breathable and sustainably produced TENCEL™ Intimate fibers, and feature a super comfortable high waist design with an adjustable waistband for a perfect fit.
95% TENCEL™ Lyocell, 5% Elastane. All fabric and elastics OEKO-TEX certified.
100% ethically made in Europe.

• Super comfy option as lounge pants or sleep shorts
• Soft and sustainably produced lyocell fabric
• Made from TENCEL™ Intimate fibers derived from sustainable wood sources
• Gentle on the skin, offering long-lasting comfort and high breathability
• Elasticated waistband with adjustable strap at the back for a perfect fit
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023344, 'https://coliecolingerie.com/collections/new/products/lana-mesh-soft-cup-bra', 'LANA mesh soft cup bra', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/files/LANA-mesh-soft-cup-bra_1800x1800.jpg?v=1683651286', 55.00, 0, now(), now(), 'Lingerie', 'LANA mesh soft cup bra', 'The LANA soft cup bra is made from sustainably-sourced, stretchy and firm sheer mesh in jet black with your choice of four complementary colours!
Reclaimed mesh: Nylon, Elastane.
100% ethically made in Europe.

• Cute cut out design delivers a pin up look and smooth cup shape
• Wire-free with soft, stretchy and firm power mesh for maximum comfort
• Strong, high quality elastic and full fabric wings for support and durability
• Adjustable shoulder straps for a perfect fit
• Reclaimed mesh fabric rescued from fast fashion surplus
• Your choice of four colours
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023345, 'https://coliecolingerie.com/collections/new/products/lana-mesh-high-leg-panties', 'LANA mesh high leg panties', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/files/LANA-mesh-high-leg-panties_1800x1800.jpg?v=1683651342', 36.00, 0, now(), now(), 'Lingerie', 'LANA mesh high leg panties', 'The LANA high leg knickers are made from sustainably-sourced, stretchy and firm sheer mesh in jet black with your choice of four complementary colours.
Reclaimed mesh: Nylon, Elastane. Lyocell: 95% TENCEL™ Lyocell, 5% Elastane.
100% ethically made in Europe.

• Flattering high leg, cheeky shape!
• Cute cut out with gold hardware detailing and hook fastening
• Choice of four different complementary colours
• Reclaimed mesh rescued from fast fashion surplus
• Strong, high-quality scallop-edged elastic for a snug fit
• Super soft and breathable TENCEL™ Lyocell gusset for maximum comfort
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023346, 'https://coliecolingerie.com/collections/new/products/lana-mesh-ouvert-high-waist-panties', 'LANA mesh ouvert high waist panties ', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/files/LANA-mesh-ouvert-high-waist-panties_1800x1800.jpg?v=1683651388', 40.00, 0, now(), now(), 'Lingerie', 'LANA mesh ouvert high waist panties', 'The LANA ouvert high waist knickers are made from sustainably-sourced, stretchy and firm sheer mesh in jet black with your choice of four complementary colours.
Reclaimed mesh: Nylon, Elastane. Lyocell: 95% TENCEL™ Lyocell, 5% Elastane.
100% ethically made in Europe.

• Retro high waist style
• Cheeky cut out design with gold hardware detailing
• Choice of four different complementary colours
• Reclaimed mesh rescued from fast fashion surplus
• Strong, high-quality scallop-edged elastic for a snug fit
• Super soft and breathable TENCEL™ Lyocell gusset for maximum comfort
• Handmade to order with custom sizing available
• Beautifully packaged in 100% recycled materials
• FREE 100% carbon-offset, priority airmail shipping worldwide', '');
insert into `shesg_product` values (255349023347, 'https://coliecolingerie.com/collections/new/products/guppyfriend-washing-bag', 'GUPPYFRIEND washing bag', 'https://cdn.shopify.com/s/files/1/0007/7135/8778/files/GUPPYFRIEND-washing-bag_1800x1800.jpg?v=1683651636', 39.00, 0, now(), now(), 'Lingerie', 'GUPPYFRIEND washing bag', 'Use the GUPPYFRIEND washing bag when you wash your smalls to help protect your garments and to prevent microfibres from entering rivers and oceans.
The GUPPYFRIEND washing bag helps keep your lingerie, underwear and swimwear looking as good as possible for as long as possible, whilst actively protecting the marine environment.
Made in Europe, 100% recyclable, 100% plastic free packaging.

• Captures microfibres shed by synthetic clothing during washing to keep them out of waste water, waterways and the marine environment
• Also reduces fibre shedding to help protect your clothing
• Keeps your lingerie, underwear and swimwear looking as good as possible for as long as possible!
• Made from monofilament polyester, meaning that it doesn\'t shed fibres itself
• Made in Europe and 100% recyclable
• 100% plastic free packaging
• Size M: 50cm x 74cm', '');
insert into `shesg_product` values (255349023348, 'https://www.outlanddenim.com/products/essential-crew-tan-unisex', 'Essential Crew - Tan (Unisex)', 'https://cdn.shopify.com/s/files/1/0265/1625/8864/products/womens-essential-crew-tan-1_256493d9-c00d-4b66-bc1b-b78f8af16049_1000x.jpg?v=1650760009', 179, 0, now(), now(), 'Denim', 'Denim', 'The Essential Crew feels luxuriously natural to wear, like a second skin. It’s made with our premium 100% organic cotton jersey for an elevated extra soft internal and external texture. Designed for maximum comfort and freedom of movement with medium-weight fabric that will keep you cosy on cold days or in-between seasons. Finished with our signature Good For Humanity wrist patch - essentially a badge of honour that says “my sweater makes the world a better place, what does yours do?” Available in two dreamy tones inspired by earth. An elevated everyday essential to walk with you through life - truly an investment in your outerwear.Designed to be a relaxed fit. Female model wears size S. Male model wears size L.Enjoy free standard shipping on all orders over $200 in Australia and New Zealand.', '');
insert into `shesg_product` values (255349023349, 'https://www.outlanddenim.com/products/zoe-ecru', 'Zoe - Ecru', 'https://cdn.shopify.com/s/files/1/0265/1625/8864/products/womens-jean-straight-crop-zoe-ecru-2_1000x.jpg?v=1636509381', 249.90, 0, now(), now(), 'Denim', 'Denim', 'This jean makes an impact in more ways than one. Zoe is our objectively cool straight-leg cut. The epitome of classic denim, Zoe’s iconic shape is a little more relaxed than our Abigail jean, but slimmer than the Athina.Zoe has a super high 11” rise, designed with leg-lengthening, waist-hugging, bum-flattering superpowers. She is finished with a raw hem measuring 27.5” from the crotch to hem - leave as is or chop to your ideal length.Our new Ecru denim wash has a beautiful untouched effect. The nature of this fabric means that subtle flecks and colour variations feature throughout, giving each individual piece a beautifully unique, raw, and authentic finish. The fabric\'s open weave gives it a light-weight, soft, and drapey feel - challenging any notion that denim can\'t be enjoyed in the warmer months. Finished with copper hardware, fawn contrast stitching, and grey jacron brand patch with soft pink undertones.Shop comfortably with free shipping, returns, and exchanges on all orders over $100', '');
insert into `shesg_product` values (255349023350, 'https://www.outlanddenim.com/collections/new-arrivals/products/lucy-ink', 'Lucy - Ink', 'https://cdn.shopify.com/s/files/1/0265/1625/8864/products/womens-highrise-jean-lucy-ink-front_e6ca47fa-1293-4dd4-8e5a-4d32ab7c2b10_1000x.jpg?v=1634091206', 200, 0, now(), now(), 'Denim', 'Denim', 'Made with organic cotton, Lucy is a best seller and shapes sensationally to your figure. It’s as though you’ve worn her for years. With a natural shape, Lucy was designed to be more relaxed than a skinny jean with a 10.5” high-rise waist and a 30” inseam length.
Shop comfortably with free shipping, returns, and exchanges on all orders over $150.', '');
insert into `shesg_product` values (255349023351, 'https://www.outlanddenim.com/collections/new-arrivals/products/lucy-bloom', 'Lucy - Bloom', 'https://cdn.shopify.com/s/files/1/0265/1625/8864/products/womens-highrise-jean-lucy-bloom-front_4fe4f614-87d4-4714-9442-ec6748e8128d_1000x.jpg?v=1634091124', 200, 0, now(), now(), 'Denim', 'Denim', 'Made with organic cotton, Lucy is a best seller and shapes sensationally to your figure. It’s as though you’ve worn her for years. With a natural shape, Lucy was designed to be more relaxed than a skinny jean with a 10.5” high-rise waist and a 30” inseam length.
Shop comfortably with free shipping, returns, and exchanges on all orders over $150.', '');
insert into `shesg_product` values (255349023352, 'https://www.outlanddenim.com/collections/new-arrivals/products/zoe-peachy-keen', 'Zoe - Peachy Keen', 'https://cdn.shopify.com/s/files/1/0265/1625/8864/products/womens-jean-straight-crop-zoe-peachy-keen-pink-1_1000x.jpg?v=1644212256', 220, 0, now(), now(), 'Denim', 'Denim', 'This jean makes an impact in more ways than one. Zoe is our objectively cool straight-leg cut. The epitome of classic denim, Zoe’s iconic shape is a little more relaxed than our Abigail jean, but slimmer than the Athina. Zoe has a super high 11” rise, designed with leg-lengthening, waist-hugging, bum-flattering superpowers. She is finished with a raw hem measuring 27.5” from the crotch to hem - leave as is or chop to your ideal length. Designed prioritising natural fibres and materials, the Peachy Keen range will be our first clay-dyed offering. The beautiful peachy pigment is the result of natural textile dyeing using clay, which originally dates back to ancient times before the rise of synthetic dyes of the 19th century. Made with 100% certified organic cotton, the edit has also been designed to mitigate the release of micro-plastics into waterways during home laundering. Originating in Turkey, before taking on a new life in these denim pieces, the clay\'s pigment represents the story of earth events - sunlight, wind, pressure, heat, which results in a natural hue, without chemical interference. The process also uses 72.6% less water during the dying process and results in lower carbon emissions. Shop comfortably with free shipping, returns, and exchanges on all orders over $100', '');
insert into `shesg_product` values (255349023353, 'https://www.outlanddenim.com/collections/new-arrivals/products/diana', 'Diana - Authentic', 'https://cdn.shopify.com/s/files/1/0265/1625/8864/products/womens-jean-straight-diana-authentic-light-blue-2_1000x.jpg?v=1636509115', 210, 0, now(), now(), 'Denim', 'Denim', 'Named in honour of our favourite \'mum jean\' aficionado, the Diana is a \'90s inspired straight leg fit refined for today with contemporary details. She has a super flattering, waist-hugging high-rise and a standard 30" hemmed inseam. Diana is not quite as figure hugging as our Zoe jean, but slimmer than our boyfriend Athina jean.Shop comfortably with free shipping, returns, and exchanges on all orders over $100.', '');
insert into `shesg_product` values (255349023354, 'https://bario-neal.com/product/burst-cluster-diamond-ring-1-0ct-in-progress/', 'Burst Cluster Diamond Ring 2.0cts', 'https://bario-neal.com/wp-content/uploads/2023/02/Burst-Cluster-Diamond-Ring-1.0ct-_1_WEB2-4-1920x1033.jpg', 8270, 0, now(), now(), 'Accessories', 'Engagement Rings', 'This ring features a diamond center stone with a mix of diamond side stones.
Stones: (1) 1.0ct Diamond (choose lab grown or natural), (2) 4mm Diamond (.25ct), (2) 3.5mm Diamond (.17ct), (3) 2.5mm Diamond (.06ct), Total ct weight: 2.02ct
Setting: prong set
Natural Diamonds above .40ct are GIA certified and within 0.05ct of the sizes listed. Lab Grown Diamonds above .40ct are IGI or GCAL certified and within 0.05ct of the sizes listed. Our Gemstone Specialists select the highest grade diamond available starting with I color/SI1 clarity. Contact us if you would like a specific diamond quality.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023355, 'https://bario-neal.com/product/eaves-cluster-opal-with-morganite-ring/', 'Eaves Cluster Opal with Morganite Ring', 'https://bario-neal.com/wp-content/uploads/2021/10/New_Eaves-Cluster-Opal-with-Morganite-Ring_14Y_1_WEB2-1920x1046.jpg', 1080.00, 0, now(), now(), 'Accessories', 'Engagement Rings', 'This cluster ring glistens with a mix of opal, morganite, white and champagne diamond shapes.
Stones: (1) 6x4mm Opal, (1) 5x3mm Pear Cut Morganite, (1) 1.7mm Champagne Diamond, (1) 2mm Princess Cut Diamond
Setting: prong set
Dimensions: The cluster measures 11mm long x 7mm wide x 4mm tall on a 1.4mm round band.
Opals can be worn daily, with the awareness that opals are a soft and porous stone. It is important to take your opal jewelry off during activities that could cause damage. Depending on wear, an opal may chip, scratch, or scuff relatively easily. Opals are vulnerable to cracking if exposed to rapid changes in temperature such as doing the dishes and showering. Opals can become discolored when exposed to water, household cleaning solutions, soap, hand sanitizer, perfume, lotion, and heat.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023356, 'https://bario-neal.com/product/eaves-cluster-white-sapphire-oval-with-morganite-ring/', 'Eaves Cluster White Sapphire Oval with Morganite Ring', 'https://bario-neal.com/wp-content/uploads/2021/10/Eaves_Cluster_Sapphire_and_Morganite_Ring_1_14Y_WEB2.jpg', 1340.00, 0, now(), now(), 'Accessories', 'Engagement Rings', 'This cluster ring glistens with a mix of white sapphire, morganite, champagne diamond, and smoky quartz shapes.
Stones: (1) 6x3mm Oval White Sapphire, (1) 5x3mm Pear Cut Morganite, (1) 1.7mm Champagne Diamond, (1) 2mm Princess Cut Smoky Quartz
Setting: prong set
Dimensions: The cluster measures 10mm long x 7.2mm wide x 4mm tall on a 1.4mm round band.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023357, 'https://bario-neal.com/product/trillion-dyad-white-sapphire-pendant-yellow-gold/', 'Trillion Dyad White Sapphire Pendant Yellow Gold', 'https://bario-neal.com/wp-content/uploads/2022/04/Trillion_Dyad_White_Sapphire_Pendant_14Y_1_WEB2-1080x1080.jpg', 1620.00, 0, now(), now(), 'Accessories', 'Nacklaces', 'This contemporary necklace features trillion cut white sapphires.
Metal: Reclaimed 14kt Yellow Gold
Stones: (2) 6mm Trillion Cut White Sapphire
Setting: bezel set
Finish: Polish
Chain: 1.3mm wide and 18″ long – adjustable to 16″ or 14″.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023358, 'https://bario-neal.com/product/burst-cluster-diamond-earrings-yellow-gold/', 'Burst Cluster Diamond Earrings Yellow Gold', 'https://bario-neal.com/wp-content/uploads/2022/04/burst_cluster_diamond_earring_14y_1_web2.jpg', 6460.00, 0, now(), now(), 'Accessories', 'Earrings', 'These timeless cluster earrings feature a mix of diamonds.
Metal: Reclaimed 14kt Yellow Gold
Stones: (1) .50ct Diamond (5mm), (1) .25ct Diamond (4mm), (1) .10ct Diamond (3mm) (per earring)
Setting: prong set
Finish: Polish
Natural Diamonds above .40ct are GIA certified and within 0.05ct of the sizes listed. Our Gemstone Specialists select the highest grade diamond available starting with I color/SI1 clarity. Contact us if you would like a specific diamond quality.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023359, 'https://bario-neal.com/product/gale-bracelet-yellow-gold/', 'Gale Bracelet Yellow Gold', 'https://bario-neal.com/wp-content/uploads/2022/02/gale_bracelet_14y_1-web2_1.jpg', 1880.00, 0, now(), now(), 'Accessories', 'Bracelets', 'An open and organic shaped bangle.
Metal: Reclaimed 14kt Yellow Gold
Finish: Polish
Dimensions: The bracelet measures ~61mm in diameter x 15.25mm wide.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023360, 'https://bario-neal.com/product/arc-bracelet-with-robins-egg-blue-enamel-yellow-gold/', 'Arc Bracelet with Robin’s Egg Blue Enamel Yellow Gold', 'https://bario-neal.com/wp-content/uploads/2022/02/enamel_bracelet_gg_1_web2.jpg', 1840.00, 0, now(), now(), 'Accessories', 'Bracelets', 'An asymmetrical shaped bracelet with translucent robin’s egg blue glass enamel over opaque white glass enamel.
Metal: Reclaimed 18kt Yellow Gold
Finish: Satin
Dimensions: This bracelet measures ~72x55mm.
Enameling is an ancient craft dating back centuries. Since it is a handcrafted process the colors can vary slightly based on the metal color and technique.
All Bario Neal jewelry is handmade. Each piece is unique and variations are considered part of the beauty of the design.', '');
insert into `shesg_product` values (255349023361, 'https://www.sorellaorganics.com.au/products/boardwalk-day-pant-grey-marle', 'Boardwalk day pant in grey marle', 'https://cdn.shopify.com/s/files/1/0564/4366/6521/products/H3A1400-copy_6a82c8e7-8872-4787-8738-510fe7c45e5c.jpg?v=1650521591', 30, 0, now(), now(), 'Womenswear', 'pant', 'The loungewear that will take you literally everywhere.
Perfect for lounging, the school pick up, shopping, even yoga.  Or maybe you’re a contemporary kind of girl and love the look of our bestselling PJ pant but would love a lace-free ankle hem?  You’re in luck because the Boardwalk pant will be whatever you want them to be.
Made with our ultra soft organic cotton, this pant is a great all-rounder for all seasons. The cut is comfortable and stylish, it features a soft elasticised waistband with herringbone drawstring, and a little fabric stretch guarantees unrestricted movement when you’re on the move.
Team with our singlets, long sleeve Ts, and unisex Tshirts for a complete outfit.
Current stock is running large & long. If you are between sizes for waist, we suggest ordering 1 whole size down.  Please also note approximate leg lengths (+-2cm):
Small -  102cm / Medium 104cm / Large 106cm / XL 108cm
Also available in vintage black
', '');
insert into `shesg_product` values (255349023362, 'https://www.sorellaorganics.com.au/products/boardwalk-day-pant-in-vintage-black', 'Boardwalk day pant in vintage black', 'https://cdn.shopify.com/s/files/1/0564/4366/6521/products/H3A1854-copy.jpg?v=1650521665', 61, 0, now(), now(), 'Womenswear', 'pant', 'The pant that will take you literally everywhere.
Perfect for lounging, the school pick up, shopping, even yoga.  Or maybe you\'re a contemporary kind of girl and love the look of our bestselling PJ pant but would love a lace-free ankle hem?  You\'re in luck because the Boardwalk Pant will be whatever you want them to be.
Made with our ultra soft organic cotton, this pant is a great all-rounder for all seasons. The cut is comfortable and stylish, it features a soft elasticised waistband with herringbone drawstring, and a little fabric stretch guarantees unrestricted movement when you\'re on the move.
Team with our singlets, long sleeve Ts, and unisex Tshirts for a complete outfit.
Current stock is running large & long. If you are between sizes for waist, we suggest ordering 1 whole size down.  Please also note approximate leg lengths (+-2cm):
Small -  102cm / Medium 104cm / Large 106cm / XL 108cm
Also available in grey marle', '');
insert into `shesg_product` values (255349023363, 'https://www.sorellaorganics.com.au/products/sleepshirt-in-black', 'sleepshirt in vintage black', 'https://cdn.shopify.com/s/files/1/0564/4366/6521/products/Button-Sleepshirt-2_66f376ca-0dd3-4d7d-8750-04b9ee8907f9.jpg?v=1650521651', 61, 0, now(), now(), 'Womenswear', 'sleepshirt', 'Give back that nana nightie and feel feminine in our organic cotton sleepshirt. Minimalist in design, this nightie has all the features you need making it a customer favourite for good reason – a flattering cut, a great length, super soft organic cotton and cute button detail. It\'s the nightshirt you will wear all year round.
Lightweight organic cotton with generous stretch
Non-restrictive sleeves
Flattering scoop hemline', '');
insert into `shesg_product` values (255349023364, 'https://www.sorellaorganics.com.au/products/lounge-wrap-in-evening-sky', 'lounge wrap in evening sky', 'https://cdn.shopify.com/s/files/1/0564/4366/6521/products/w_esky_wrap_sleepshirt.jpg?v=1651047057', 21, 0, now(), now(), 'Womenswear', 'lounge', 'The organic lounge wrap is the perfect piece for all occasions. Flattering fit and feminine pleat detail, you\'ll love the versatility of this wrap. Soft and cosy for cooler nights to match your sorella organics pajamas, or wear as a stylish layer to complete any outfit. Versatile design: tie at the front, back or leave loose.', '');
insert into `shesg_product` values (255349023365, 'https://svala.co/products/simma-tote-gold-speckled-cork', 'Simma Tote - Gold Speckled Cork', 'https://cdn.shopify.com/s/files/1/0621/2053/products/SimmaTote-vegangoldcork-front-Svala_2048x.jpg?v=1599368959', 195.00, 0, now(), now(), 'Womenswear', 'Bag', 'The Simma tote in gold speckled natural cork can take you from work to the weekend. This lightweight bag is large enough to hold your daily essentials, including a 13” Macbook.
Handcrafted with natural, biodegradable, vegan cork fabric, speckled with gold.
Lined with recycled polyester made with plastic bottles combined with organic cotton
Dimensions: 12.2” Width x 13” Height x 4” Depth
Interior pocket (8” Width x 7” Height) to store smartphone.
Strap drop: 9”
Hidden magnetic closure
Detachable gold Svala swallow charm
Organic cotton Svala dust bag included
Made in Los Angeles', '');
insert into `shesg_product` values (255349023366, 'https://svala.co/products/gemma-backpack-purse-natural-cork', 'Gemma Backpack Purse - Natural Cork', 'https://cdn.shopify.com/s/files/1/0621/2053/products/Gemmabackpackpursecorklifestyle_2048x.jpg?v=1653944581', 295.00, 0, now(), now(), 'Womenswear', 'Bag', 'The Gemma backpack purse is an elegant and versatile bag that can be worn as a backpack or handbag by adjusting the removable straps. This convertible vegan bag is polished enough for your work meetings but is also perfect for your favorite music or art festival. Designed for the modern woman on the go, the Gemma will take you from work to the weekend and anywhere in between with effortless style.
This Gemma backpack purse is handcrafted from premium cork from Portugal.
 Handcrafted with natural, biodegradable, vegan cork fabric
Lined with recycled polyester made with plastic bottles combined with organic cotton
Dimensions: 10.5” Width x 10” Height x 5.5” Depth
Interior pocket (7” Width x 8” Height) to store smartphone and keys
Bag can fit an iPad
2 adjustable straps with buckles – handbag can be worn as a backpack or as a purse with 1 or 2 straps
Adjustable handbag strap drop: 10.5” to 13”
Hidden magnetic closure
Made in Los Angeles
Organic cotton Svala dust bag included
', '');
insert into `shesg_product` values (255349023367, 'https://svala.co/products/sara-wallet-purse-gold-speckled-cork', 'Sara Wallet Purse - Gold Speckled Cork', 'https://cdn.shopify.com/s/files/1/0621/2053/products/GoldcorkSarawalletpursewithmodel_strap_2048x.jpg?v=1634424560', 250, 0, now(), now(), 'Womenswear', 'Bag', 'The Sara wallet purse is perfect for the girl on the go. This vegan wallet is great for daily use and doubles as a purse – just add the detachable gold chain or crossbody strap. This convertible wallet is handcrafted from gold speckled cork premium cork from Portugal.
Handcrafted with natural, biodegradable, vegan cork fabric, speckled with gold
Lined with recycled polyester made with plastic bottles combined with organic cotton
Dimensions: 7.75” Width x 4” Height x 1” Depth
Adjustable crossbody strap drop: 18” to 21.5”
Gold chain strap drop: 21"
4 interior credit card slots, 1 zipper pocket, 1 bill pocket
Can fit an iPhone 12 Plus inside
Double magnetic closure
Detachable gold chain strap
Made in Los Angeles
Organic cotton Svala dust bag included', '');
insert into `shesg_product` values (255349023368, 'https://www.ugg.com/women-boots-classic-boots/classic-short-ii/1016223.html', 'Classic Short II', 'https://dms.deckers.com/ugg/image/upload/f_auto,q_auto,dpr_auto/b_rgb:eeeeee/w_1008/v1663844567/catalog/images/transparent/1016223-CHE_1.png?_s=RAABAB0', 170, 0, now(), now(), 'Shoes', 'classic-short', 'Item No. 1016223
Our Classic Boot was originally worn by surfers to keep warm after early-morning sessions and has since become iconic for its soft sheepskin and enduring design. Incorporating a durable, ultra-lightweight sole to increase cushioning and traction, these versatile boots pair well with practically anything – try loose boyfriend jeans and a velvet top.
This product was made in a factory that supports women in our supply chain with the help of HERproject. This collaborative initiative creates partnerships with brands like ours to empower and educate women in the workplace.
The outsole of this product is either a SugarSole™ outsole, which is a responsible compound using sugarcane foam that allows us to reduce dependency on fossil fuels by replacing petroleum-based ethylene, or a Treadlite by UGG™ outsole.
Treadlite by UGG™ Proprietary compound which increases cushioning and traction for a supremely lightweight, ultra-durable sole.
Sheepskin Lining Vetted through extensive, industry-leading processes to ensure only the highest quality sheepskin makes the cut, delivering the signature feeling of UGG.
Post-Applied Treatment Treated to repel light amounts of water. Product should be re-treated periodically to maintain protection.
Protected: Post Applied Treatment
Topically applied water repellency treatment
17mm Twinface sheepskin upper
Overlock stitch detailing on seams, Suede heel counter
17mm sheepskin lining
17mm sheepskin insole
Treadlite by UGG™ outsole for comfort
Polyester binding or textile binding made from 100% recycled polyester fibers
8" shaft height
Leather heel label with embossed UGG® logo
Best for: Casual
RN 88276', '');
insert into `shesg_product` values (255349023369, 'https://www.ugg.com/women-sandals/ashton-slide/1136765.html', 'Ashton Slide
', 'https://dms.deckers.com/ugg/image/upload/f_auto,q_auto,dpr_auto/b_rgb:eeeeee/w_1008/v1670328278/catalog/images/transparent/1136765-RYBG_1.png?_s=RAABAB0', 120, 0, now(), now(), 'Shoes', 'ashton-slide', 'Item No. 1136765
This open-toe, slide sandal features a chunky EVA and rubber outsole designed for all-day comfort. Secure a custom fit with an adjustable instep strap and hook-and-loop closure. Take simple tees and shirts to new heights.

Nubuck, UGG® webbing upper
Elastic gore, UGG® graphic logo on strap end
Hook-and-loop closure, Adjustable instep strap
Microfiber lining
EVA footbed
EVA + rubber outsole
Heat-embossed UGG® logo
RN 88276', '');
insert into `shesg_product` values (255349023370, 'https://girlfriend.com/products/breeze-rib-high-rise-legging?query=78b85f225f04879b553151103a3b93a7&objectID=40082438291519', 'Breeze RIB High-Rise Legging', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/4034_RibHRLegging_Breeze_2.jpg?v=1683757653', 88, 0, now(), now(), 'Womenswear & Plus Size', 'Breeze RIB High-Rise Legging', 'All the benefits of our #1 Compressive Legging (sweat-wicking, squat-proof, smoothing, and a high level of compression for optimal muscle recovery after high-intensity workouts) now in a new ribbed texture.

Looking to add a little dimension to those leggings you love so much? We’ve got just the thing. True, Compressive RIB was technically designed for working out, but if you ask us, its cool, comfy texture makes it perfect for pairing with a classic button up heading straight to work or social stuff post-class.
Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Designed for high-impact workouts
Small hidden back pocket for keys or cards
Sweat-wicking and sheer-proof
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023371, 'https://girlfriend.com/products/breeze-rib-sport-skort?query=78b85f225f04879b553151103a3b93a7&objectID=40082439733311', 'Breeze RIB Sport Skort', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/4054_RibSportSkort_Breeze_2.jpg?v=1683757665', 72, 0, now(), now(), 'Womenswear & Plus Size', 'RIB Sport Skort', 'Our best-selling high-rise exercise skort in the touch-me RIB texture you know and love.


 Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Made with a textured version of our signature Compressive fabric
Built-in shorts with two side mesh pockets
High-rise
Form-fitting with side slits for added range of motion', '');
insert into `shesg_product` values (255349023372, 'https://girlfriend.com/products/breeze-compressive-rib-high-rise-bike-short?query=e6c6e0db68b29687693315df0ed61213&objectID=40082439012415', 'Breeze RIB High-Rise Bike Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/4035_HRBikeShort_Breeze_2.jpg?v=1683757643', 58, 0, now(), now(), 'Womenswear & Plus Size', '', 'Compressive high-rise bike shorts with an 8.5" inseam and new ribbed texture. Ooh.

If bike shorts have replaced 90% of your bottoms lately, we feel you. Enter your new favorites: they’re sweat-wicking, sheer-proof, compressive, and conveniently available in all your favorite colors. Perfect for running, working out, and pairing with a baggy sweatshirt for trips to the fancy part of the grocery store.
Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Designed for high-impact workouts
Small hidden back pocket for keys or cards
Sweat-wicking and sheer-proof
Soft yet sturdy construction with four-way stretch ', '');
insert into `shesg_product` values (255349023373, 'https://girlfriend.com/products/breeze-rib-high-rise-run-short?query=e6c6e0db68b29687693315df0ed61213&objectID=40082439372863', 'Breeze RIB High-Rise Run Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/4041_RibHRShort_Breeze_2_70e0869b-d4af-4560-af3a-94ab1d458e00.jpg?v=1683651534', 58, 0, now(), now(), 'Womenswear & Plus Size', '', 'Ooh, speedy. Sweat-wicking, compressive high-rise active shorts and new ribbed texture, that keep you cool while looking cool. How cool.

In it for the long run? So are we. With a 4.75" inseam and compressive fit that stays put, the RIB High-Rise Run Short was designed with your speed in mind. Plus, since they\'re made from recycled post-consumer water bottles, they help eliminate waste from the environment — so you can focus on other stuff, like improving that mile time.
Made from 79% recycled plastic bottles (RPET) and 21% spandex', '');
insert into `shesg_product` values (255349023374, 'https://girlfriend.com/products/breeze-rib-tommy-cropped-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40082437210175', 'Breeze RIB Tommy Cropped Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/1030_RibTommyBra_Breeze_1.jpg?v=1683651533', 48, 0, now(), now(), 'Womenswear & Plus Size', '', 'Your favorite square neck sports bra just got a funky update. For all those medium-impact activities you like to do like boxing, biking, or speed-walking home because you forgot your reusable coffee cup.

Nix the racerback and dial up the rib — this textured take on the Tommy Cropped Bra might just be your new favorite top ever. It’s got some added texture to give you all the feels, plus a square neck and low back that give you coverage where you need it and breeziness where you want it. Perfect? We think so.
Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Designed for medium-impact workouts
Square neck and back
Built-in support band hits under bust
Full coverage
Double-lined
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023375, 'https://girlfriend.com/products/heat-rib-devon-compressive-cami?query=e6c6e0db68b29687693315df0ed61213&objectID=40082441568319', 'Heat RIB Devon Compressive Cami', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/1037_RibCamiTop_Heat_1.jpg?v=1683651534', 48, 0, now(), now(), 'Womenswear & Plus Size', '', 'A ribbed version of our beloved Devon Compressive Cami. A goes with everything, works for anything kind of top that keeps you covered and comfy with its adjustable straps, classic cami silhouette, and soft, mold-to-you feel.

It’s a bra, it’s a top, it’s a super cute way to keep trash out of landfills. The RIB Devon Compressive Cami gives you the coverage of a longline bra, low to medium-impact support by way of its built-in bra, and the easy versatility of a cami. Pretty much the perfect everyday top, don’t you think?
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Built-in bra provides low to medium-impact support
Adjustable straps
Longline silhouette designed to cover top of high-rise leggings
To take care of it, machine wash cold and lay flat to dry. Please note colors may bleed at first, so always wash with like colors in cold water. ', '');
insert into `shesg_product` values (255349023376, 'https://girlfriend.com/products/heat-rib-paloma-racerback-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40082440486975', 'Heat RIB Paloma Racerback Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/1028_RibPalomaBra_Heat_1.jpg?v=1683651532', 52, 0, now(), now(), 'Womenswear & Plus Size', '', 'A textured new take on our #1 best-selling bra with a longline silhouette, racerback, and medium-impact support. Cute, right?

Oh, Paloma — the be all end all perfect (and best-selling) sports bra you love for its full coverage compression, sweat-wicking design, and overall just great qualities. Now you can have Paloma in a textured ribbed look. We get it — sometimes you need a lil’ something.
Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Designed for low to medium-impact workouts
Racerback with a scoop neck
Built-in support band
Full coverage and double-lined
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023377, 'https://girlfriend.com/products/heat-rib-dylan-tank-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40082440847423', 'Heat RIB Dylan Tank Bra', 'https://images.prismic.io/girlfriend-co/2fce0b36-23d5-4fbd-8c23-10598be82123_Mobile+Hero+43.jpg?auto=compress,format', 52, 0, now(), now(), 'Womenswear & Plus Size', '', 'A ribbed version of our beloved Dylan Tank Bra. Complete with a high neck, longline design, and compressive support.

New favorite bra alert. With a ribbed finish and a longline cut, this compressive sports bra will keep you comfy and supported through all of your medium-impact workouts. Like, oh we don’t know, cycling, training, and scouring the city for a new favorite brunch spot perhaps.
Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Designed for medium-impact workouts
High crew neckline
Built-in support band
Full coverage and double-lined
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023378, 'https://girlfriend.com/products/heat-rib-bea-banded-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40082441928767', 'Heat RIB Bea Banded Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/1053_RibBeaBra_Heat_1.jpg?v=1683651533', 48, 0, now(), now(), 'Womenswear & Plus Size', '', 'A longline racerback bra with minimalist straps and a versatile RIB texture perfect for studio to street.

Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Made with a textured version of our signature Compressive fabric
Designed for low to medium-impact activities
Longline silhouette with built-in support band
Racerback', '');
insert into `shesg_product` values (255349023379, 'https://girlfriend.com/products/heat-rib-bea-banded-dress?query=e6c6e0db68b29687693315df0ed61213&objectID=40082444156991', 'Heat RIB Bea Banded Dress', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/files/6099_RibBeaDress_Heat_1.jpg?v=1683651532', 98, 0, now(), now(), 'Womenswear & Plus Size', '', 'A scoop neck workout dress designed with dainty straps, built-in shorts, and our fan-favorite RIB texture. Sporty.


 Made from 83% recycled plastic bottles (RPET) and 17% spandex
Recyclable with ReGirlfriend
Made with a textured version of our signature Compressive fabric
Designed for low to medium-impact activities
Built-in shorts with two side mesh pockets', '');
insert into `shesg_product` values (255349023380, 'https://girlfriend.com/products/meadow-recycled-cotton-cropped-crew?query=e6c6e0db68b29687693315df0ed61213&objectID=40023173726271', 'Meadow Recycled Cotton Cropped Crew', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/3048_GiaCropTee_Meadow_2.jpg?v=1679520546', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'The perfect tee doesn’t exi… Oh, wait. This must-have tee is sustainably made from recycled and organic cotton and has a cropped boxy shape that pairs perfectly with all your high-waisted bottoms.

1 tee = 1 tree. For every recycled cotton tee purchased, we will plant a tree in a US reforestation project with the help of One Tree Planted.
Made from 50% Texloop™ RCOT™ Primo Recycled Cotton and 50% organic cotton
Designed for all medium to high-impact activities and everyday use
Lightweight with a soft but structured handfeel
A classic crew neckline with cropped, boxy silhouette
Elongated short sleeves
Pairs perfectly with high-waisted leggings, joggers and jeans', '');
insert into `shesg_product` values (255349023381, 'https://girlfriend.com/products/meadow-recycled-cotton-scoop-tee?query=e6c6e0db68b29687693315df0ed61213&objectID=40023167270975', 'Meadow Recycled Cotton Scoop Tee', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/3042_ScoopNeckTee_Meadow_1.jpg?v=1679328622', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'The OCA Low Black draws inspiration from retro athletics to bring you a simple, low-key sneaker, perfect for everyday wear.


 1 tee = 1 tree. For every recycled cotton tee purchased, we will plant a tree in a US reforestation project with the help of One Tree Planted.
Made from 50% Texloop™ RCOT™ Primo Recycled Cotton and 50% organic cotton
Designed for all medium to high-impact activities and everyday use
Lightweight with a soft, structured handfeel
Flattering scoop neckline
Relaxed fit for easy wear
A slight flare at the hem so it can sit comfortably over the hip or tuck in to your bottoms', '');
insert into `shesg_product` values (255349023382, 'https://girlfriend.com/products/coast-recycled-cotton-high-neck-tank?query=e6c6e0db68b29687693315df0ed61213&objectID=40023171072063', 'Coast Recycled Cotton High Neck Tank', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/3046_FlorenceTank_Coast_1.jpg?v=1679328622', 36, 0, now(), now(), 'Womenswear & Plus Size', '', 'Life staple. This recycled cotton-organic cotton blend cropped tank has a high neck, boxy cut, and roomy armholes for added ventilation.

 1 tee = 1 tree. For every recycled cotton tee purchased, we will plant a tree in a US reforestation project with the help of One Tree Planted.
Made from 50% Texloop™ RCOT™ Primo Recycled Cotton and 50% organic cotton
Designed for all medium to high-impact activities and everyday use
Lightweight with a soft, structured handfeel
Silhouette designed to layer over your sports bras before, during, and after your workout
Cropped boxy silhouette
Roomy armholes for extra air flow for during and post-workout', '');
insert into `shesg_product` values (255349023383, 'https://girlfriend.com/products/coast-recycled-cotton-long-sleeve-crew?query=e6c6e0db68b29687693315df0ed61213&objectID=40023175561279', 'Coast Recycled Cotton Long Sleeve Crew', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/3050_LeilaLongSleeve_Coast_1.jpg?v=1679328622', 44, 0, now(), now(), 'Womenswear & Plus Size', '', 'A classic long sleeve tee with a sustainable twist. Designed with recycled and organic cotton, made with a soft, lightweight feel that gels with high-impact workouts and weekend wandering alike.

1 tee = 1 tree. For every recycled cotton tee purchased, we will plant a tree in a US reforestation project with the help of One Tree Planted.
Made from 50% Texloop™ RCOT™ Primo Recycled Cotton and 50% organic cotton
Designed for all medium to high-impact activities and everyday use
Lightweight with a soft but structured handfeel
A classically designed long sleeve t-shirt
An easy fit designed to not cling to your body
Designed to fall below the waistband to sit comfortably over the hip or tuck in to your bottoms', '');
insert into `shesg_product` values (255349023384, 'https://girlfriend.com/products/black-stretch-woven-play-short?query=e6c6e0db68b29687693315df0ed61213&objectID=39986432999487', 'Black Play Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6098_MarathonShort_Black_2.jpg?v=1676404658', 58, 0, now(), now(), 'Womenswear & Plus Size', 'Stretch Woven Play Short', 'An all-activity short designed with a compressive waistband, stretch woven outer short, and a built-in brief liner with hidden welt pockets under the front layer of the short.


 Waistband made from 79% recycled plastic bottles (RPET) and 21% spandex
Outer shorts made from 86% RPET and 14% spandex
Compressive waistband is secure and fitted, similar to our leggings
Woven short is relaxed (but not too baggy) with shirring into the waistband
Front body overlaps to back for maximum mobility as you move
Hidden welt pockets under front layer (one on each side)
Small bonded pocket in center back waistband
Built-in brief liner in a lightweight jersey', '');
insert into `shesg_product` values (255349023385, 'https://girlfriend.com/products/ivory-stretch-woven-play-windbreaker?query=e6c6e0db68b29687693315df0ed61213&objectID=39986382045247', 'Ivory Play Windbreaker', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6097_PlayWindbreaker_Ivory_1.jpg?v=1676404662', 102, 0, now(), now(), 'Womenswear & Plus Size', '
Stretch Woven Play Windbreaker', 'A stretch woven half zip windbreaker hoodie that’s water-resistant yet breathable for court sports and beyond.

Made from our Stretch Woven material: 86% recycled plastic bottles (RPET) and 14% spandex
Water-resistant
Adjustable drawstring at hood and bottom hem so you can cinch it up or wear it relaxed at the hip
Zip closure hand pockets
Elastic cuff at sleeve
Seam detailing at collar and yoke down the sleeves
Relaxed fit through body and sleeves
Designed to hit slightly above the hip', '');
insert into `shesg_product` values (255349023386, 'https://girlfriend.com/products/salvas-white-leather-sneaker-women?query=e6c6e0db68b29687693315df0ed61213&objectID=40071098499135', 'SALVAS White Leather Sneaker Women', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/salvas-white-leather-sneaker.side-view_23d049b7-33ed-45ba-911a-2b984d9c0879.png?v=1681688612', 129, 0, now(), now(), 'Womenswear & Plus Size', 'Salvas', 'SALVAS finds footing in playful details like subtle perforation and contrast colors, though comfort remains the common thread. They’re made to last, for any occasion, and everyone. This item is excluded from all promotions.

Upper: Premium leather sourced from LWG-certified Gold Rated tanneries.
Lining: Recycled Mesh lining
Sole: 100% slip-resistant, natural rubber
Insole: Removable, cork + bio-based foam (from mamona oil)
Laces: Made with recycled plastics + organic cotton, with debossed metal aglets
Construction: Handmade vulcanized sneaker; fully stitched outsole', '');
insert into `shesg_product` values (255349023387, 'https://girlfriend.com/products/oca-low-off-white-canvas-sneaker-women?query=e6c6e0db68b29687693315df0ed61213&objectID=40071101743167', 'OCA Low Off-White Canvas Sneaker Women', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/oca-low-off-white-canvas-sneaker.side-view_4a3917f1-2716-4ff2-8d4f-ccb9294e6c6c.png?v=1681688794', 79, 0, now(), now(), 'Womenswear & Plus Size', 'OCA Low', 'The neutral colored shoe for ultimate versatility. The OCA Low Mystic Grey is inspired by the mystifying fog that washes over Rio in the early mornings. This item is excluded from all promotions.

Handcrafted using a robust canvas, the OCA Low Canvas exists at the intersection of functionality and style. With a 100% vegan insoles made from organic mamona oil and cork , it ensures optimal comfort and fit. The OCA Low boast a unique cap toe design and a fully-stitched lightweight outsole for a durable, long-lasting shoe.
Finishing our OCA Low sneakers with debossed metal aglets...it’s all in the details!
Upper: 100% Canvas
Lining: 100% Canvas
Sole: 100% Slip-resistant rubber
Insole: Mamona oil bio based with cork insert with CARIUMA logo
Laces: Made with recycled plastics + organic cotton, with debossed metal aglets
Construction: Handmade vulcanized sneaker; fully stitched outsole', '');
insert into `shesg_product` values (255349023388, 'https://girlfriend.com/products/palm-peak-track-jacket?query=e6c6e0db68b29687693315df0ed61213&objectID=39986654707775', 'Palm Peak Track Jacket', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/2014_PeakTrackJacket_DuffleBag_1.jpg?v=1676404661', 98, 0, now(), now(), 'Womenswear & Plus Size', '', 'A full-zip, boxy Stretch Woven track jacket with adjustable drawstrings and side pockets.

Made from our Stretch Woven material: 86% recycled plastic bottles (RPET) and 14% spandex
Water-resistant
Full zipper with relaxed fit through body
Adjustable drawstring at collar to add some texture and to keep wind out if needed
Two side hand pockets with zipper closures
Paneling details at sleeves and front and back yoke
Hits at high hip with an elastic bottom hem
Elastic cuff at sleeves', '');
insert into `shesg_product` values (255349023389, 'https://girlfriend.com/products/black-peak-track-pant?query=e6c6e0db68b29687693315df0ed61213&objectID=39986753798207', 'Black Peak Track Pant', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6143_PeakTrackPant_Black_2.jpg?v=1674867118', 88, 0, now(), now(), 'Womenswear & Plus Size', '', 'A high-waist, wide leg Stretch Woven track pant with side pockets, a zippered back pocket, and an adjustable waistband.

Made from our Stretch Woven material: 86% recycled plastic bottles (RPET) and 14% spandex
Water-resistant
High-rise
Wide leg; relaxed fit through hips and legs
Elastic waistband with adjustable drawstring
Two on-seam side hand pockets
Zip closure back pocket for easy and secure storage', '');
insert into `shesg_product` values (255349023390, 'https://girlfriend.com/products/black-riley-sweetheart-dress?query=e6c6e0db68b29687693315df0ed61213&objectID=39986369658943', 'Black Riley Sweetheart Dress', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6117_RileySweetheartDress_Black_1.jpg?v=1674767132', 88, 0, now(), now(), 'Womenswear & Plus Size', '', 'An all new exercise dress designed with a full, flouncy FLOAT outer and a Compressive unitard liner for extra smoothing and support.


 Made from 90% recycled plastic bottles (RPET) and 10% spandex
Recyclable with ReGirlfriend
Medium-impact support
Sweetheart neckline
Built-in bra and wide straps with cross-over detail for support
Outer fabric is FLOAT, inside liner is Compressive for support and smoothing
Pockets on each side of the inside shorts', '');
insert into `shesg_product` values (255349023391, 'https://girlfriend.com/products/black-riley-sweetheart-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=39986346524735', 'Black Riley Sweetheart Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1055_RileySweetheartBra_Black_1.jpg?v=1674853343', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'A classic sports bra with a criss-cross back, sweetheart neckline, and medium-impact support to get you even deeper into your favorite flow.

Made from 90% recycled plastic bottles (RPET) and 10% spandex
Recyclable with ReGirlfriend
Medium-impact support
Sweetheart neckline
Supportive wide straps with cross-over strap detail
Double layered
Soft elastic inside at bottom band for support', '');
insert into `shesg_product` values (255349023392, 'https://girlfriend.com/products/atlas-compressive-high-rise-legging?query=e6c6e0db68b29687693315df0ed61213&objectID=40061326491711', 'Atlas Compressive High-Rise Legging', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4007_HRLegging_Atlas_2.jpg?v=1682630182', 78, 0, now(), now(), 'Womenswear & Plus Size', '', 'Ooh, sustainable high-rise leggings in all the best colors. For all your biking, running, climbing, and hot yoga needs.

The legging that started it all. An extra high-rise with four-way stretch and compressive fabric made from recycled water bottles — basically everything you need to get through your favorite high-impact activities, like running, yoga, and binge watching true crime.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed for high-impact workouts
Small hidden back pocket for keys or cards
Sweat-wicking and squat-proof material
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023393, 'https://girlfriend.com/products/atlas-compressive-pocket-legging?query=e6c6e0db68b29687693315df0ed61213&objectID=40061324984383', 'Atlas Compressive Pocket Legging', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4073_HRLegging_Atlas_2.jpg?v=1682628765', 88, 0, now(), now(), 'Womenswear & Plus Size', '', 'By popular demand. A compressive, squat-proof, ultra-high rise compressive legging with double side pockets — cute.

The Compressive Pocket Legging has the same high rise, sturdy construction, and ultra compression as our original legging, but features sleek double side seams and a pocket on each hip for your phone, wallet, keys, vitamins, or whatever else you feel like putting in there. Hey, that\'s your business.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed for high-impact workouts
Two deep side pockets that fit most smartphones
Small hidden back pocket for keys or cards
Sweat-wicking and sheer-proof
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023394, 'https://girlfriend.com/products/atlas-high-rise-bike-short?query=e6c6e0db68b29687693315df0ed61213&objectID=40061325377599', 'Atlas High-Rise Bike Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4011_BikeShort_Atlas_1.jpg?v=1680544315', 48, 0, now(), now(), 'Womenswear & Plus Size', '', 'Compressive, high-rise bike shorts with a 8.5” inseam. Ride up-resistant, down for whatever.

You don’t have to bike to wear bike shorts, but biking cuts down on greenhouse gas emissions, reduces road congestion, and is a pollution-free mode of transport... just saying. Made from recycled water bottles for working out and looking cute.
Made from recycled water bottles, our Compressive fabric contains 79% RPET and 21% spandex, and features a UPF 45+ rating for protection against harmful ultraviolet rays.
To take care of it, machine wash cold with like colors and line dry flat. Learn more. Please note colors may bleed at first, so always wash with like colors in cold water.

 ', '');
insert into `shesg_product` values (255349023395, 'https://girlfriend.com/products/atlas-high-rise-run-short?query=e6c6e0db68b29687693315df0ed61213&objectID=40061325738047', 'Atlas High-Rise Run Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4013_RunShort_Atlas_1.jpg?v=1680544313', 48, 0, now(), now(), 'Womenswear & Plus Size', '', 'Ooh, speedy. Sweat-wicking, compressive high-rise active shorts, that keep you cool while looking cool. How cool.

In it for the long run? So are we. With a 4.75" inseam and compressive fit that stays put, the Run Short was designed with your speed in mind. Plus, since they\'re made from recycled post-consumer water bottles, they help eliminate waste from the environment — so you can focus on other stuff, like improving that mile time.
Made from recycled water bottles, our Compressive fabric contains 79% RPET and 21% spandex.', '');
insert into `shesg_product` values (255349023396, 'https://girlfriend.com/products/atlas-trail-short?query=e6c6e0db68b29687693315df0ed61213&objectID=40061323083839', 'Atlas Trail Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6009_TrailShort_Atlas_1.jpg?v=1680544314', 55, 0, now(), now(), 'Womenswear & Plus Size', '', 'Bend, stretch, flex. These high rise, water-wicking Ripstop Woven shorts are lined with micro running shorts and have a zip back pocket for storage.

The Trail Short is our high waisted, marathon-inspired short designed with built-in Compressive shorts perfect for bending, stretching, high-kicking, etc. Plus, they\'re fully recyclable after you\'re done with them. Cute, sporty and nice to the planet? Talk about the total package. Outer short made from 100% recycled single-use bottles (RPET)
Outer short made from our Ripstop Woven material: 100% recycled single-use bottles (RPET)
Water-resistant outer short
Built-in Compressive shorts made from 79% recycled plastic bottles and 21% spandex
High waisted
Wrap effect
Elastic waistband
Zippered back pocket', '');
insert into `shesg_product` values (255349023397, 'https://girlfriend.com/products/atlas-dylan-tank-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40061329408063', 'Atlas Dylan Tank Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1017_DylanBra_Atlas_1.jpg?v=1680544313', 46, 0, now(), now(), 'Womenswear & Plus Size', '', 'A cropped tank, sports bra hybrid with a high neckline, racerback and soft, four-way stretch fabric.

The Dylan Tank Bra is an extra versatile longline sports bra slash crop top (it hits around the same point as the Paloma) that’s designed with a contoured racerback so you can move around without feeling too constricted because nobody likes that. It also has a high neck that keeps you covered and looks really good layered under or over lower-cut things. Because who doesn’t love a good layer?
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed for medium-impact workouts
High crew neckline
14 3/4" length from high point on shoulder on size S (for each size up/down, add/subtract 1/2")
Built-in support band
Full coverage
Double-lined
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023398, 'https://girlfriend.com/products/atlas-tommy-cropped-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40061328687167', 'Atlas Tommy Cropped Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1016_TommyBra_Atlas_1.jpg?v=1680544315', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'A supportive square neck sports bra made from 10 recycled plastic bottles. Complete with a nice low back and a smooth, double-lined finish.

We thought your racerbacks could use a break. The Tommy Cropped Bra has an open square neckline, a low square back and a built-in support band that sits under your bust (kind of like on the Topanga, Lola or Juliet) and is perfect for getting you through those medium-impact workouts like boxing, biking or speed-walking home because you forgot your reusable coffee cup.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed for medium-impact workouts
Square neck and back
12 1/4" length from high point on shoulder on size S (for each size up/down, add/subtract 1/2")
1" strap width
Built-in support band hits under bust
Full coverage
Double-lined
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023399, 'https://girlfriend.com/products/atlas-gazelle-short?query=e6c6e0db68b29687693315df0ed61213&objectID=40061323444287', 'Atlas Gazelle Short', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6005_GaxelleShort_Atlas_1.jpg?v=1680544314', 55, 0, now(), now(), 'Womenswear & Plus Size', '', 'A speedy sweat-wicking Ripstop Woven run short with a built-in underwear liner. Your old mile time won’t know what hit it.

Think fast. A lightweight, water resistant short inspired by the world\'s fastest land animal. Features a built-in underwear lining, zippable pockets, drawstring waist, and slightly loose fit. Cute.
Made from our Ripstop Woven material: 100% recycled single-use bottles (RPET)
Built-in underwear lining
Zippable pockets
Drawstring waist
Designed with a slightly loose fit', '');
insert into `shesg_product` values (255349023400, 'https://girlfriend.com/products/atlas-weekend-wrap-skort?query=e6c6e0db68b29687693315df0ed61213&objectID=40061323837503', 'Atlas Weekend Wrap Skort', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4046_TieWrapSkort_Atlas_1.jpg?v=1680544315', 62, 0, now(), now(), 'Womenswear & Plus Size', '', 'Your weekend, wrapped. You spent all 48 hours of the weekend in this adjustable wrap skort designed with our signature Compressive fabric, built-in shorts, and two side pockets.

A perfect sporty workout skort designed with a wrap around layer, side tie for easy adjustability, and built-in shorts. Wear it tighter some days, looser on the others, and, you know, sneak in a twirl or two.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Sweat-wicking and quick-dry
UPF 50+
High rise faux wrap skirt with functional tie on top layer for easy adjustability for every body shape
Built-in shorts liner with pockets on each side
Added bonded pocket at back waistband ', '');
insert into `shesg_product` values (255349023401, 'https://girlfriend.com/products/atlas-mia-high-neck-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40061329047615', 'Atlas Mia High Neck Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1025_Miabra_Atlas_1.jpg?v=1680544314', 46, 0, now(), now(), 'Womenswear & Plus Size', '', 'A Compressive longline bra with a high neck, low back, and an added layer of power mesh that provides medium-impact support for your tennis, spinning, and looking cute needs.

Ooh, you need this. The Mia High Neck Bra, designed with our signature Compressive fabric, keeps you supported in the front while letting your back breathe. Why yes, it is perfect for things like yoga, barre, and your other bendy activities.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Medium-impact support
Layer of power mesh in front, plus elastic inside straps for added support
High neck with lower back
Fixed straps
Longline silhouette designed to be fitted to the body', '');
insert into `shesg_product` values (255349023402, 'https://girlfriend.com/products/atlas-matisse-twist-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40061327966271', 'Atlas Matisse Twist Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1066_MatisseTwistBra_Atlas_1.jpg?v=1680544314', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'Do the twist. This is a longline strappy sports bra with a v-neck, twist front, and criss cross back.

Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Low-impact support
Soft v-neck with delicate cross-back straps
Twist front detail
Under layer has soft elastic for bust support
Double layered fabric', '');
insert into `shesg_product` values (255349023403, 'https://girlfriend.com/products/atlas-paloma-racerback-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40061329834047', 'Atlas Paloma Racerback Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1002_PalomaBra_Atlas_1.jpg?v=1680544315', 46, 0, now(), now(), 'Womenswear & Plus Size', '', 'Our #1 best-selling bra complete with a racerback, long-line silhouette, and support band that’ll never let you down.

You need this. Our best-selling longline bra that\'s both full-coverage and flattering, Paloma was made for low to medium-impact workouts and doubles as your new favorite top.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed for medium-impact workouts
Racerback
Scoop neck
Built-in support band
Full coverage
Soft yet sturdy construction with four-way stretch
UPF 45+ rating for protection against harmful ultraviolet rays', '');
insert into `shesg_product` values (255349023404, 'https://girlfriend.com/products/atlas-bianca-one-shoulder-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=40061328326719', 'Atlas Bianca One Shoulder Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1014_Biancabra_Atlas_1.jpg?v=1680544313', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'A supportive one shoulder bra made with our signature sweat-wicking Compressive fabric. Wear it as a bra, wear it as a crop top, that’s up to you.

Just a super versatile one shoulder bra that goes great with any bottoms that are calling out to you —  leggings, sweats, bike shorts, jeans, you name it.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed for low-impact workouts
Double lined, sweat-wicking material
Elasticated support band designed to hit under bust
Soft, yet sturdy construction with four-way stretch
Shoulder strap designed to be worn on the right shoulder', '');
insert into `shesg_product` values (255349023405, 'https://girlfriend.com/products/atlas-gemma-scoop-tank?query=e6c6e0db68b29687693315df0ed61213&objectID=40061327638591', 'Atlas Gemma Scoop Tank', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1038_GemmaThank_Atlas_1.jpg?v=1680544313', 48, 0, now(), now(), 'Womenswear & Plus Size', '', 'A universally cute Compressive tank designed with an open scoop neckline and a built-in bra to keep you nice and supported.

If you can’t be bothered to pick both a sports bra and a top, we’ve got just the thing. The Gemma Scoop Tank has a built-in bra and double-binded straps to keep you supported, plus a silhouette that fits like your favorite tank (a.k.a. it has an open neckline and won’t be too tight through your mid-section.) Move over, other workout tops. Gemma has arrived.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Built-in bra for low to medium-impact support
Scoop neck and scoop back
Straps with double binding construction give a secure fit while keeping the neckline open
Designed to cover the top of high-rise bottoms and be fitted around the bust and armhole, but not super tight through the body
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023406, 'https://girlfriend.com/products/atlas-tommy-dress?query=e6c6e0db68b29687693315df0ed61213&objectID=40061321969727', 'Atlas Tommy Dress', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6063_TommyDress_Atlas_1.jpg?v=1680544313', 88, 0, now(), now(), 'Womenswear & Plus Size', '', 'The beloved Tommy Cropped Bra is now a recycled and recyclable workout dress with a built-in unitard, support band, and — of course — pockets. Does it get any cuter?

Your average workout dress this is not. With a square neckline, low square back, and a built-in unitard liner with pockets, this sweat-wicking Compressive dress might just make its way to your going-out wardrobe, too.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Side seam paneling detail adds shape to the body
Fully built-in unitard liner
Built-in bra for added support
Dress should be fitted in the chest and armhole, and skim the body through the waist and hips (i.e. it shouldn’t be skin-tight)
Two small side pockets on each side of the underneath short
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023407, 'https://girlfriend.com/products/atlas-compressive-flare-legging?query=e6c6e0db68b29687693315df0ed61213&objectID=40061326098495', 'Atlas Compressive Flare Legging', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4038_Flare_Atlas_2.jpg?v=1682630032', 78, 0, now(), now(), 'Womenswear & Plus Size', '', 'By very popular demand. A high-rise compressive flare legging made from recycled materials and recyclable when you’re through.

The long-awaited flare legging is (finally) here. It has all the sweat-wicking, squat-proof qualities you love, only now in a cute flare style.
Made from 79% recycled plastic bottles (RPET) and 21% spandex
Recyclable with ReGirlfriend
Designed to be fitted through the waist, hips, and thigh, and start to give way just above the knee and be relaxed from the knee down
Perfect flare shape specially designed so it’s not too loose or flowy during workouts
Small hidden pocket at back waistband perfect for small keys, cards, or cash
Squat-proof and sweat-wicking
Soft yet sturdy construction with four-way stretch', '');
insert into `shesg_product` values (255349023408, 'https://girlfriend.com/products/atlas-huddle-half-zip-windbreaker?query=e6c6e0db68b29687693315df0ed61213&objectID=40061327278143', 'Atlas Huddle Half-Zip Windbreaker', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6006_HummingbirdJacket_Atlas_1.jpg?v=1680544314', 98, 0, now(), now(), 'Womenswear & Plus Size', '', 'A water-resistant Ripstop Woven pullover with a hideable hood, cinchable waist, and a kangaroo pocket.

For being cute and busy. A water resistant windbreaker with a boxy, cropped fit, hideable hood, and roomy waist-level pockets. Designed for running marathons, running errands, and running late. Oops. To take care of it, machine wash cold with like colors and line dry flat. Learn more.
Made from our Ripstop Woven material: 100% recycled single-use bottles (RPET)
Water-resistant
Boxy, cropped fit
Hideable hood
Cinchable waist
Kangaroo pocket with zippered closure', '');
insert into `shesg_product` values (255349023409, 'https://girlfriend.com/products/atlas-summit-track-pant?query=e6c6e0db68b29687693315df0ed61213&objectID=40061322330175', 'Atlas Summit Track Pant', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6011_SummitTrackPants_Atlas_1.jpg?v=1680544313', 82, 0, now(), now(), 'Womenswear & Plus Size', '', 'A high-waisted, relaxed fit Ripstop Woven track pant made with 100% recycled plastic bottles.

Don\'t forget to stretch. The Summit Track Pant is a high waisted pant you can easily layer over your leggings or shorts for some added warmth. They also have nifty ankle zippers so you don\'t have to take your shoes off when taking them off (a big plus for when your hike starts in the cold morning and goes into the hot afternoon). To take care of it, machine wash cold with like colors and line dry flat. Learn more.
Made from our Ripstop Woven material: 100% recycled single-use bottles (RPET)
Water-resistant
Ultra-lightweight construction
Two zippered side pockets
Smocked elastic waist and ankle cuffs
Ankle zippers for easy on-and-off', '');
insert into `shesg_product` values (255349023410, 'https://girlfriend.com/products/atlas-sport-skort?query=e6c6e0db68b29687693315df0ed61213&objectID=40061324296255', 'Atlas Sport Skort', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4018_SportSkort_Atlas_1.jpg?v=1680544314', 62, 0, now(), now(), 'Womenswear & Plus Size', '', 'A sporty, high rise exercise skirt with built-in compressive shorts, hidden mesh pockets and side slits.

Meet The Sport Skort, a high-rise active skirt that\'s simple and streamlined but also super functional. It\'s designed with our compressive fabric that\'s soft, sweat-wicking, and made from recycled bottles and it has a built-in shorts with mesh pockets for your phone, keys or whatever stuff you want to keep with you. It\'s just the right amount of form-fitting, plus it has some side slits so you can get a little sporty if that\'s what you\'re in to. So go ahead and play tennis, rollerblade on the boardwalk or bust out a cartwheel. All activities welcome.
Made from recycled water bottles, our Compressive fabric contains 79% RPET and 21% spandex.', '');
insert into `shesg_product` values (255349023411, 'https://girlfriend.com/products/black-float-ultralight-split-skort?query=e6c6e0db68b29687693315df0ed61213&objectID=39986362777663', 'Black FLOAT Ultralight Split Skort', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/4055_FloatSplitSkirt_Black_1.jpg?v=1674767200', 62, 0, now(), now(), 'Womenswear & Plus Size', '', 'Our most move-able skort yet. Ultra-lightweight, breathable, and designed with Compressive inner shorts and a high slit for extra range of motion.

 Outer skirt made from 90% recycled plastic bottles (RPET) and 10% spandex
Inner short made from 79% RPET and 21% spandex
Recyclable with ReGirlfriend
Overlapping “split” skirt to provide a range of motion and a more flexible fit
Outer skirt is FLOAT and inside short liner is Compressive for more support and smoothing
Pockets on each side of the shorts liner', '');
insert into `shesg_product` values (255349023412, 'https://girlfriend.com/products/wild-iris-birdie-woven-skort?query=e6c6e0db68b29687693315df0ed61213&objectID=40011705811007', 'Wild Iris Birdie Woven Skort', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6036_BirdieSkirt_WildIris_2.jpg?v=1682707558', 58, 0, now(), now(), 'Womenswear & Plus Size', '', 'A breezy, water-wicking Ripstop Woven skirt designed with built-in shorts and mesh pockets on said shorts. Great for tennis, putting practice, and an occasional “fore!”

Sporty, skorty, and thriving. The Birdie Woven Skort has an easy, relaxed fit you’ll love, plus a comfy inner run short designed with our super soft FLOAT fabric.
Ripstop made from Ripstop Woven material: 100% recycled plastic bottles (RPET)
Inner shorts made from 90% recycled plastic bottles (RPET) and 10% spandex
Recyclable with ReGirlfriend
Wide elastic waistband with soft brushed back
FLOAT inner shorts with mesh pockets on both sides
Designed with a relaxed fit
UPF 50+', '');
insert into `shesg_product` values (255349023413, 'https://girlfriend.com/products/wild-iris-bike-unitard?query=e6c6e0db68b29687693315df0ed61213&objectID=40011704598591', 'Wild Iris Bike Unitard', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/6012_BikeUnitard_WildIris_1.jpg?v=1677694599', 78, 0, now(), now(), 'Womenswear & Plus Size', '', 'A bike short-length compressive unitard with a scoop neck, low back and built-in bra.

One and done. The Bike Unitard is a super easy one piece designed with our soft-yet-sturdy signature compressive fabric that\'s made from recycled plastic water bottles. We made it with a deep scoop back and nixed the waist and center front seams so it molds to your every move. Oh, and it has a built-in bra. What can we say, we\'re here to support.
Made from 79% recycled plastic bottles (RPET) and 21% spandex', '');
insert into `shesg_product` values (255349023414, 'https://girlfriend.com/products/black-gigi-crossover-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=39986317230143', 'Black Gigi Crossover Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1050_GigiCrossoverBra_Black_1.jpg?v=1674767000', 46, 0, now(), now(), 'Womenswear & Plus Size', '', 'A deep-v longline sports bra designed for balanced, comfortable support for your freest flow yet.

Made from 90% recycled plastic bottles (RPET) and 10% spandex
Recyclable with ReGirlfriend
Low to medium-impact support
Deep V-neck
Double strap with cross-over detail and back cross-pull for comfortable, evenly-distributed support
Elastic band at underbust for a longline length with added support under bust
Double layered', '');
insert into `shesg_product` values (255349023415, 'https://girlfriend.com/products/black-noah-strappy-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=39986328535103', 'Black Noah Strappy Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1054_NoahStrappyBra_Black_1.jpg?v=1674767102', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'Ooh, strappy. The Noah is a classic v-neck sports bra with double straps, a comfy support band, and a nice lightweight feel.

Made from 90% recycled plastic bottles (RPET) and 10% spandex
Recyclable with ReGirlfriend
Low to medium-impact support
Soft v-neck
Double straps to distribute support across shoulders while keeping the strappy look
Double layered
Soft elastic inside at bottom band for support
Stand bra length (hits under bust)', '');
insert into `shesg_product` values (255349023416, 'https://girlfriend.com/products/ivory-ella-scoop-neck-bra?query=e6c6e0db68b29687693315df0ed61213&objectID=39719542423615', 'Ivory Ella Scoop Neck Bra', 'https://cdn.shopify.com/s/files/1/0019/2217/0943/products/1049_EllaScoopNeckBra_White_1.jpg?v=1674766943', 42, 0, now(), now(), 'Womenswear & Plus Size', '', 'A FLOAT Ultralight scoop neck, v-back sports bra designed to wick away moisture (a.k.a. sweat) and keep things nice and breezy during all your tough workouts.


 The hotter the workout, the lighter the bra. We made the Ella Scoop Neck Bra to be our breeziest bra yet — it’s designed with our FLOAT Ultralight fabric, an open scoop neckline, minimal back straps, and a back vent for that extra degree of breathability.
Made from 90% recycled plastic bottles (RPET) and 10% spandex
Recyclable with ReGirlfriend
Low to medium-impact support
Sweat-wicking and quick-dry
Ultra-lightweight and breathable
Open scoop with with cutaway vent detail in the back
Buttery soft hand feel with a brushed matte finish
Double-lined
UPF 50+', '');
insert into `shesg_product` values (255349023417, 'https://www.organiquestudio.com/products/hoodie-jacket', 'Hoodie Jacket in Fleece Organic Cotton', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3947.jpg?v=1674586574', 137.31, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing the perfect addition to your athleisure wear wardrobe this winter - our hoodie jacket is made with the highest quality fleece organic cotton. The warm and sustainable fabric is vegan, making it the ideal choice for ethical and conscious consumers. The super stylish jacket features two pockets on each side, keeping all your belongings safe and secure while on the go. Whether out for a jog in the chilly weather or simply relaxing at home, this hoodie jacket will keep you warm and comfortable all day. With its versatile and trendy design, you can easily pair it with leggings, jeans, or other athleisure essentials for a chic and comfortable look.

Made with GOTS certified 100% Fleece Organic Cotton.
- Warm and breathable
- Smooth and soft hand feel', '');
insert into `shesg_product` values (255349023418, 'https://www.organiquestudio.com/products/longsleeve-bodysuit-in-black', 'Longsleeve Bodysuit', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_4146.jpg?v=1674232363', 93.37, 0, now(), now(), 'Bottoms', 'Bottoms', 'Looking for a versatile and stylish addition to your athleisure wear collection? Look no further than our black TENCEL™ Lyocell turtleneck longsleeve bodysuit. Made from a soft and durable fabric, this bodysuit offers both comfort and flexibility, perfect for any occasion. The classic turtleneck design adds a touch of sophistication and is perfect for layering with your favorite athleisure wear essentials. Whether you\'re heading out for a night on the town or just running errands, this bodysuit will have you feeling confident and looking your best. Don\'t miss out on this timeless piece that will quickly become a staple in your wardrobe!

Made with certified 62% TENCEL Lyocell, 30% Organic Cotton, 9% Elastane
- Smooth and comfortable
- Classic Casual appearance
- Flexible', '');
insert into `shesg_product` values (255349023419, 'https://www.organiquestudio.com/products/high-waist-jogging-pants', 'High Waist Jogger Pants in Fleece Organic Cotton', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3718.jpg?v=1674586271', 104.36, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our eco-friendly and stylish High-Waisted Jogger Pants, perfect for those who love athleisure wear. Made with a premium blend of Fleece Organic Cotton fabric, these pants are warm, sustainable, and gentle on sensitive skin. The relaxed fit and tapered ankle create a flattering silhouette that can be dressed up or down, making them perfect for any occasion. Whether lounging or on the go, they keep you looking and feeling great. Pair them with a crop top or hoodie for a chic and comfortable look.

Made with GOTS certified 100% Fleece Organic Cotton
- Warm and breathable
- Smooth and soft hand feel', '');
insert into `shesg_product` values (255349023420, 'https://www.organiquestudio.com/products/high-waist-leggings', 'High Waist Leggings', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3594_f876f0b9-ac8a-49b7-b689-47bcbdc908b5.jpg?v=1674583976', 93.37, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our sustainably-made, athleisure wear-inspired leggings made of a premium blend of TENCEL™ Lyocell, cotton, and elastane. These leggings are the perfect addition to your workout wardrobe and are driven by our commitment to sustainability and ethical manufacturing practices in Portugal. With a secure fit that provides total comfort and coverage during runs and workouts, these super comfy leggings are ideal for both the gym and the streets. So why not step up your athleisure game with these sustainable and stylish leggings today?

Made with Interlock 63% TENCEL™ Lyocell, 31% Organic Cotton, 6% Elastane', '');
insert into `shesg_product` values (255349023421, 'https://www.organiquestudio.com/products/v-neck-longsleeve-blouse', 'V Neck Long-sleeve Shirt', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3550.jpg?v=1674588467', 73.60, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our eco-friendly V-Neck Long-Sleeve Shirt, perfect for those who love athleisure wear and sustainable fashion. Made with TENCEL™ Lyocell, a vegan and environmentally friendly fabric, this lightweight and soft shirt is designed to keep you comfortable all day long. The breathable and gentle fabric makes it perfect for those with sensitive skin. The classic and simple design of this shirt makes it versatile for any occasion, from the office to a casual day out. Make a sustainable fashion statement with this stylish V-Neck Long-Sleeve Shirt and add it to your athleisure wear collection today!

Made with Certified 100% TENCEL Lyocell
- Fluid drape
- Smooth and soft hand feel', '');
insert into `shesg_product` values (255349023422, 'https://www.organiquestudio.com/products/round-neck-shirt', 'Round Neck Shirt in White', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3744.jpg?v=1674586368', 60.42, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our eco-friendly and comfortable Round Neck T-Shirt, perfect for those who love athleisure wear and care about the environment. Our T-Shirt is made with the innovative TENCEL™ Lyocell fabric, which is both sustainable and vegan, making it a great choice for those with sensitive skin. The lightweight and breathable fabric allows for easy movement and comfort, making it perfect for everyday wear. It is also durable and long-lasting, ensuring you get to wear it for years to come. With its classic round neck cut, this T-Shirt can be easily dressed up or down, making it a versatile addition to any wardrobe. Enjoy the comfort and sustainability of our TENCEL™ Lyocell T-Shirts, knowing you\'re making a positive impact on the planet.

Made with certified 63% TENCEL Lyocell, 31% Organic Cotton, 6% Elastane
- Smooth and comfortable
- Classic Casual appearance
- Flexible', '');
insert into `shesg_product` values (255349023423, 'https://www.organiquestudio.com/products/jumpsuit-in-black-with-hood', 'Hoodie Jumpsuit', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3432.jpg?v=1674235261', 181.25, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our versatile and trendy hoodie jumpsuit, the perfect addition to your athleisure wear collection! This jumpsuit is crafted from a soft and flexible TENCEL™ Lyocell fabric, providing both comfort and sustainability. Featuring a convenient half zip at the front and lightweight material, this jumpsuit allows for easy movement and breathability, making it ideal for any season or activity. The versatile design is perfect for layering, enabling you to adjust the style to suit any occasion. With its timeless silhouette and comfortable fit, this hoodie jumpsuit is sure to become a go-to staple in your athleisure wear wardrobe.

Made with certified 62% TENCEL Lyocell, 30% Organic Cotton, 9% Elastane
- Smooth and comfortable
- Classic Casual appearance
- Flexible', '');
insert into `shesg_product` values (255349023424, 'https://www.organiquestudio.com/products/v-neck-shirt', 'V Neck Shirt in White', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3789.jpg?v=1674586504', 60.42, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our sustainable white V-Neck T-Shirt, perfect for any athleisure wear look. Made with TENCEL™ Lyocell fabric, this soft and flexible fabric offers both comfort and durability. The flattering v-neckline is a classic and versatile design that pairs perfectly with any outfit. Its lightweight and breathable fabric makes it ideal for active lifestyles and warm weather. The eco-friendly fabric ensures that you can feel good about your impact on the environment while still looking great. This t-shirt is also wrinkle-resistant and easy to care for, making it a hassle-free addition to your wardrobe.

Made with certified 63% TENCEL Lyocell, 31% Organic Cotton, 6% Elastane
- Smooth and comfortable
- Classic Casual appearance
- Flexible', '');
insert into `shesg_product` values (255349023425, 'https://www.organiquestudio.com/products/crop-top-in-rosemary-green', 'Crop Top', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3661.jpg?v=1679580148', 53.83, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our stylish and eco-friendly crop top made with TENCEL™ Lyocell in a beautiful Rosemary Green color, perfect for those who love athleisure wear. TENCEL™ Lyocell is a sustainable and renewable material made from wood cellulose, making it an excellent choice for conscious consumers. The fabric is not only soft and breathable but also comfortable to wear all day long. The crop length and trendy green hue add a touch of fashion to your wardrobe, making it an ideal choice for summer days. To complete the athleisure look, pair it with high-waisted leggings and a pair of vegan sneakers for the perfect ensemble.

Made with Interlock 63% TENCEL™ Lyocell, 31% Organic Cotton, 6% Elastane', '');
insert into `shesg_product` values (255349023426, 'https://www.organiquestudio.com/products/large-jogger-pants', 'Large Jogger Pants', 'https://cdn.shopifycdn.net/s/files/1/0398/9579/3828/products/DSC_3884.jpg?v=1674583036', 107.65, 0, now(), now(), 'Bottoms', 'Bottoms', 'Introducing our stylish and comfortable Large Jogger Pants, the perfect addition to your athleisure wear wardrobe. Made of soft and durable TENCEL™ Lyocell fabric, these pants provide comfort and versatility for any active lifestyle. The lightweight and breathable fabric makes them ideal for outdoor activities, while the drawstring waistband ensures a secure and comfortable fit. With a back pocket for your small essentials, these joggers are perfect for running errands or just relaxing around the house. Whether you\'re hitting the gym or running outdoors, these jogger pants offer both style and function, making them a must-have in your athleisure wear collection.

Made with Certified 100% TENCEL Lyocell
- Fluid drape
- Smooth and soft hand feel', '');
insert into `shesg_product` values (255349023427, 'https://www.flarestreet.com/collections/new-arrivals/products/lillie-flares-flare-street-x-george-haite-collection', 'Lillie Flares - Flare Street x George Haité collection', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-Natalia322.jpg?v=1675129018', 112.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by George Haité (1800\'s).
Designed for every gender', '');
insert into `shesg_product` values (255349023428, 'https://www.flarestreet.com/collections/new-arrivals/products/arabelle-flares-flare-street-x-george-haite-collection', 'Arabelle Flares - Flare Street x George Haité collection', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-Natalia201.jpg?v=1675128750', 112.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by George Haité (1800\'s).
Designed for every gender', '');
insert into `shesg_product` values (255349023429, 'https://www.flarestreet.com/collections/new-arrivals/products/isolde-flares-flare-street-x-george-haite-collection-pre-order-only', 'Isolde Flares - Flare Street x George Haité collection', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-MiffsBand0008.jpg?v=1657633332', 112.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by George Haité (1800\'s).
Designed for every gender', '');
insert into `shesg_product` values (255349023430, 'https://www.flarestreet.com/collections/new-arrivals/products/theodora-flares-flare-street-x-george-haite-collection-pre-order-only', 'Theodora Flares - Flare Street x George Haité collection', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-MiffsBand0004_1024x1024.jpg?v=1664423908', 112.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by George Haité (1800\'s).
Designed for every gender', '');
insert into `shesg_product` values (255349023431, 'https://www.flarestreet.com/collections/new-arrivals/products/sorcha-flares-flare-street-x-george-haite-collection-pre-order-only', 'Sorcha Flares - Flare Street x George Haité collection', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-MiffsBand0007.jpg?v=1657632242', 112.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by George Haité (1800\'s).
Designed for every gender', '');
insert into `shesg_product` values (255349023432, 'https://www.flarestreet.com/collections/new-arrivals/products/adelia-flares-flare-street-x-george-haite-collection', 'Adelia Flares - Flare Street x George Haité collection', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-MiffsBand_2.jpg?v=1664423882', 112.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by George Haité (1800\'s).
Designed for every gender', '');
insert into `shesg_product` values (255349023433, 'https://www.flarestreet.com/collections/new-arrivals/products/luna-flares-purple-velvet', 'Luna Flares - Purple Velvet', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreetFlaresBellBottoms_Luna32.jpg?v=1639626671', 67.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'These flares blend a range of Purple, Lilac, Cream, Moss Green & Plum in a unique, exclusive design by Golden Daze.
To be dressed up or lounged around in, you can wear these flares everywhere!
Made from the softest, highest quality, sustainably printed stretch velvet.
Treat them with love and care, pass them down to your loved ones and cherish them forever. They are limited edition, made to last and a truly unique Flare Street design!

Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by Golden Daze.
Designed for every gender', '');
insert into `shesg_product` values (255349023434, 'https://www.flarestreet.com/collections/new-arrivals/products/luna-flares-fuschia-marigold-velvet', 'Luna Flares - Fuschia & Marigold Velvet', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreetFlaresBellBottoms_7990021.jpg?v=1639626190', 67.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'These flares blend a range of Fuschia, Magenta Pink, Coral Pink, Purple, Marigold Yellow, Orange & Cream in a unique, exclusive design by Golden Daze.
To be dressed up or lounged around in, you can wear these flares everywhere!
Made from the softest, highest quality, sustainably printed stretch velvet.
Treat them with love and care, pass them down to your loved ones and cherish them forever. They are limited edition, made to last and a truly unique Flare Street design!

Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by Golden Daze.
Designed for every gender', '');
insert into `shesg_product` values (255349023435, 'https://www.flarestreet.com/collections/new-arrivals/products/donyale-flares-golden-brown-velvet', 'Donyale Flares - Golden Brown Velvet', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-320.jpg?v=1636349744', 101.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'These flares blend a range of Golden Brown, Tan, Mustard on a Dark Chocolate Brown base. To be dressed up or lounged around in, you can wear these flares everywhere!
Made from the softest, highest quality, sustainably printed stretch velvet.
Treat them with love and care, pass them down to your loved ones and cherish them forever. They are limited edition, made to last and a truly unique Flare Street design!

Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by Golden Daze.
Designed for every gender', '');
insert into `shesg_product` values (255349023436, 'https://www.flarestreet.com/collections/new-arrivals/products/donyale-flares-purple-velvet', 'Donyale Flares - Purple Velvet', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/FlareStreet-42.jpg?v=1636348232', 101.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'These flares blend a range of Purple, Lilac, Cream, Moss Green & Plum in a unique, exclusive design by Golden Daze.
To be dressed up or lounged around in, you can wear these flares everywhere!
Made from the softest, highest quality, sustainably printed stretch velvet.
Treat them with love and care, pass them down to your loved ones and cherish them forever. They are limited edition, made to last and a truly unique Flare Street design!

Flare Street is Slow Fashion. There’s so much to share, but here\'s a quick list of how we\'re making every aspect of Flare Street as sustainable as possible:
Made in Melbourne, Australia
Flare Street was accredited with Ethical Clothing Australia in 2021
We use Recycled Thread
Our fabrics are 100% sourced from local Australian fabric houses
Local, sustainably printed fabric, no water waste or harsh chemicals
100% zero waste production. All off cut fabrics are recycled in Melbourne and turned into new fibres, couches and socks by our recycling partners.
Plastic free packaging with compostable satchels, compostable address labels and tape. All paper is FSC Certified and use soy-based inks & non-toxic chemicals.
Carbon neutral including all shipping. We have partnered with Carbon Positive Australia who focus on education & planting trees for the planet to offset all emissions.
Exclusive & limited edition textile designs. Our designs are hand drawn by talented, independent artists around the world - this one is by Golden Daze.
Designed for every gender', '');
insert into `shesg_product` values (255349023437, 'https://www.flarestreet.com/collections/tops/products/top-dhana-dreams-high-neck-velvet-cotton-candy', 'Top - Dhana Dreams High Neck Velvet', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/Runway34.jpeg?v=1594356705', 50.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Model is wearing size Small/Medium in Pink colourway.
33" Bust
Hand Wash / Hang Dry
Made In Melbourne, Australia.

This collection was heavily influenced by pop art icon Peter Max, and ‘The Cosmic 60s’ artwork he produced, particularly references to the Universe in his psychedelic artwork. Using cosmic and lunar motifs to create a celestial narrative, two distinctive colour palettes express contrasting ideas; a story of the light, playful cosmic heavens, and the rich, brooding midnight. Australian artists Harley and J and Shell Shimmin contributed specially commissioned pieces for this collection exploring the contrasting moods and magical possibilities of the universe.
All of the flares from our ‘Cosmic Velvet’ collection were debuted at New York Fashion Week in September 2017. This range encompasses exclusively designed pieces of artwork for Flare Street in collaboration with Byron Bay artist, Harley & J. All of these designs were drawn in Byron Bay, the flares are made in Melbourne, created from quality Velvet that is sustainably printed in Australia*.
Flare Street’s designs are for those who aren’t just fiercely fashionable but also have a sense of life and individuality. We want people to feel empowered and as though they are expressing themselves in their truest way. The designs are a throwback to that era, reworked and blended with modern colours & structures so that our customers can add it into their everyday wardrobe. We’re huge velvet lovers too - blending psychedelic art, cosmic references, retro prints and velvet is what we love to do!
They are a perfect addition to any occasion! Treat them with love and care, pass them down to your daughters or loved ones and cherish them forever. They are limited edition, made to last and a truly unique Flare Street design!
About the velvet & environmental impact during print:
- Printed using water based inks
- No harsh chemicals used
- Inks disposed of accordingly & not poured down drains
- Recycled paper and plastic used throughout printing and shipping
*It has taken us a long time to find a fabric printer that aligns with our printing ethics and we are so proud to have found a small-business, in Australia, to work with. *', '');
insert into `shesg_product` values (255349023438, 'https://www.flarestreet.com/collections/tops/products/top-green-plain-velvet-high-neck', 'Velvet High Neck Top - Plain PICK YOUR COLOUR', 'https://cdn.shopifycdn.net/s/files/1/1263/3879/products/Runway18.jpeg?v=1560948664', 44.00, 0, now(), now(), 'Bottoms', 'Bottoms', 'Plain Velvet high neck tops are here to match your flares or add to your music festivals outfit, picnic get up or casual wear.
We have high neck tops in all of our basic velvet colour range. Have a look at our flares, pick the colour you love and find it in the drop down menu. If there\'s a fabric you have your eye on and it\'s not here, send us a note via the contact us page.

Model is wearing Small/Medium.
33" Bust
Hand Wash / Hang Dry
Made In Melbourne, Australia.', '');
insert into `shesg_product` values (255349023439, 'https://www.freitag.ch/en/f306-hazzard', 'F306 HAZZARD', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/b646de26e5a4fa7b2b2b0be7f65e1221496aa09b.jpg', 390.00, 0, now(), now(), 'Bags', 'BACKPACK', 'This unique article is made of approx. 76%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
distance fabric (polyester)
-
piping (polyester)
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
zipper (polyester/zinc)
-
laminated foam
-
tension buckle (polyamide)
-
woven label (polyester)
', '');
insert into `shesg_product` values (255349023440, 'https://www.freitag.ch/en/f155-clapton', 'F155 CLAPTON', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/2900661baa7beded3fc56073c20ef95ba04f6e12.jpg', 350.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 77%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
distance fabric (polyester)
-
piping (polyester)
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
reflective piping (polyester)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
magnet (nickel-plated)
-
sewing thread (polyamide)
-
O-ring (nitrile rubber)
-
zipper (polyester/zinc)
-
tension buckle (aluminum)
-
reinforcement (polypropylene)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023441, 'https://www.freitag.ch/en/f201-x-pete', 'F201-X PETE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/40ab6af265f8c4618d0bbab7bbac51cedee9d221.jpg', 240.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 75%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023442, 'https://www.freitag.ch/en/f201-pete', 'F201 PETE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/d201018fbba5fd63e2b8c247702cc0f23826cb40.jpg', 240.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 82%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023443, 'https://www.freitag.ch/en/f49-fringe', 'F49 FRINGE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/486839ed3499af8ccf31dcad65e91f9ebc145a4e.jpg', 300.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 77%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
distance fabric (polyester)
-
piping (polyester)
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
oval ring (aluminum)
-
zipper (polyester/zinc)
-
tension buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023444, 'https://www.freitag.ch/en/f253-kowalski', 'F253 KOWALSKI', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/6fd5dd31814be214d7eb237d9030fb0c65106417.jpg', 260.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 92%* recycled materials:
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
sewing thread (polyamide)
-
zipper (polyester/zinc)
-
tension buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023445, 'https://www.freitag.ch/en/f511-skipper', 'F511 SKIPPER', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/933499afca3ee5a0d4f960c6b92497af4522654b.jpg', 390.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 80%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
G-hook (aluminum)
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
oval ring (aluminum)
-
zipper (polyester/zinc)
-
water-repellent zipper (polyester/zinc/polyurethane)
-
tension buckle (aluminum)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023446, 'https://www.freitag.ch/en/f512-voyager', 'F512 VOYAGER', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/d73fdac1a3d93a9d2e8b15f546b40a68da5806a0.jpg', 410.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This unique article is made of approx. 90%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
oval ring (aluminum)
-
zipper (polyester/zinc)
-
water-repellent zipper (polyester/zinc/polyurethane)
-
laminated foam
-
tension buckle (polyamide)
-
click buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023447, 'https://www.freitag.ch/en/f600-carter', 'F600 CARTER', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/ddf9ebbc615dc947087665cc3e9ba686e7bc12ec.jpg', 300.00, 0, now(), now(), 'Bags', 'BACKPACK  ', 'This product is one of a kind. It is made from:
-
used truck tarps (polyester fabric with PVC coating)
-
used safety belts (polyester)
-
PFC-free material made from 100% recycled PET bottles using water-saving process', '');
insert into `shesg_product` values (255349023448, 'https://www.freitag.ch/en/f45-lois', 'F45 LOIS', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/ad85594a79cb3cae291e618cb9454c67e5e999b7.jpg', 280.00, 0, now(), now(), 'Bags', 'SPORTS BAG', 'This unique article is made of approx. 86%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
zipper (polyester/zinc)
-
reinforcement (polypropylene)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023449, 'https://www.freitag.ch/en/f660-jimmy', 'F660 JIMMY', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/836604c8cb4a5128020c74814bd74e652aec1e60.jpg', 280.00, 0, now(), now(), 'Bags', 'SPORTS BAG', 'This product is one of a kind. It is made from:
-
used truck tarps (polyester fabric with PVC coating)
-
PFC-free material made from 100% recycled PET bottles using water-saving process', '');
insert into `shesg_product` values (255349023450, 'https://www.freitag.ch/en/f511-skipper', 'F511 SKIPPER', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/8aa87193c3f0ff889e8c6bcc5a05957a8c555ba0.jpg', 390.00, 0, now(), now(), 'Bags', 'SPORTS BAG', 'This unique article is made of approx. 80%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
G-hook (aluminum)
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
oval ring (aluminum)
-
zipper (polyester/zinc)
-
water-repellent zipper (polyester/zinc/polyurethane)
-
tension buckle (aluminum)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023451, 'https://www.freitag.ch/en/f512-voyager', 'F512 VOYAGER', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/153e6aa17d33a6789908727bf7b5b69b7bf0d4c6.jpg', 410.00, 0, now(), now(), 'Bags', 'SPORTS BAG', 'This unique article is made of approx. 90%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
oval ring (aluminum)
-
zipper (polyester/zinc)
-
water-repellent zipper (polyester/zinc/polyurethane)
-
laminated foam
-
tension buckle (polyamide)
-
click buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023452, 'https://www.freitag.ch/en/f304-moss', 'F304 MOSS', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/552adaa6a9ecda7673d33c1b73699233d8c2b29b.jpg', 280.00, 0, now(), now(), 'Bags', 'LAPTOP BAG', 'This unique article is made of approx. 77%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
laminated foam
-
reinforcement (polypropylene)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023453, 'https://www.freitag.ch/en/f305-roy', 'F305 ROY', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/321a36c502d08399664e1436cbfa03d78808fb19.jpg', 330.00, 0, now(), now(), 'Bags', 'LAPTOP BAG', 'This unique article is made of approx. 81%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
water-repellent zipper (polyester/zinc/polyurethane)
-
laminated foam
-
reinforcement (polypropylene)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023454, 'https://www.freitag.ch/en/f52-x-miami-vice', 'F52-X MIAMI VICE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/ae3be06507cb7525ab78d86676bce164e063abf9.jpg', 150.00, 0, now(), now(), 'Bags', 'SHOPPING BAG', 'This unique article is made of approx. 85%* recycled materials:
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023455, 'https://www.freitag.ch/en/f52-miami-vice', 'F52 MIAMI VICE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/eab48087d238af22dc15cbf6428154b842ab631e.jpg', 150.00, 0, now(), now(), 'Bags', 'SHOPPING BAG', 'This unique article is made of approx. 96%* recycled materials:
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023456, 'https://www.freitag.ch/en/f640-rollin', 'F640 ROLLIN', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/687cfd017a21bd2fffd7a78abe827ce20ab0a67f.jpg', 260.00, 0, now(), now(), 'Bags', 'SHOPPING BAG', 'This product is one of a kind. It is made from:
-
used truck tarps (polyester fabric with PVC coating)
-
PFC-free material made from 100% recycled PET bottles using water-saving process', '');
insert into `shesg_product` values (255349023457, 'https://www.freitag.ch/en/f560-sterling', 'F560 STERLING', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/3c3f74b73eb041015fbc8a795d68f8c18fa19ba1.jpg', 280.00, 0, now(), now(), 'Bags', 'SHOPPING BAG', 'This unique article is made of approx. 91%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
carabiner (Zamak)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
rivet (iron)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023458, 'https://www.freitag.ch/en/f261-maurice', 'F261 MAURICE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/9ee323cc16981697c7cc91ea14506120cde1c09b.jpg', 170.00, 0, now(), now(), 'Bags', 'BACKPACKABLE TOTE', 'This unique article is made of approx. 95%* recycled materials:
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
carabiner (Zamak)
-
sewing thread (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023459, 'https://www.freitag.ch/en/f262-julien', 'F262 JULIEN', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/68d4012b544bebd799eb58ddea16a1aa14edcf14.jpg', 190.00, 0, now(), now(), 'Bags', 'BACKPACKABLE TOTE', 'This unique article is made of approx. 97%* recycled materials:
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
carabiner (Zamak)
-
sewing thread (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023460, 'https://www.freitag.ch/en/f201-pete', 'F201 PETE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/06b20295a94a02af92d06456ead6ecfa3788dfff.jpg', 240.00, 0, now(), now(), 'Bags', 'BACKPACK   ', 'This unique article is made of approx. 82%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023461, 'https://www.freitag.ch/en/f202-leland', 'F202 LELAND', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/78a7e138228e034821c2e0c46142f594a75d7a16.jpg', 260.00, 0, now(), now(), 'Bags', 'TOTE BAG', 'This unique article is made of approx. 87%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
laminated foam
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023462, 'https://www.freitag.ch/en/f203-bob', 'F203 BOB', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/eb46e6eb655cac21efef7437f53b993403e6e481.jpg', 280.00, 0, now(), now(), 'Bags', 'TOTE BAG', 'This unique article is made of approx. 91%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
lining (post-consumer PET bottles), 100% recycled
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
oval ring (polyamide)
-
zipper (polyester/zinc)
-
laminated foam
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023463, 'https://www.freitag.ch/en/f620-davian', 'F620 DAVIAN', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/44282cbc81f49609b39fca4d0e3eac53c7edbc9a.jpg', 210.00, 0, now(), now(), 'Bags', 'TOTE BAG', 'This product is one of a kind. It is made from:
-
used truck tarps (polyester fabric with PVC coating)
-
PFC-free material made from 100% recycled PET bottles using water-saving process', '');
insert into `shesg_product` values (255349023464, 'https://www.freitag.ch/en/f650-dixon', 'F650 DIXON', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/b605fde946ff703b4ac2f14c13102419b5329ecd.jpg', 150.00, 0, now(), now(), 'Bags', 'CROSSBODY', 'This unique article is made of approx. 79.9%* recycled materials:
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
car seat belt (polyester), 100% B-stock
-
fabric (post-consumer PET bottles), 100% recycled
-
click buckle (polyamide)
-
used truck reflectors (polyester/PVC), 100% recycled
-
oval ring (polyamide)
-
triglide buckle (polyamide)
-
water-repellent zipper (polyester)
-
piping (polyester)
-
Label (PVC), 100% recycled
-
sewing thread (polyamide)
-
woven label (polyester), 100% recycled', '');
insert into `shesg_product` values (255349023465, 'https://www.freitag.ch/en/f14-dexter', 'F14 DEXTER', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/f93c9f2f0d744e79ee94582c317036991ae04951.jpg', 300.00, 0, now(), now(), 'Bags', 'MESSENGER', 'This unique article is made of approx. 86%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
elasticated ribbon (polyester)
-
bicycle inner tube (rubber), 5% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
Cam buckle
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
click buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023466, 'https://www.freitag.ch/en/f40-jamie', 'F40 JAMIE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/4075c24e2df4a27eb63fe938c00ebd893057639e.jpg', 170.00, 0, now(), now(), 'Bags', 'HIPBAG', 'This unique article is made of approx. 67%* recycled materials:
-
elasticated ribbon (polyester)
-
bicycle inner tube (rubber), 5% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
webbing (polyester)
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
zipper (polyester/zinc)
-
click buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023467, 'https://www.freitag.ch/en/f11-lassie', 'F11 LASSIE', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/151b142a881f1392f2b85516a0021ae253960b75.jpg', 260.00, 0, now(), now(), 'Bags', 'MESSENGER', 'This unique article is made of approx. 86%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
bicycle inner tube (rubber), 5% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
Cam buckle
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023468, 'https://www.freitag.ch/en/f41-hawaii-five-o', 'F41 HAWAII FIVE-O', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/60a03938992322afbdf16222462ef598014fef3f.jpg', 190.00, 0, now(), now(), 'Bags', 'MESSENGER', 'This unique article is made of approx. 85%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
bicycle inner tube (rubber), 5% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
Cam buckle
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
sewing thread (polyamide)
-
zipper (polyester/zinc)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023469, 'https://www.freitag.ch/en/f13-top-cat', 'F13 TOP CAT', 'https://freitag.rokka.io/freitag_826_826_2x_focal_scale_crop/f387d3b2741b88a06bbd2dd47ea1bb04c370c2fa.jpg', 330.00, 0, now(), now(), 'Bags', 'MESSENGER', 'This unique article is made of approx. 87%* recycled materials:
-
car seat belt (polyester), 100% B-stock
-
bicycle inner tube (rubber), 5% B-stock
-
used truck tarpaulin (polyester/PVC), 100% recycled
-
Cam buckle
-
Velcro fastener  (polyamide)
-
label (PVC), 25% recycled
-
triglide buckle (polyamide)
-
sewing thread (polyamide)
-
click buckle (polyamide)
-
woven label (polyester)', '');
insert into `shesg_product` values (255349023470, 'https://www.veja-store.com/en_us/canary-b-mesh-nautico-turquoise-pekin-crl012304.html', 'CANARY B-MESH NAUTICO TURQUOISE PEKIN', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/C/R/CRL012304_1_1.jpg', 64.00, 0, now(), now(), 'Shoes', '', 'Upper in B-Mesh, material made of recycled plastic bottles
- Panels in T.P.U
- V logo in rubber
- Lining in Jersey (33% organic cotton and 67% recycled polyester)
- Insole made out E.V.A, recycled E.V.A and wild rubber
- Sole in E.V.A
-Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023471, 'https://www.veja-store.com/en_us/v-12-straps-leather-terrazzo-white-pekin-vsv021738.html', 'V-12 LEATHER TERRAZZO WHITE PEKIN', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/V/S/VSV021738_1.jpg', 88.00, 0, now(), now(), 'Shoes', '', 'The V-12 model is made out of ecological and sustainable materials.

- Upper in leather
- Panels made out of leather
- Logo V made of rubber
- Lining in jersey (33% organic cotton & 67% recycled polyester)
- Insole made out of wild rubber and other synthetic materials
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023472, 'https://www.veja-store.com/en_us/gorilla-b-mesh-olive-jaune-fluo-gle012291.html', 'GORILLA B-MESH OLIVE JAUNE FLUO', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/G/L/GLE012291_1_1.jpg', 72.00, 0, now(), now(), 'Shoes', 'Shoes', 'Upper in B-mesh, 1% recycled plastic bottles
- Panels in vegan suede
- V logo in TPU
- Lining in Jersey of recycled polyester
- Insole made out of wild rubber and other synthetic materials
- Sole made of wild rubber from the Amazonian forest
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023473, 'https://www.veja-store.com/en_us/esplar-mid-leather-indigo-orange-fluo-rmv052389.html', 'ESPLAR MID CHROMEFREE LEATHER INDIGO ORANGE FLUO', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/R/M/RMV052389_1.jpg', 88.00, 0, now(), now(), 'Shoes', 'Shoes', 'Inspired by the adult styles, Veja Small have been created with a reinforced sole and built-up toe to better meet children’s needs.
The ESPLAR* trainers have been named after the Brazilian NGO which brings technical support to the organic cotton farming families Veja works with in North Brazil since 2005.
- Upper in ChromeFree leather
Panels made out of ChromeFree leather
Logo V made of rubber
Lining in organic cotton
Insole made out of wild rubber and other synthetic materials
Sole made of wild rubber from the Amazonian forest (25%)
Made in Brazil, in the region of Porto Alegre
* Escritório de Planejamento e Assessoria Rural (The Rural Planning and Development Association)', '');
insert into `shesg_product` values (255349023474, 'veja-store.com/en_us/esplar-leather-unicorn-white-rsv021803.html', 'ESPLAR LEATHER UNICORN WHITE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/R/S/RSV021803_1.jpg', 92.00, 0, now(), now(), 'Shoes', 'Shoes', 'Inspired by the adult styles, Veja Small have been created with a reinforced sole and built-up toe to better meet children’s needs.

The ESPLAR* trainers have been named after the Brazilian NGO which brings technical support to the organic cotton farming families Veja works with in North Brazil since 25.

- Upper in leather
- Panels made out of leather
- Logo V made of rubber
- Lining in organic cotton
- Insole made out of wild rubber and other synthetic materials
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre

* Escritório de Planejamento e Assessoria Rural (The Rural Planning and Development Association)', '');
insert into `shesg_product` values (255349023475, 'https://www.veja-store.com/en_us/v-10-b-mesh-white-platine-vx012463.html', 'V-10 B-MESH WHITE PLATINE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/V/X/VX012463_1.jpg', 148.75, 0, now(), now(), 'Shoes', 'Shoes', 'The V-10 model made out of ecological and sustainable materials stands for 10 ans d’amour.

Upper in B-Mesh: made from plastic bottles
Panels made out of leather
Logo V made of leather
Lining in jersey (33% organic cotton & 67% recycled polyester)
Insole made out of wild rubber and other synthetic materials
Sole made of wild rubber from the amazonian forest (24%)
Made in Brazil, in the region of Porto Alegre
The B-Mesh used by Veja is made from recycled plastic bottles. 3 plastic bottles are used to create a pair of sneakers. This upcycling process creates a smart fabric, both breathing and water-repellent.', '');
insert into `shesg_product` values (255349023476, 'https://www.veja-store.com/en_us/3-lock-leather-white-black-el020005.html', '3-LOCK LEATHER WHITE BLACK', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/e/l/el020005_1.jpg', 112.00, 0, now(), now(), 'Shoes', 'Shoes', 'The ESPLAR* trainers have been named after the Brazilian NGO which brings technical support to the organic cotton farming families Veja works with in North Brazil since 25.

- Upper in leather
- Panels made out of leather
- Logo V made of leather
- Lining in organic cotton
- Insole made out of wild rubber and other synthetic materials
- Sole made of rubber from the Amazonian forest (19%)
- Made in Brazil, in the region of Porto Alegre

* Escritório de Planejamento e Assessoria Rural (The Rural Planning and Development Association)', '');
insert into `shesg_product` values (255349023477, 'https://www.veja-store.com/en_us/esplar%20se%20canvas%20white%20california-se0102087a.html', 'ESPLAR SE CANVAS WHITE CALIFORNIA', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/S/E/SE0102087A_1.jpg', 80.00, 0, now(), now(), 'Shoes', 'Shoes', 'The ESPLAR* trainers have been named after the Brazilian NGO which brings technical support to the organic cotton farming families Veja works with in North Brazil since 2005.

Upper : Organic cotton (100%)
Panels : Coated canvas
Logo V : Rubber and rice waste (22%)
Insole : Amazonian rubber, sugar cane, recycled E.V.A.** and organic cotton
Outsole : Amazonian rubber, rice waste (22%) and recycled rubber (12%)
Lining & laces : Organic cotton ( 100%)
Made in Brazil

The Canvas is made of 100% certified organic cotton, without the use of pesticides or chemical fertilizers. From 2004 to 2020, VEJA purchased nearly 642 tons of organic cotton. The cotton is cultivated in Brazil and Peru by associations that respect people and the environment, according to fair trade principles.

*Escritório de Planejamento e Assessoria Rural (The Rural Planning and Development Association)

**ethylene vinyl acetate ', '');
insert into `shesg_product` values (255349023478, 'https://www.veja-store.com/en_us/esplar-chromefree-white-absinthe-butter-sole-eo052571.html', 'ESPLAR CHROMEFREE LEATHER WHITE ABSINTHE BUTTER SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/E/O/EO052571_1.jpg', 120.00, 0, now(), now(), 'Shoes', 'Shoes', 'Named in tribute to the Brazilian NGO we have been working with since 2005. ESPLAR* supports organic and family farming in the Nordeste region.

- Upper in ChromeFree leather
- Pannels in ChromeFree leather
- Logo V made of rubber and rice waste (23%)
- 100% organic cotton laces
- Tech inner lining (100% recycled plastic bottles) developed to acquire a better resistance to friction and provide maximum comfort and flexibility thanks to its mesh structure.
- 64% organic-sourced and recycled insole: made from sugar cane (34%), Amazon rubber (11%), organic cotton (11%) & recycled E.V.A.** (8%)
- 54% bio-sourced and recycled vulcanized outsole: made from rice waste (23%), Amazon rubber (19%), recycled rubber (12%), etc.
- Made in Brazil', '');
insert into `shesg_product` values (255349023479, 'https://www.veja-store.com/en_us/v-10-suede-mud-white-gum-sole-vx032337.html', 'V-10 SUEDE MUD WHITE GUM SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/V/X/VX032337_1.jpg', 156.00, 0, now(), now(), 'Shoes', 'Shoes', 'The V-10 model made out of ecological and sustainable materials stands for 10 years of love.

Upper in suede
Panels made out of leather and suede
Logo V made of rubber
Lining in jersey (33% organic cotton & 67% recycled polyester)
Insole made out of wild rubber and other synthetic materials
Sole made of wild rubber from the Amazonian forest (24%)
Made in Brazil in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023480, 'https://www.veja-store.com/en_us/3-lock-leather-terrazzo-el0201650a.html', '3-LOCK LEATHER TERRAZZO', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/v/e/veja_el021650_3-lock_leather_terrazzo_pekin_lateral.jpg', 112.00, 0, now(), now(), 'Shoes', 'Shoes', 'Upper: Leather
Pannels: Leather
Logo V: Rubber and rice waste (23%)
Insole: Sugar cane (34%), Amazon rubber (11%), organic cotton (11%) and recycled E.V.A.* (8%)
Outsole: Rice waste (23%), Amazon rubber (19%), recycled rubber (12%), etc.
Straps: Leather
Lining: Tech (100% recycled plastic bottles)
Made in Brazil', '');
insert into `shesg_product` values (255349023481, 'https://www.veja-store.com/en_us/v-10-leather-nacre-white-fushia-vx021918.html', 'V-10 LEATHER NACRE WHITE FUSHIA', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/V/X/VX021918_1.jpg', 165.75, 0, now(), now(), 'Shoes', 'Shoes', 'The V-10 model made out of ecological and sustainable materials stands for 10 years of love.

- Upper in leather
- Panels made out of leather
- Logo V made of rubber
- Lining in jersey (33% organic cotton & 67% recycled polyester)
- Insole made out of wild rubber and other synthetic materials
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023482, 'https://www.veja-store.com/en_us/sdu-b-mesh-olive-white-natural-rt012379.html', 'SDU B-MESH OLIVE WHITE NATURAL', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/R/T/RT012379_1.jpg', 124.00, 0, now(), now(), 'Shoes', 'Shoes', 'Upper in B-mesh: made from recycled plastic bottles
Panels made out of vegan suede and TPU
Logo V made of TPU
Lining in Jersey of recycled polyester
Insole made out of wild rubber and other synthetic materials
Midsole made of Sugar cane (53%)
Sole made of rubber from the Amazonian forest (12%)
Made in Brazil, in the region of Porto Alegre
The B-Mesh used by Veja is made from recycled plastic bottles. 3 plastic bottles are used to create a pair of sneakers. This upcycling process creates a smart fabric, both breathing and water-repellent.', '');
insert into `shesg_product` values (255349023483, 'https://www.veja-store.com/en_us/roraima-suede-oxford-grey-white-qr032366.html', 'RORAIMA SUEDE OXFORD GREY WHITE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/R/QR032366_1.jpg', 168.00, 0, now(), now(), 'Shoes', 'Shoes', 'Upper in suede
Panels made out of suede
Logo V made of rubber
Lining in flannel, recycled cotton and polyester
Insole made out of wild rubber and other synthetic materials
Technical insole made out of wool
Sole made of wild rubber from the Amazonian forest (25%)
Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023484, 'https://www.veja-store.com/en_us/roraima-bastille-suede-desert-orange-qr031961.html', 'RORAIMA BASTILLE SUEDE DESERT ORANGE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/R/QR031961_1.jpg', 168.00, 0, now(), now(), 'Shoes', 'Shoes', 'Upper in suede
- Panels made out of suede
- Logo V made of rubber
- Lining in flannel, recycled cotton and polyester
- Insole made out of wild rubber and other synthetic materials
- Technical insole made out of wool
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023485, 'https://www.veja-store.com/en_us/aw18-roraima-bastille-leather-black-grafite-rust-outsole-qb020311.html', 'RORAIMA BASTILLE LEATHER BLACK GRAFITE RUST OUTSOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/B/QB020311_1.jpg', 168.00, 0, now(), now(), 'Shoes', 'Shoes', 'Upper in leather
- Panels made out of leather
- Logo V made of rubber
- Lining in flannel, recycled cotton and polyester
- Insole made out of wild rubber and other synthetic materials
- Technical insole made out of wool
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023486, 'https://www.veja-store.com/en_us/nova-high-top-canvas-tent-pierre-nt012354.html', 'NOVA HIGH TOP CANVAS TENT PIERRE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/n/t/nt012354_1.jpg', 96.00, 0, now(), now(), 'Shoes', '', 'Upper in organic cotton
Logo V in silkscreened print
Lining in organic cotton
Insole made out of wild rubber and other synthetic materials
Sole made of rubber from the Amazonian forest (18%)
Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023487, 'https://www.veja-store.com/en_us/nova-ht-canvas-surfers-pierre-nt012227.html', 'VEJA X G.KERO', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/N/T/NT012227_1_1.jpg', 96.00, 0, now(), now(), 'Shoes', '', 'Four years after their first collaboration, VEJA and G.Kero imagine together a sneaker with Brazilian surfers’ vibes. Marguerite Bartherotte, designer of G.Kero, puts her drawings on the canvas of these summery sneakers.

Upper in organic cotton
- Logo V in silkscreened print
- Lining in organic cotton
- Insole made out of wild rubber and other synthetic materials
- Sole made of wild rubber from the Amazonian forest (20%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023488, 'https://www.veja-store.com/en_us/nova-suede-tent-pierre-na031576.html', 'NOVA SUEDE TENT PIERRE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/n/a/na031576_1.jpg', 84.00, 0, now(), now(), 'Shoes', '', 'Upper in water-repellent suede
- Logo V in rubber
- Lining in organic cotton
- Insole made out of wild rubber and other synthetic materials
- Sole made of wild rubber from the Amazonian forest (2%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023489, 'https://www.veja-store.com/en_us/sdu-rec-alveomesh-nautico-oxford-grey-grey-rr012509.html', 'SDU REC ALVEOMESH NAUTICO OXFORD GREY GREY', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/R/R/RR012509_1.jpg', 124.00, 0, now(), now(), 'Shoes', '', '- Upper in Alveomesh (100% recycled plastic bottles)
- Pannels in vegan suede & coated fabric
- Side V Logo in Rubber and Rice Waste (23%)
- Organic cotton laces (100%)
- Midsole made from sugar cane (53%)
- Glued outsole made of Amazon rubber (12%) & rice waste (30%)
- Sugarcane insole, Amazon rubber, recycled E.V.A.* & organic cotton
- Tech inner lining (100% recycled plastic bottles) developed to acquire a better resistance to friction and provide maximum comfort and flexibility thanks to its mesh structure.

Alveomesh is a technical fabric made exclusively from recycled plastic bottles. It brings breathability, flexibility and lightness to the shoe.', '');
insert into `shesg_product` values (255349023490, 'https://www.veja-store.com/en_us/dekkan-alveomesh-centre-commercial-black-dc0102765.html', 'DEKKAN ALVEOMESH CENTRE-COMMERCIAL BLACK', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/d/c/dc012765_1_1.jpg', 168.00, 0, now(), now(), 'Shoes', '', 'Upper: Alveomesh (100% recycled polyester)
Panels: T.P.U.* and rubber
Logo V: Amazonian rubber (26%)
Insole: Sugar cane (57%) and recycled polyester (16%)
Midsole: Sugar cane (70%)
Outsole: Amazonian rubber (30%)
Lining: Tech (100% recycled polyester)
Laces and backloop: Recycled polyester (100%)
Made in Brazil', '');
insert into `shesg_product` values (255349023491, 'https://www.veja-store.com/en_us/venturi-b-mesh-olive-dried-petal-sole-vt012127.html', 'VENTURI B-MESH OLIVE DRIED PETAL SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/V/T/VT012127_1_1.jpg', 164.00, 0, now(), now(), 'Shoes', '', 'Upper in B-Mesh: made from plastic bottles
- Panels made out of leather, 3D-Knit & TPU details
- Logo V made of rubber
- Lining in jersey (33% organic cotton & 67% recycled polyester)
- Insole made out of wild rubber (12%), recycled plastic bottles (12%), jute (12%) and other synthetic materials
- Sole made of wild rubber from the Amazonian forest 20%
- Cushion latex in L-Foam (50% natural latex from Brazil & 50% synthetic latex)
- Made in Brazil, in the region of Porto Alegre

The B-Mesh used by Veja is made from recycled plastic bottles. 3 plastic bottles are used to create a pair of sneakers. This upcycling process creates a smart fabric, both breathing and water-repellent.', '');
insert into `shesg_product` values (255349023492, 'https://www.veja-store.com/en_us/nova-hl-ripstop-tent-black-nl0102670.html', 'NOVA HL RIPSTOP TENT BLACK', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/N/L/NL0102670_1.jpg', 84.00, 0, now(), now(), 'Shoes', '', '- Upper in Ripstop (100% recycled polyester)
- SIde V logo in Screen printing
- Outsole made from Amazonian rubber (18%) and rice waste (28%)
- Insole made from Sugar cane, Amazonian rubber, recycled EVA & organic cotton
- Lining and laces are made from organic cotton (100%)
- Label made from organic cotton
- Backloop in recycled polyester (100%)

The ripstop features a reinforced structure as it is tearresistant due to its mesh-shaped pattern made up of fine and thicker, intertwined yarns. If there is a tear in the fabric, it will be narrowed down to the circumference of the square. Being a light material, it is often used on outdoor activities, which requires solid technical expertise (100% recycled polyester). Made in Brazil.', '');
insert into `shesg_product` values (255349023493, 'https://www.veja-store.com/en_us/roraima-suede-desert-orange-fluo-gum-sole-qr032385.html', 'RORAIMA SUEDE DESERT ORANGE GUM SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/R/QR032385_1.jpg', 168.00, 0, now(), now(), 'Shoes', '', 'Upper : Suede
Panels : Suede
Logo V : Rubber
Insole : Wild rubber and other synthetic materials
Technical insole : Wool
Outsole : Wild rubber from the Amazonian forest (25%)
Lining : Flannel, recycled cotton and polyester
Made in Brazil', '');
insert into `shesg_product` values (255349023494, 'https://www.veja-store.com/en_us/roraima-bastille-suede-tuile-jaune-fluo-qr031973.html', 'RORAIMA BASTILLE SUEDE TUILE JAUNE FLUO', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/R/QR031973_1.jpg', 168.00, 0, now(), now(), 'Shoes', '', 'Upper in suede
- Panels made out of suede
- Logo V made of rubber
- Lining in flannel, recycled cotton and polyester
- Insole made out of wild rubber and other synthetic materials
- Technical insole made out of wool
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023495, 'https://www.veja-store.com/en_us/roraima-leather-black-pierre-sole-qr022358.html', 'RORAIMA LEATHER BLACK PIERRE SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/R/QR022358_1.jpg', 168.00, 0, now(), now(), 'Shoes', '', 'Upper in leather
Panels made out of leather
Logo V made of rubber
Lining in flannel, recycled cotton and polyester
Insole made out of wild rubber and other synthetic materials
Technical insole made out of wool
Sole made of wild rubber from the Amazonian forest (25%)
Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023496, 'https://www.veja-store.com/en_us/marlin-v-knit-nil-purple-kaki-sole-lt102645.html', 'MARLIN V-KNIT NIL PURPLE KAKI SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/l/t/lt102645_1.jpg', 147.00, 0, now(), now(), 'Shoes', '', 'Named after one of the fastest and most athletic fishes in the ocean, the Marlin comes in just after 18 months of conceiving the Condor. The Marlin is designed for those days when you have performance in mind. Light and dynamic yet comfortable for everyday users. The Marlin is about perpetual improvement in mind.
The Marlin\' sizing is slightly different, please refer yourself to the size guide.

Surface: Road / Park
Ride: Neutral
Drop: 6 mm (24 mm - 18 mm)
Weight: 288g / 10,2 oz (size 42)
Bio-based / Recycled: 62%

MATERIALS
Upper in V-Knit
100% recycled plastic bottles
Panels made in T.P.U.
Logo V and heel support insert in Pebax® Rnew®
62% ricinus oil
Lining Tech
100% recycled plastic bottles
Insole
51% sugar cane - 21% recycled plastic bottles
Midsole
60% sugar cane
L-Foam cushioned technology
30% natural latex from Brazil - 70% synthetic latex
Outsole
32% Amazonian rubber - 33% rice waste - 7% soy - 3% palm oil

Made in Brazil, in the region of Fortaleza', '');
insert into `shesg_product` values (255349023497, 'https://www.veja-store.com/en_us/v-10%20cwl%20white%20orange-fluo%20marsala-vx0702785a.html', 'V-10 CWL WHITE ORANGE FLUO MARSALA', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/V/X/VX0702785A_1.jpg', 156.00, 0, now(), now(), 'Shoes', '', 'Upper : C.W.L. (organic cotton coated with a resin from P.U., corn starch and ricinus oil)
Panels : C.W.L. and coated canvas
Logo V : Rubber and rice waste (22%)
Insole : Amazonian rubber, sugar cane, recycled E.V.A.* and organic cotton
Outsole : Amazonian rubber (31%), rice waste (22%) and recycled rubber (12%)
Lining : Tech (100% recycled polyester)
Laces : Organic cotton (100%)
Made in Brazil

Cotton Worked as Leather. This material is a vegan alternative to leather. A 100% organic cotton canvas, coated with P.U., corn starch and ricinus oil. 54% bio-based.', '');
insert into `shesg_product` values (255349023498, 'https://www.veja-store.com/en_us/recife%20nubuck%20matcha%20white-rc1302774a.html', 'RECIFE NUBUCK MATCHA WHITE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/R/C/RC1302774A_1.jpg', 148.00, 0, now(), now(), 'Shoes', '', 'Upper : Nubuck
Panels : Nubuck and ChromeFree leather
Logo V : Rubber and rice waste (22%)
Insole : Amazonian rubber, sugar cane, recycled E.V.A.* and organic cotton
Outsole : Amazonian rubber (31%), rice waste (22%) and recycled rubber (12%)
Lining : Tech (100% recycled polyester)
Straps : Nubuck
Made in Brazil

The bovine ChromeFree leather is smooth and light. Coming from farms located in the south of Brazil (Rio Grande do Sul), it undergoes an innovative tanning process where no chrome, heavy metals or dangerous acids are involved. By simplifying the tanning process, the use of chemicals and energy is limited, the use of water is reduced by about 40% and the use of salt by 80%. After tanning, the water is recyclable.

Nubuck is made from grain leather. The upper part of bovine skin has the thickest fibers, which make it soft, resistant, and highly qualitative. This part is grinded or scraped to give it a soft and velvety appearance. The Nubuck is also coated with water-repellent oils without PFCs (chemical compounds) to protect the sneakers from light rain. The cattle are grown in Uruguay. The skins are tanned and finished in Brazil.', '');
insert into `shesg_product` values (255349023499, 'https://www.veja-store.com/en_us/roraima-suede-brown-black-gum-sole-qr032299.html', 'RORAIMA SUEDE BROWN BLACK GUM SOLE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/v/e/veja_qr032299_lateral.jpg', 168.00, 0, now(), now(), 'Shoes', '', 'Upper in suede
- Panels made out of suede
- Logo V made of rubber
- Lining in flannel, recycled cotton and polyester
- Insole made out of wild rubber and other synthetic materials
- Technical insole made out of wool
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023500, 'https://www.veja-store.com/en_us/roraima-bastille-suede-cyprus-orange-qr031962.html', 'RORAIMA BASTILLE SUEDE CYPRUS ORANGE', 'https://www.veja-store.com/media/catalog/product/cache/527447f8cffec2edb3591f96240a2d24/Q/R/QR031962_1.jpg', 168.00, 0, now(), now(), 'Shoes', '', 'Upper in Bastille suede
- Panels made out of Bastille suede
- Logo V made of rubber
- Lining in flannel, recycled cotton and polyester
- Insole made out of wild rubber and other synthetic materials
- Technical insole made out of wool
- Sole made of wild rubber from the Amazonian forest (25%)
- Made in Brazil, in the region of Porto Alegre', '');
insert into `shesg_product` values (255349023501, 'https://wearpact.com/women/apparel/tops%20&%20shirts/tissue%20slub%20double%20scoop%20tank/wa1-wki-glg', 'Tissue Slub Double Scoop Tank', 'https://static.wearpact.com/img/product/women/wki-glg-1-1684186747_thumb.jpg', 37.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'The Tissue Slub Tank is a season staple, made to be layered or worn alone. Either way, you\'re going to look (and feel) cool
Lightweight, airy, organic tissue slub
Bra-friendly strap width
Scoop neck, plunging back
Slim fit, shirttail hem

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023502, 'https://wearpact.com/women/apparel/tops%20&%20shirts/tissue%20slub%20muscle%20tee/wa1-wum-mro', 'Tissue Slub Muscle Tee', 'https://static.wearpact.com/img/product/women/wum-mro-1-1684187625_thumb.jpg',
                                    37.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'A feminine take on the muscle tee, this boxy basic is quickly becoming our new go-to
A feminine take on the muscle tee, this upgraded basic is quickly becoming our new go-to. Don\'t you look (and feel) cool
High curved neck, straight bottom hem
Shoulder-width cap sleeves with twist detailing

Machine wash cold, gentle cycle. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023503, 'https://wearpact.com/women/underwear/undies/boy%20shorts/wd1-wbs-fnv', 'Boy Shorts', 'https://static.wearpact.com/img/product/women/wbs-fnv-1-1683158152_thumb.jpg', 14.00, 0, now(), now(), 'Activewear', 'Undies', 'Made with soft, breathable organic cotton
Low-rise waist
Extended leg for full coverage
Smooth look under clothes
No pinch, tagless design

Made with soft, breathable organic cotton
Low-rise waist
Extended leg for full coverage
Smooth look under clothes
No pinch, tagless design', '');
insert into `shesg_product` values (255349023504, 'https://wearpact.com/women/underwear/undies/high%20cut%20brief%206-pack/wd6-whg-ddr', 'High Cut Brief 6-Pack', 'https://static.wearpact.com/img/product/women/6-whg-ddr-laydown-1-1683158148_thumb.jpg', 74.00, 0, now(), now(), 'Activewear', 'Undies', 'Made with soft, breathable organic cotton
High-rise waist
Fuller back coverage
High-cut leg opening
Tagless, flat waistband

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023505, 'https://wearpact.com/women/underwear/undies/high%20cut%20brief/wd1-whg-rou', 'High Cut Brief', 'https://static.wearpact.com/img/product/women/whg-rou-1-1656434201_thumb.jpg', 14.00, 0, now(), now(), 'Activewear', 'Undies', 'Made with soft, breathable organic cotton
High-rise waist
Fuller back coverage
High-cut leg opening
Tagless, flat waistband

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023506, 'https://wearpact.com/women/underwear/undies/lace-waist%20brief%206-pack/wd6-wlb-uts', 'Lace-Waist Brief 6-Pack', 'https://static.wearpact.com/img/product/women/6-wlb-uts-laydown-1-1683158149_thumb.jpg', 74.00, 0, now(), now(), 'Activewear', 'Undies', 'Mid rise waist
Fuller back coverage
Low cut legs
Tagless, soft lace waistband
Prewashed fabric, shrink resistant

Hand wash normal temperature. Line dry.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023507, 'https://wearpact.com/women/underwear/undies/lace-waist%20brief/wd1-wlb-ckp', 'Lace-Waist Brief', 'https://static.wearpact.com/img/product/women/wlb-ckp-1-1656510756_thumb.jpg', 14.00, 0, now(), now(), 'Activewear', 'Undies', 'Mid rise waist
Fuller back coverage
Low cut legs
Tagless, soft lace waistband
Prewashed fabric, shrink resistant

Hand wash normal temperature. Line dry.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023508, 'https://wearpact.com/women/underwear/undies/classic%20fit%20bikini%206-pack/wd6-wbc-cyr', 'Classic Fit Bikini 6-Pack', 'https://static.wearpact.com/img/product/women/6-wbc-cyr-laydown-1-1683158145_thumb.jpg', 74.00, 0, now(), now(), 'Activewear', 'Undies', 'Made with soft, breathable organic cotton
Mid-rise waist
Fuller back coverage
High cut leg
Tagless, flat waistband

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023509, 'https://wearpact.com/women/underwear/undies/classic%20fit%20bikini/wd1-wbc-fnv', 'Classic Fit Bikini', 'https://static.wearpact.com/img/product/women/wbc-fnv-1-1683158152_thumb.jpg', 14.00, 0, now(), now(), 'Activewear', 'Undies', 'Made with soft, breathable organic cotton
Mid-rise waist
Fuller back coverage
High cut leg
Tagless, flat waistband

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023510, 'https://wearpact.com/women/apparel/pants%20&%20shorts/the%20coastal%20daily%20pant%20-%20full%20length/wa1-wog-bka', 'The Coastal Daily Pant - Full Length', 'https://static.wearpact.com/img/product/women/wog-bka-1-1683743434_thumb.jpg', 96.00, 0, now(), now(), 'Activewear', 'Pants & Shorts', 'Designed for the beach, but worn well beyond that. Our bestselling Coastal Pants are easy to pull on, easy to pack, and easy to outfit with our Coastal Top
Woven, double-gauze fabric creates a flowy silhouette
Updated, non-smocked waistband
Updated full length
Tall, side-seam vent for movement
Two side pockets, no back pockets

Machine wash cold. Line Dry. Do not Dry clean.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023511, 'https://wearpact.com/women/apparel/pants%20&%20shorts/the%20coastal%20daily%20pant%20-%20cropped/wa1-wdi-ssl', 'The Coastal Daily Pant - Cropped', 'https://static.wearpact.com/img/product/women/wdi-ssl-1-1683743095_thumb.jpg', 96.00, 0, now(), now(), 'Activewear', 'Pants & Shorts', 'Best sellers for a reason, the Coastal Pants are easy to throw on, pack, wear, and rewear. Pair these with one of our Coastal Tops, and you\'ll be sipping Mai Tais somewhere warm in no time
Woven, double-gauze fabric creates a flowy silhouette
Two side pockets
Smocked waistband that hits near the belly button
Updated to a more versatile length

Machine wash cold. Line Dry. Do not Dry clean.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023512, 'https://wearpact.com/women/apparel/dresses%20&%20skirts/the%20coastal%20maxi%20skirt/wa1-wqk-fnv', 'The Coastal Maxi Skirt', 'https://static.wearpact.com/img/product/women/wqk-fnv-1-1683741378_thumb.jpg', 96.00, 0, now(), now(), 'Activewear', 'Dresses & Skirts', 'A classic, feminine fit in our signature summertime fabric. Pair it with the Coastal Smocked Tank, and you\'ll be sipping Mai Tais somewhere warm in no time
Woven, double-gauze fabric creates a flowy silhouette
Elastic waistband
Two hidden side pockets
Dramatic slit on the left side for easy movement
Ankle length, sweeping skirt
Make it a set with the Coastal Smocked Tank

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023513, 'https://wearpact.com/women/apparel/dresses%20&%20skirts/the%20coastal%20beach%20mini%20dress/wa1-wqm-srf', 'The Coastal Beach Mini Dress', 'https://static.wearpact.com/img/product/women/wqm-srf-1-1683735640_thumb.jpg', 77.00, 0, now(), now(), 'Activewear', 'Dresses & Skirts', 'Meet the Coastal Mini Dress: a little number that\'s as easy as it is breezy. Prepare for sun-kissed shoulders, fruity cocktail cravings, and compliments
Woven, double-gauze fabric creates a flowy silhouette
Decorative non-functioning button front
Two hidden side pockets
Hits mid-thigh on most
Relaxed fit

Meet the Coastal Mini Dress: a little number that\'s as easy as it is breezy. Prepare for sun-kissed shoulders, fruity cocktail cravings, and compliments
Woven, double-gauze fabric creates a flowy silhouette
Decorative non-functioning button front
Two hidden side pockets
Hits mid-thigh on most
Relaxed fit', '');
insert into `shesg_product` values (255349023514, 'https://wearpact.com/women/apparel/pants%20&%20shorts/the%20coastal%20daily%20short/wa1-wqs-ecs', 'The Coastal Daily Short', 'https://static.wearpact.com/img/product/women/wqs-ecs-1-1683739593_thumb.jpg', 63.00, 0, now(), now(), 'Activewear', 'Pants & Shorts', 'Light and breezy, the Coastal Shorts are easy to throw on, pack, wear, and rewear. Pair it with one of our Coastal Tops, and you\'ll be sipping Mai Tais somewhere warm in no time
Woven, double-gauze fabric creates a flowy silhouette
Elastic waistband with removable fabric belt
Two side pockets
Side vents for movement

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023515, 'https://wearpact.com/women/apparel/jumpsuits/the%20coastal%20beach%20halter%20jumpsuit/wa1-wqj-fnv', 'The Coastal Beach Halter Jumpsuit', 'https://static.wearpact.com/img/product/women/wqj-fnv-1-1683734257_thumb.jpg', 110.00, 0, now(), now(), 'Activewear', 'Jumpsuits', 'Meet the Coastal Jumpsuit: our breezy solution to looking put-together in a snap. Prepare for sun-kissed shoulders, fruity cocktail cravings, and compliments
Woven, double-gauze fabric creates a flowy silhouette
Halter neck with adjustable bow tie back
Keyhole back
Belt loops with removable fabric belt
Two hidden side pockets
Full length, wide leg

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023516, 'https://wearpact.com/women/apparel/tops%20&%20shirts/the%20coastal%20smocked%20tank/wa1-wqt-bka', 'The Coastal Smocked Tank', 'https://static.wearpact.com/img/product/women/wqt-bka-1-1683742582_thumb.jpg', 47.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'A modern, feminine fit in our signature summertime fabric. Pair it with the Coastal Smocked Skirt, and you\'ll be sipping Mai Tais somewhere warm in no time
Woven, double-gauze fabric creates a flowy silhouette
Ruffled neckline with decorative smocking
Flat straps with two-button adjustability
Drawcord at waist for a cinched fit
Slightly cropped fit, pairs well with high waisted bottoms
Make it a set with the Coastal Smocked Skirt

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023517, 'https://wearpact.com/women/apparel/dresses%20&%20skirts/the%20coastal%20cami%20maxi%20dress/wa1-wqc-ecs', 'The Coastal Cami Maxi Dress', 'https://static.wearpact.com/img/product/women/wqc-ecs-1-1683737392_thumb.jpg', 110.00, 0, now(), now(), 'Activewear', 'Dresses & Skirts', 'Meet the Coastal Cami Dress: our breezy solution to looking (and feeling) cool in the heat. Prepare for sun-kissed shoulders, fruity cocktail cravings, and compliments
Woven, double-gauze fabric creates a flowy silhouette
Elastic neckline and waist
Flat, adjustable straps
Two hidden side pockets
Ankle length, sweeping skirt

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023518, 'https://wearpact.com/women/apparel/jumpsuits/the%20soir%C3%A9e%20smocked%20strapless%20jumpsuit/wa1-wvu-fnv', 'The Soirée Smocked Strapless Jumpsuit', 'https://static.wearpact.com/img/product/women/wvu-fnv-1-1683831996_thumb.jpg', 96.00, 0, now(), now(), 'Activewear', 'Jumpsuits', 'Places to go, people to impress. The Soiree Jumpsuit is a steamy summer one-piece designed for dressing up, dressing down, and feeling your best
Soft, stretchy organic cotton blend
Smocked bodice with ruffled neckline
Elastic waist with drawcord
Side pockets with stitching detail
Wide leg, ankle length
Removable straps create two stylish looks

Machine wash cold. Tumble dry low.
74% Organic Cotton
21% Recycled Polyester
5% Elastane
GOTS Certified Made With Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023519, 'https://wearpact.com/women/apparel/dresses%20&%20skirts/the%20soir%C3%A9e%20smocked%20maxi%20dress/wa1-wvv-dad', 'The Soirée Smocked Maxi Dress', 'https://static.wearpact.com/img/product/women/wvv-dad-1-1683830765_thumb.jpg', 120.00, 0, now(), now(), 'Activewear', 'Dresses & Skirts', 'Places to go, people to impress. The Soiree Maxi Dress is a warm-weather favorite designed for dressing up, dressing down, and feeling your best
Soft, stretchy organic cotton blend
Adjustable straps
Smocked bodice with ruffled neckline
Elastic waist
Two hidden side pockets
Full length, sweeping skirt

Machine wash cold. Tumble dry low.
74% Organic Cotton
21% Recycled Polyester
5% Elastane
GOTS Certified Made With Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023520, 'https://wearpact.com/women/apparel/tops%20&%20shirts/tissue%20slub%20twisted%20tee/wa1-www-pay', 'Tissue Slub Twisted Tee', 'https://static.wearpact.com/img/product/women/www-pay-1-1684186118_thumb.jpg', 44.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'This Tissue Slub Twisted Tee is a classic fit with a flirty twist (get it?). We love an effortless upgrade
Lightweight, airy, organic tissue slub
Crew neck
Extended short sleeve
Banded bottom hem
Center front twisted detail
Standard fit, hits at the hip

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023521, 'https://wearpact.com/men/apparel/tops%20&%20shirts/the%20mix%20henley/wa1-mmh-glm', 'The Mix Henley', 'https://static.wearpact.com/img/product/men/mmh-glm-1-1680647217_thumb.jpg', 57.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'A touch of 90s nostalgia, with subtle texture and timeless style
Super soft melange jersey
Henley neckline, four ring-snap buttons
Full-length sleeves with ribbed cuffs
Standard fit, hits at the hip

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023522, 'https://wearpact.com/men/apparel/tops%20&%20shirts/the%20mix%20short%20sleeve%20crew/wa1-mmc-mnm', 'The Mix Short Sleeve Crew', 'https://static.wearpact.com/img/product/men/mmc-mnm-1-1680647216_thumb.jpg', 47.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'A touch of 90s nostalgia, with subtle texture and timeless style
Super soft melange jersey
Crew neck, ribbed collar
Short sleeves
Standard fit, hits at the hip

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023523, 'https://wearpact.com/men/underwear/boxers%20&%20briefs/grateful%20dead%20x%20pact%20boxer%20brief%204-pack/wa4-mxb-itd', 'Grateful Dead X Pact Boxer Brief 4-Pack', 'https://static.wearpact.com/img/product/men/mxb-itd-1-1680728372_thumb.jpg', 67.00, 0, now(), now(), 'Activewear', 'Boxers & Briefs', 'Introducing the Grateful Dead Collab: a small batch of limited-edition deadhead designs
Made with soft, breathable organic cotton
Low-rise waist, snug fit
Functional vertical fly
No-roll, smooth, flat waistband
Tagless back
One-of-a-kind Grateful Dead designs

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023524, 'https://wearpact.com/men/apparel/tops%20&%20shirts/softspun%20v-neck%20tee/wa1-mfw-ilb', 'Softspun V-Neck Tee', 'https://static.wearpact.com/img/product/men/mfw-ilb-1-1681761124_thumb.jpg', 24.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'Made with our bestselling Softspun fabric, this V-Neck is the perfect addition to your organic basics collection
Semi-fitted body, ideal for layering
Ribbed v-neck, short sleeve
Hits at the hip, straight hem

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023525, 'https://wearpact.com/men/apparel/tops%20&%20shirts/softspun%20crew%20neck%20tee/wa1-mcn-mro', 'Softspun Crew Neck Tee', 'https://static.wearpact.com/img/product/men/mcn-mro-1-1681760033_thumb.jpg', 24.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'Made with our bestselling Softspun fabric, this Crew is the perfect addition to your organic basics collection
Semi-fitted body, ideal for layering
Ribbed crew neck, short sleeve
Hits at the hip, straight hem

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023526, 'https://wearpact.com/men/apparel/tops%20&%20shirts/the%20sunset%20button%20up/wa1-mub-bvs', 'The Sunset Button Up', 'https://static.wearpact.com/img/product/men/mub-bvs-1-1682464732_thumb.jpg', 67.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'Out-of-office is officially on. We upgraded your favorite summer shirt with a lightweight gauze fabric so you can keep the good vibes going all season long
Woven, breathable organic cotton
Collar neck, full button front
Plant-based corozo buttons
Short sleeves
Chest pocket on the left
Standard fit, straight hem

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023527, 'https://wearpact.com/men/apparel/pants%20&%20shorts/the%20backyard%20weekend%20pant/wa1-myp-ggr', 'The Backyard Weekend Pant', 'https://static.wearpact.com/img/product/men/myp-ggr-laydown-1-1682467095_thumb.jpg', 96.00, 0, now(), now(), 'Activewear', 'Pants & Shorts', 'In case of backyard shenanigans. The Weekend Pants are our summer favorites, made with a breezy cotton/linen blend that\'ll keep you looking (and feeling) cool
Summer-friendly organic cotton + linen blend
Elastic waistband with drawcord
Two side pockets, one hidden back pocket
Faux fly
Relaxed fit, full length

Machine wash cold. Tumble dry low.
70% Organic Cotton
30% Linen
GOTS Certified Made With Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023528, 'https://wearpact.com/men/apparel/tops%20&%20shirts/the%20backyard%20button%20up/wa1-myb-dsr', 'The Backyard Button Up', 'https://static.wearpact.com/img/product/men/myb-dsr-1-1682466064_thumb.jpg', 77.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'In case of backyard shenanigans. This lightweight Button-Up is a summer essential, made with a breezy cotton/linen blend that\'ll keep you looking (and feeling) cool
Summer-friendly organic cotton + linen blend
Collar neck, full button front
Subtle front pocket on the left

Machine wash cold. Tumble dry low.
70% Organic Cotton
30% Linen
GOTS Certified Made With Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023529, 'https://wearpact.com/men/apparel/pants%20&%20shorts/the%20backyard%20weekend%20short/wa1-myo-sas', 'The Backyard Weekend Short', 'https://static.wearpact.com/img/product/men/myo-sas-1-1682467178_thumb.jpg', 67.00, 0, now(), now(), 'Activewear', 'Pants & Shorts', 'In case of backyard shenanigans. The Weekend Shorts are our summer favorites, made with a breezy cotton/linen blend that\'ll keep you looking (and feeling) cool
Summer-friendly organic cotton + linen blend
Elastic waistband with drawcord
Two side pockets, one hidden back pocket
Faux fly
Relaxed fit, above the knee on most

Machine wash cold. Tumble dry low.
70% Organic Cotton
30% Linen
GOTS Certified Made With Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023530, 'https://wearpact.com/men/underwear/boxers%20&%20briefs/knit%20boxer%204-pack/wb4-mbx-sdz', 'Knit Boxer 4-Pack', 'https://static.wearpact.com/img/product/men/4-mbx-sdz-laydown-1-1683158233.jpg', 63.00, 0, now(), now(), 'Activewear', 'Boxers & Briefs', 'Made with soft, breathable organic cotton
Low-rise waist, relaxed fit
Extended leg for full coverage
Functional vertical button-fly
No-roll, smooth flat waistband
Tagless back

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023531, 'https://wearpact.com/men/underwear/boxers%20&%20briefs/knit%20boxers/wb1-mbx-sbi', 'Knit Boxers', 'https://static.wearpact.com/img/product/men/mbx-sbi-laydown-1-1683158234.jpg', 18.00, 0, now(), now(), 'Activewear', 'Boxers & Briefs', 'Made with soft, breathable organic cotton
Low-rise waist, relaxed fit
Extended leg for full coverage
Functional vertical button-fly
No-roll, smooth flat waistband
Tagless back

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023532, 'https://wearpact.com/men/underwear/boxers%20&%20briefs/boxer%20brief%204-pack/wb4-mbb-sdz', 'Boxer Brief 4-Pack', 'https://static.wearpact.com/img/product/men/4-mbb-sdz-laydown-1-1683158233.jpg', 63.00, 0, now(), now(), 'Activewear', 'Boxers & Briefs', 'Made with soft, breathable organic cotton
Low-rise waist, snug fit
No-roll, smooth flat waistband
Tagless back
Functional vertical fly

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023533, 'https://wearpact.com/men/underwear/boxers%20&%20briefs/boxer%20brief/wb1-mbb-lbi', 'Boxer Brief', 'https://static.wearpact.com/img/product/men/mbb-lbi-laydown-1-1683158233.jpg', 18.00, 0, now(), now(), 'Activewear', 'Boxers & Briefs', 'Made with soft, breathable organic cotton
Low-rise waist, snug fit
No-roll, smooth flat waistband
Tagless back
Functional vertical fly

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023534, 'https://wearpact.com/men/apparel/tops%20&%20shirts/field%20midweight%20slub%20crew/wa1-mbw-fnv', 'Field Midweight Slub Crew', 'https://static.wearpact.com/img/product/men/mbw-fnv-laydown-1-1684193270_thumb.jpg', 44.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'With a medium weight and premium fabric, the Field Crew is durable, breathable, and endlessly versatile. Don\'t you look ready for anything
Soft organic cotton with a touch of texture
Ribbed crewneck, short sleeves
Chest pocket on the left
Subtle side vents on the bottom hem

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023535, 'https://wearpact.com/men/apparel/tops%20&%20shirts/field%20midweight%20slub%20polo/wa1-mbp-gpl', 'Field Midweight Slub Polo', 'https://static.wearpact.com/img/product/men/mbp-gpl-laydown-1-1684192085_thumb.jpg',
                                    47.00, 0, now(), now(), 'Activewear', 'Tops & Shirts', 'With a medium weight and premium fabric, the Field Polo is durable, breathable, and endlessly versatile. Don\'t you look ready for anything
Soft organic cotton with a touch of texture
Collar neck with three-button placket
Plant-based corozo buttons
Chest pocket on the left
Subtle side vents on the bottom hem
Straight hem, short sleeves

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023536, 'https://wearpact.com/home/bath/bath%20sheets/luxe%20bath%20sheet%202-pack/wa2-hxs-wht', 'Spa Rib Hand Towel 2-Pack', 'https://static.wearpact.com/img/product/home/hxs8-whit-laydown-1-1670539715_thumb.jpg', 140.00, 0, now(), now(), 'Activewear', 'Bath', 'Includes 2 bath sheets, 2 hand towels, and 4 washcloths
This collection is soft, absorbent, and the perfect addition to any powder room
Made with combed, long-staple organic cotton from turkey
Clean-finish hem
All made from 100% organic cotton
Tumble dry low, machine wash cold
Gots certified made with organic cotton

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton', '');
insert into `shesg_product` values (255349023537, 'https://wearpact.com/home/bath/bath%20towels/luxe%20bath%20towel%202-pack/wa2-hxt-cem', 'Luxe Bath Sheet Set', 'https://static.wearpact.com/img/product/home/hxs8-cmnt-laydown-1-1670522829_thumb.jpg', 140.00, 0, now(), now(), 'Activewear', 'Bath', 'Includes 2 bath sheets, 2 hand towels, and 4 washcloths
This collection is soft, absorbent, and the perfect addition to any powder room
Made with combed, long-staple organic cotton from turkey
Clean-finish hem
All made from 100% organic cotton
Tumble dry low, machine wash cold
Gots certified made with organic cotton

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton', '');
insert into `shesg_product` values (255349023538, 'https://wearpact.com/home/bath/bath%20sheets/spa%20rib%20bath%20sheet%202-pack/wa2-hrs-rsa', 'Spa Rib Bath Sheet Set', 'https://static.wearpact.com/img/product/home/hrs8-cttn-laydown-1-1670524673_thumb.jpg', 140.00, 0, now(), now(), 'Activewear', 'Bath', 'Elevated, spa-like quality with classic cotton comfort. Cucumbers for the eyes not included
Made with combed, long-staple organic cotton from Turkey
Quick-drying ribbed fabric
Clean-finish hem
Includes 2 bath sheets

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton', '');
insert into `shesg_product` values (255349023539, 'https://wearpact.com/home/bath/bath%20towels/airy%20waffle%20bath%20towel%202-pack/wa2-hat-ibl', 'Airy Waffle Bath Sheet Set', 'https://static.wearpact.com/img/product/home/has8-inbl-laydown-1-1670514094_thumb.jpg', 140.00, 0, now(), now(), 'Activewear', 'Bath', 'Our lightest bath fabric yet. Think: breathable, quick-drying, and fluffed to perfection
Made with combed, long-staple organic cotton from Turkey
Clean-finish hem
Includes 2 bath towels

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton', '');
insert into `shesg_product` values (255349023540, 'https://wearpact.com/home/bath/bath%20towels/spa%20rib%20bath%20towel%202-pack/wa2-hrt-mnl', 'Spa Rib Bath Sheet Set', 'https://static.wearpact.com/img/product/home/hrs8-mnrl-laydown-1-1670528971_thumb.jpg', 140.00, 0, now(), now(), 'Activewear', 'Bath', 'Includes 2 bath sheets, 2 hand towels, and 4 washcloths
Elevated, spa-like quality with classic cotton comfort. cucumbers for the eyes not included
Made with combed, long-staple organic cotton from turkey
Quick-drying ribbed fabric
Clean-finish hem
All made from 100% organic cotton
Tumble dry low, machine wash cold
Gots certified made with organic cotton

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton', '');
insert into `shesg_product` values (255349023541, 'https://wearpact.com/home/bedding/duvet%20covers/favorite%20tee%20jersey%20duvet%20cover/wa1-hjd-chh', 'Favorite Tee Jersey Duvet Cover', 'https://static.wearpact.com/img/product/home/hjd-chh-1-1633723137_thumb.jpg', 120.00, 0, now(), now(), 'Activewear', 'Bedding', 'Soft with a little bit of stretch, just like your favorite tee
100% pure organic cotton jersey
Button closures featuring clear non-PVC plastic buttons
Ties in each corner to keep your duvet insert in place
Sweet Dreams Guarantee: 60-day, no-questions-asked return policy

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023542, 'https://wearpact.com/home/bedding/comforters%20&%20quilts/quilted%20comforter/wa1-hcq-wht', 'Quilted Comforter', 'https://static.wearpact.com/img/product/home/hcq-wht-1-1620935628_thumb.jpg', 240.00, 0, now(), now(), 'Activewear', 'Bedding', 'This modern quilt will have you falling asleep faster than you can say "organic cotton is awesome"
Medium weight by our standards, made to stand alone in the summer months and layer well in the winter
100% organic cotton sateen, 100% organic cotton fill, 100% cozy
"Sweet Dreams Guarantee": 60-day, no-questions-asked return policy

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023543, 'https://wearpact.com/home/bedding/duvet%20covers/room%20service%20sateen%20duvet%20cover/wa1-hsd-dov', 'Room Service Sateen Duvet Cover', 'https://static.wearpact.com/img/product/home/hsd-dov-1-1620413797_thumb.jpg', 140.00, 0, now(), now(), 'Activewear', 'Bedding', 'Get that hotel quality feeling without leaving home
100% pure organic cotton sateen
Silky, cool-to-the-touch fabric that resists wrinkling
Button closures featuring clear non-PVC plastic buttons
Ties in each corner to keep your duvet insert in place
Best Duvet Covers of 2020 | Sleep Foundation
Shams sold separately
Sweet Dreams Guarantee: 60-day, no-questions-asked return policy

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023544, 'https://wearpact.com/home/bedding/sheet%20sets/favorite%20tee%20jersey%20sheet%20set/wa1-hjs-smh', 'Favorite Tee Jersey Sheet Set', 'https://static.wearpact.com/img/product/home/hjs-smh-1-1670960946_thumb.jpg', 130.00, 0, now(), now(), 'Activewear', 'Bedding', 'Soft with a little bit of stretch, just like your favorite tee
100% pure organic cotton jersey
Includes one fitted sheet, one flat sheet, two pillowcases, and a reusable laundry bag
Fitted sheet: 15" deep pocket and wide elastic band for an easy fit
Twin and Twin XL include one pillowcase, all other sizes include two
King includes King-sized pillowcases; all other sizes include Standard-sized pillowcases
Sweet Dreams Guarantee: 60-day, no-questions-asked return policy

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023545, 'https://wearpact.com/home/bedding/sheet%20sets/cool-air%20percale%20sheet%20set/wa1-hps-cml', 'Cool-Air Percale Sheet Set', 'https://static.wearpact.com/img/product/home/hps-cml-1-1670947937_thumb.jpg',
                                    150.00, 0, now(), now(), 'Activewear', 'Bedding', 'As crisp as a button-down shirt, but cooler (literally)
Cool-to-the-touch fabric, perfect for hot sleepers
100% organic cotton
Includes one fitted sheet, one flat sheet, two pillowcases, and a reusable laundry bag
Fitted sheet: 15" deep pocket and wide elastic band for an easy fit
Twin and Twin XL include one pillowcase, all other sizes include two
King includes King-sized pillowcases; all other sizes include Standard-sized pillowcases
Sweet Dreams Guarantee: 60-day, no-questions-asked return policy

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023546, 'https://wearpact.com/home/bedding/sheet%20sets/room%20service%20sateen%20sheet%20set/wa1-hss-mkg', 'Room Service Sateen Sheet Set', 'https://static.wearpact.com/img/product/home/hss-mkg-1-1620414545_thumb.jpg', 130.00, 0, now(), now(), 'Activewear', 'Bedding', 'Get that hotel quality feeling without leaving home
100% pure organic cotton sateen
Silky, cool-to-the-touch fabric that resists wrinkling
Includes one fitted sheet, one flat sheet, two pillowcases, and a reusable laundry bag
Fitted Sheet: 15" deep pocket and wide elastic band for an easy fit
-Twin includes one pillowcase, all other sizes include two
-King includes King-sized pillowcases; all other sizes include Standard-sized pillowcases
Sweet Dreams Guarantee: 60-day, no-questions-asked return policy
Best Cotton Sheets of 2020 | Sleep Foundation

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023547, 'https://wearpact.com/kids/apparel/tops/everybody\'s%20friend%20graphic%20tee/wb1-tgt-hir', 'Everybody\'s Friend Graphic Tee', 'https://static.wearpact.com/img/product/kids/tgt-hir-laydown-1-1649189471.jpg', 7.99, 0, now(), now(), 'Activewear', 'Tops', 'Soft, breathable 100% organic cotton
Statement-making, friendly graphics
Lightweight, perfect for layering
Tagless back label to avoid any irritations or tag-tantrums
Prewashed fabric, shrink resistant

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023548, 'https://wearpact.com/kids/apparel/sleepwear/dream%20big%20pajamas%202-pack/wb2-tpj-lpm', 'Dream Big Pajamas 2-Pack', 'https://static.wearpact.com/img/product/kids/2-tpj-lpm-laydown-1-1649190251.jpg',
                                    19.00, 0, now(), now(), 'Activewear', 'Sleepwear', 'Little kids, big dreams!
Soft, breathable organic cotton
Banded cuffs at wrists and ankles ensure a stay-put fit
Comfy, pull-on waistband
Snug fit for safety and sweet dreams
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023549, 'https://wearpact.com/kids/apparel/underwear%20&%20socks/ankle%20socks%203-pack/wa3-kas-blk', 'Ankle Socks 3-Pack', 'https://static.wearpact.com/img/product/kids/kas-blk-laydown-1-1634680436.jpg',
                                    4.99, 0, now(), now(), 'Activewear', 'Underwear & Socks', 'Laundry made easy: look for 1 stripe on kids\' socks, 2 stripes on women\'s, and 3 stripes for the guys!
Hits a bit above the ankle
Made with durable, organic cotton yarn
Non-slip silicone grips on foodbed for Toddler sizes
Prewashed fabric, shrink resistant

Machine wash cold. Tumble dry low.
85% Organic Cotton
13% Nylon
2% Elastane
GOTS Certified Made With Organic Cotton', '');
insert into `shesg_product` values (255349023550, 'https://wearpact.com/kids/apparel/underwear%20&%20socks/crew%20socks%203-pack/wa3-kcw-blk', 'Crew Socks 3-Pack', 'https://static.wearpact.com/img/product/kids/kcw-blk-laydown-1-1634682951.jpg',
                                    4.99, 0, now(), now(), 'Activewear', 'Underwear & Socks', 'Laundry made easy: look for 1 stripe on kids\' socks, 2 stripes for women\'s, and 3 stripes for the guys!
Hits mid-calf
Durable organic cotton yarn
Non-slip silicone grips on foodbed for toddler sizes
Prewashed fabric, shrink resistant

Machine wash cold. Tumble dry low.
85% Organic Cotton
13% Nylon
2% Elastane
GOTS Certified Made With Organic Cotton', '');
insert into `shesg_product` values (255349023551, 'https://wearpact.com/kids/apparel/bottoms/somersault%20short%203-pack/wb3-kus-dfr', 'Somersault Short 3-Pack', 'https://static.wearpact.com/img/product/kids/kus-dfr-laydown-1-1649264496_thumb.jpg',
                                    8.99, 0, now(), now(), 'Activewear', 'Bottoms', 'Soft, breathable organic cotton
Perfect under skirts, dresses, or school uniforms
Comfy, smooth flat waistband
Tagless back label won\'t rub or irritate the skin
Prewashed fabric, shrink resistant

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023552, 'https://wearpact.com/kids/apparel/sleepwear/summer%20pajamas%202-pack/wb2-kup-dms', 'Summer Pajamas 2-Pack', 'https://static.wearpact.com/img/product/kids/2-kup-dms-laydown-1-1653574252.jpg', 19.00, 0, now(), now(), 'Activewear', 'Sleepwear', 'So comfortable, they just might sleep in this summer
Made with organic cotton ribbed fabric
Shirt features: crew neck, short sleeves
Short features: elastic waistband, extended length
Includes two sets; each with matching shirt and shorts

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023553, 'https://wearpact.com/kids/apparel/tops/everybody\'s%20friend%20tee%203-pack/wb3-kst-wcc', 'Everybody\'s Friend Tee 3-Pack', 'https://static.wearpact.com/img/product/kids/3-kst-wcc-laydown-1-1669738921_thumb.jpg', 15.00, 0, now(), now(), 'Activewear', 'Tops', 'You got a friend in tee
Soft, breathable organic cotton
Crew neck, short sleeves
Lightweight, perfect for layering
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023554, 'https://wearpact.com/kids/apparel/bottoms/classic%20leggings%203-pack/wb3-klg-mct', 'Classic Leggings 3-Pack', 'https://static.wearpact.com/img/product/kids/3-klg-mct-laydown-1-1649192939_thumb.jpg',
                                    15.00, 0, now(), now(), 'Activewear', 'Bottoms', 'The perfect leggings for nap time, playtime, and all the time in between
Soft, breathable organic cotton
Easy, pull-on stretch leggings
Comfy, stay-put waistband for a no-fuss fit
Ankle length
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
95% Organic Cotton
5% Elastane
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023555, 'https://wearpact.com/baby/apparel/tops/everybody\'s%20best%20friend%20graphic%20tee/wb1-bgt-god', 'Everybody\'s Best Friend Graphic Tee', 'https://static.wearpact.com/img/product/baby/bgt-god-laydown-1-1562785650.jpg', 3.99, 0, now(), now(), 'Activewear', 'Tops', 'Soft, breathable 100% organic cotton
Statement-making, friendly graphics
Lightweight, perfect for layering
Tagless back label won\'t rub or irritate the skin
Prewashed fabric, shrink resistant

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023556, 'https://wearpact.com/baby/apparel/tops/everybody\'s%20best%20friend%20graphic%20tee/wb1-bgt-lla', 'Everybody\'s Best Friend Graphic Tee', 'https://static.wearpact.com/img/product/baby/bgt-lla-laydown-1-1562785650.jpg', 3.99, 0, now(), now(), 'Activewear', 'Tops', 'Soft, breathable 100% organic cotton
Statement-making, friendly graphics
Lightweight, perfect for layering
Tagless back label won\'t rub or irritate the skin
Prewashed fabric, shrink resistant

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023557, 'https://wearpact.com/baby/apparel/bodysuits/short%20sleeve%20graphic%20bodysuit/wb1-bgs-dfu', 'Short Sleeve Graphic Bodysuit', 'https://static.wearpact.com/img/product/baby/bgs-dfu-laydown-1-1562785648.jpg',
                                    3.99, 0, now(), now(), 'Activewear', 'Bodysuits', 'Plant little seeds of inspiration with statement-making, friendly graphics
Soft, breathable organic cotton
Snaps at inseam for easy dressing and diapering
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023558, 'https://wearpact.com/baby/apparel/bodysuits/short%20sleeve%20graphic%20bodysuit/wb1-bgs-dru', 'Short Sleeve Graphic Bodysuit', 'https://static.wearpact.com/img/product/baby/bgs-dru-laydown-1-1562785649.jpg',
                                    3.99, 0, now(), now(), 'Activewear', 'Bodysuits', 'Plant little seeds of inspiration with statement-making, friendly graphics
Soft, breathable organic cotton
Snaps at inseam for easy dressing and diapering
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023559, 'https://wearpact.com/baby/apparel/bodysuits/short%20sleeve%20graphic%20bodysuit/wb1-bgs-hel', 'Short Sleeve Graphic Bodysuit

 ', 'https://static.wearpact.com/img/product/baby/bgs-hel-laydown-1-1562785650.jpg',
                                    3.99, 0, now(), now(), 'Activewear', 'Bodysuits', 'Plant little seeds of inspiration with statement-making, friendly graphics
Soft, breathable organic cotton
Snaps at inseam for easy dressing and diapering
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023560, 'https://wearpact.com/baby/apparel/bodysuits/short%20sleeve%20bodysuit%202-pack/wb2-bss-wht', 'Short Sleeve Bodysuit 2-Pack', 'https://static.wearpact.com/img/product/baby/bss-wht-laydown-1-1620339152.jpg', 6.99, 0, now(), now(), 'Activewear', 'Bodysuits', 'Soft, breathable organic cotton
Two-pack sets, perfect for mix and matching
Snaps at inseam for easy dressing and diapering
Tagless back label to avoid any irritations or tag-tantrums

Machine wash cold. Tumble dry low.
100% Organic Cotton
GOTS Certified Organic Cotton
Fair Trade Certified™ Factory', '');
insert into `shesg_product` values (255349023561, 'https://www.noah-shop.com/en/alessio.html', 'Vegan boots Alessio', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-vegan_shoes-_alessio_-boots_.jpg', 90.46, 0, now(), now(), 'Shoes', '', 'Comfort, quality and style come together in this sturdy men’s vegan boot.

you looking for a comfortable boot but don’t want to compromise on style? Look no further as Alessio is the perfect vegan boot for you. Its playful design contrasts microfibre faux leather and microsuede materials. Smart meets casual in this boot’s features brogue style perforations on the toe cap and a padded ankle collar. These contrasts add to the relaxed elegance of this wardrobe must-have.
Upper Material: micronappa and microsuede
Toe: rounded, microseude
Insole: lightly padded
Sole: stitched rubber
Wear Alessio out in town or on uneven terrain. Give your feet a break in these extremely comfortable boots on long revitalising walks through nature or on adventurous days out. Relax in style and wear them with jeans or dress them up with formal trousers should the occasion call for it.', '');
insert into `shesg_product` values (255349023562, 'https://www.noah-shop.com/en/ginevra.html', 'Vegan boot Ginevra', 'https://www.noah-shop.com/media/catalog/product/s/t/stivali-vegan_ginevra_nero_noah_1.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Vegan elegant and timeless knee-high boot

You are looking for a classic elegant and smart boot? Then you will surely like our leather-free knee-high boots Ginevra! The square heel provides more stability and the lateral zip fastening allows for an easy in and out of the boot. Ginevra is an absolutely timeless boot that you will enjoy for a very long time thanks to its high quality finishing.
Upper: soft, elastic micro suede
Insole: micro nappa
Outer sole: rubber
Fastening: lateral zipper on inner cuff
Heel: square, approx. 4 cm
Cuff height for size 37:  41 cm
Cuff circumference for size 37: 35 cm
Tip: almond-shaped
Fit: slim cut
Ginevra is ideal for a chic and elegant outfit, but also for a top-groomed casual look!', '');
insert into `shesg_product` values (255349023563, 'https://www.noah-shop.com/en/barcelona.html', 'Vegan hat Barcelona', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-italian_vegan_shoes-_barcelona_anlegerhut_damen-_schwarz_.jpg', 52.77, 0, now(), now(), 'Shoes', '', 'Wide-brimmed hat for women that protects from sun and rain

The summer season is on its way and with it all the essential items to take with you to the great outdoors. Such as this hat that reinterprets the classic fisherman’s bucket hat in a new, waterproof and slightly padded model with a wide brim, handy to have in your bag and wear whenever necessary.

•    Material: 100% polyester.
•    Size: one size.
•    Model: for women.
•    Brim width: 11 cm.
•    Washable at 30°C.

Lightweight and playful, suitable for chic, trendy women. What does it go with? A long romantic dress, cargo trousers or an unusual accessory such as a bum bag.', '');
insert into `shesg_product` values (255349023564, 'https://www.noah-shop.com/en/renata.html', 'Vegan flat boot Renata', 'https://www.noah-shop.com/media/catalog/product/v/e/veganer-stiefel-renata_taupe_noah_1.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Vegan comfortable knee-high boot

The vegan knee-high boot „Renata“ is a classic, timeless as well as comfortable model. The subtly ribbed outer sole enables a safe walk. Micro nappa and micro suede are both soft, elastic, and flexible upper materials. The zip fastening on the inside of the cuff allows for a quick in and out of the boot.
Upper: soft, elastic micro nappa (black) / micro suede (taupe)
Insole: micro nappa
Outer sole: subtly ribbed rubber sole
Fastening: zip fastening on the inside of the cuff
Heel: approx. 2,5 cm
Cuff height for Ladies size 37:  41 cm
Cuff width for Ladies size 37:  36 cm
Combine Renata with tight-fitting jeans or an elegant skirt – whether with your office or day-to-day outfit, our leatherfree, knee-high boot "Renata" makes you look phenomenal!', '');
insert into `shesg_product` values (255349023565, 'https://www.noah-shop.com/en/romina.html', 'Vegan ankle boot for women Romina', 'https://www.noah-shop.com/media/catalog/product/v/e/vegan_multicolor_bootie_noah-1.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Vegan block heel ankle boots, classic or stylish

For all women who like a classic and elegant look, our leather-free ankle boot Romina with its 8,5 cm block heel is exactly the right model to color your days this fall and winter. The lateral zip fastening enables an easy and fast in and out of the boot. And those who like to bring a bit of color and joyfulness into the grey fall and winter days make the right decision with this multicolor design.
Upper: soft, elastic micro suede (blue) and suede (multicolor)
Insole: micro nappa
Outer sole: rubber, slightly grooved
Fastening: lateral zip fastening on the inside of the cuff
Heel: approx. 8,5 cm
Tip: almond-shaped
Our ankle boot Romina gives you a big variety of possible combinations: whether with long or short skirts, slim fit or regular pants, dress pants or jeans ... you can’t go wrong with Romina!', '');
insert into `shesg_product` values (255349023566, 'https://www.noah-shop.com/en/bettina.html', 'Vegan lined ankle boot Bettina', 'https://www.noah-shop.com/media/catalog/product/b/e/bettina_stivaletto_invernale_noah-italian_vegan_shoes_.jpg', 171.23, 0, now(), now(), 'Shoes', '', 'warm women\'s boot for the whole winter.

Want to get the 90’s look? Bettina is a vegan bootie perfect for those nostalgic for the 90’s. Make a statement and make Bettina your new winter favourite. Eye-catching detail of contrasting microsuede and microfibre materials make this boot a striking choice. This stylish winter lace-up provides comfort and warmth through its a side zipper and soft, faux fur padding.
Material: micronappa and microsuede
Toe: rounded
Insole: microfibre
Sole: rubber
Sole height: approx. 2 cm
Heel height: approx. 3.5 cm
Spruce up your outfit and go more feminine with Bettina by combing them with a bon ton jacket, a short skirt and opaque tights. Stand out by pairing Bettina with a bomber jacket and a longuette skirt to get the ultimate 90’s look.', '');
insert into `shesg_product` values (255349023567, 'https://www.noah-shop.com/en/eva.html', 'Vegan women\'s bootie Eva', 'https://www.noah-shop.com/media/catalog/product/v/e/vegan_sneaker_boot_black_noah.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Vegan comfortable women´s boots

Extraordinary in its nubs design while absolutely stylish and trendy for the coming fall and winter season is our vegan ankle boot Eva. The soft and stretchy synthetic upper material is wonderfully comfortable, soft as a glove. Eva’s rubber outer sole with its distinctive profile guarantees it to be non-slip and is reminiscent for the comfort of a sneaker.
Upper: breathable synthetic fabric
Insole: micro nappa
Outer sole: strikingly jagged platform sole of aprrox. 3cm, rubber
Eva peps up each piece of clothing, that’s for sure - whether worn with jeans, leggins or a skirt. With Eva you are on the fashionably trendy side!', '');
insert into `shesg_product` values (255349023568, 'https://www.noah-shop.com/en/valentino-run-n010.html', 'Vegan double monk Valentino', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-_vegan_shoes-luxury_herrenschuh-_valentino_suede_blue.jpg', 214.31, 0, now(), now(), 'Shoes', '', 'Sporty elegant business shoe with stylish design

The classic monk shoe is an elegant alternative to the classic lace-up. Its sophisticated design with adjustable straps and pin buckles turns heads. The soft microsuede and smooth micronappa inner lining ensure first-class comfort. The sole is finished off with a stitched Vibram outsole. It’s striking design cultivates a high sense of style and sets new trends. The perfect choice for anyone looking to add that extra something to their look. Just like all of the shoes in the NOAH Luxury Collection, Valentino is vegan and embodies the exquisite craft of our skilled Italian shoe makers. Heel height: 3cm', '');
insert into `shesg_product` values (255349023569, 'https://www.noah-shop.com/en/tamara-razza.html', 'Vegan moccassin Tamara Razza', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-_italian_vegan_shoes-tamara_razza_gr_n-mocassin-.jpg', 74.31, 0, now(), now(), 'Shoes', '', 'Incredibly soft and lightweight moccasins made from microsuede with a stingray leather finish. Raised heel, microsuede lining and removable insole. Flexible nubbed rubber outsole giving you extra confidence and comfort.

Incredibly soft and lightweight moccasins made from microsuede with a stingray leather finish. Raised heel, microsuede lining and removable insole. Flexible nubbed rubber outsole giving you extra confidence and comfort.', '');
insert into `shesg_product` values (255349023570, 'https://www.noah-shop.com/en/lorenzo-n014.html', 'Vegan sneaker Lorenzo', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-vegan_shoes-_luxury_lorenzo_-brown_boots_.jpg', 253.08, 0, now(), now(), 'Shoes', '', 'Smart casual boots for the office or everyday. A seasonal must-have with with contrasting designs of vegan microsuede and micronappa. Comfortable fit with adjustable Velcro straps and smooth micronappa lining. Removable soft insoles, stitched synthetic soles and non-slip heels. Colour: light and dark brown Colour: black with royal blue stitching

Just as you like them: men’s sneakers. Handcrafted in Italy with love and attention to detail. The high quality of these sneakers sets these sneakers apart. These business boots set off casual and chic tones in any outfit. Made from vegan microsuede with charming contrasted vegan micronappa detail. Adjustable velcro straps help shape this sneaker to the contours of your foot. Soft and comfy inner lining and a removable insole are made vegan micronappa. The shoe comes with a soft removable extra insole. Its light padding at the heel and fabric coating at the front provide extra comfort. The stitched synthetic outsole and non-slip heels make this shoe a reliable and comfy choice. Colours: Light and dark brown, black with royal blue stitching.', '');
insert into `shesg_product` values (255349023571, 'https://www.noah-shop.com/en/valeria-63625.html', 'Vegan Chelsea-Boots Valeria', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-_italian_vegan_shoes-_valeria_chelsea_boot.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Casual-Chic, classic Chelsea boots, Made from vegan micronappa

High-quality vegan Chelsea boot made from smooth vegan micronappa, perfect for autumn and winter months – a classic wardrobe must-have. The quality of the Made in Italy brand combined with striking design. Easy-on elasticated inserts guarantee the perfect fit. A comfortable and durable sole provides extra protection from the cold and wet.
Material: micronappa
Toe: rounded
Removable insole: micronappa
Sole: rubber
Heel height: 2 cm
Get the office-chic look and combine with cigarette trousers or get comfy and pair with leggings and a large jumper. Keep it casual and wear VALERIA with a classic 60’s style skirt. Strut your stuff this autumn with these classic Chelsea boots.', '');
insert into `shesg_product` values (255349023572, 'https://www.noah-shop.com/en/beatrice.html', 'Vegan bootie Beatrice', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-_italian_vegan_shoes-_beatrice_-schwarz_stiefelette_.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Elegant high-heeled vegan zip-up bootie!

This elegant black chic boot is glamorous and eye catching. The contrasting soft microsuede and PVC leather-look micronappa make this boot stand out from the rest. With a pointed toe and a stiletto heel your feet will become striking, fashionable statement. Enjoy wearing these boots with anything. Slip easily into them with their practical side zip. Lined with soft and smooth micronappa the lining will take care of your feet, especially the comfortable sewn-in padded heel. With a high-quality rubber sole. Beatrice is the perfect shoe for you…and they’re just one click away.
Upper Material: microsuede and faux patent leather.
Sole: flexible rubber.
Insole: micronappa.
Toe: tapered.
Heel: 9 cm
Wear with a tight skirt for cool office chic. Why not combine Viola with wide trousers or dress them up with an asymmetrical dress on a romantic evening date.
 ', '');
insert into `shesg_product` values (255349023573, 'https://www.noah-shop.com/en/rebecca.html', 'Vegan ankle boot Rebecca', 'https://www.noah-shop.com/media/catalog/product/v/e/vegan_boot_rebecca_black_noah.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Comfortable vegan all-rounder ankle bootie with a side zip

Our leather-free ankle boot „Rebecca“ is chic, timeless, and offers a high wear comfort. Delicate ornamental seams on the arch as well as the heel decorate the upper. Superb fit on each foot thanks to the flexible upper material. The sewn in insole is made of smooth micro nappa and padded at the heel.
Upper: micro nappa (black) / micro suede (brown and blue)
Insole: micro nappa
Outer sole: delicately ribbed rubber sole
Fastening: zip fastening on the inside of the cuff
Heel: approx. 2,5 cm
Upgrade your business as well as your leisure outfits with „Rebecca“! The elegant, yet subtle design makes it easy in its straightforwardness to compose your very own favorite style.', '');
insert into `shesg_product` values (255349023574, 'https://www.noah-shop.com/en/lucia-1.html', 'Vegan women\'s bootee Lucia', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-_italian_vegan_shoes-_lucia_boot.jpg', 138.93, 0, now(), now(), 'Shoes', '', 'Lucia - stylish vegan bootee

Lucia winter vegan boots ideal for the cold season ahead. Featuring a comfortable block heel and side zip, this boot is easy to slip into and will keep your feet protected from the wet weather.
Material: micronappa
Insole: micronappa
Sole: rubber
Heel height: 6 cm
Toe: almond-shaped
Fit: narrow cut
Create the perfect tone-on-tone look for the office and match with classic cigarette trousers and a shirt or dress them up as evening wear and combine with a ruffled shirt or skirt.', '');
insert into `shesg_product` values (255349023575, 'https://www.noah-shop.com/en/lissandro.html', 'Vegan Tassel Loafer Lissandro', 'https://www.noah-shop.com/media/catalog/product/l/i/lissandro_vegan_tassel_loafer_for_men-_by_noah_italian_vegan_shoes_.jpg', 159.39, 0, now(), now(), 'Shoes', '', 'Lissandro - vegan Tassel Loafers in black. This shoes are ideal for any dress code.

Can a moccasin become a stylish accessory without sacrificing comfort? Yes, Lissandro, the vegan Tassel Loafer can: the model that revisits a classic shoe thanks to the hand sewing, the slender silhouette and the decorative tassels.
Upper: Micronappa.
Insole: microfibre.
Sole: black in vegan rubber.
Colour: black.
An unconventional model to wear in your free time or in a formal context. Worn with a pair of jeans, twill trousers or a blazer, they will complete your look impeccably while being environmentally friendly. NOAH recommends pairing them with the cinta black matt', '');
insert into `shesg_product` values (255349023576, 'https://www.noah-shop.com/en/nina-nino.html', 'Vegan winter boot Nina & Nino', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-vegan_shoes-_nina-nino_black-_unisex_boots__1.jpg', 128.16, 0, now(), now(), 'Shoes', '', 'High unisex sneakers with warm inner lining

Unisex high-tops perfect for winter. Keep your feet warm and cosy with these leather-free lined sneakers, ideal for the colder months! Nina & Nino features upper material made from water-resistant vegan micronappa, a reinforced toe cap that protects against moisture and dirt, and a stitched outsole – a much needed combination for winter. Sides made from easy-caring, matching microsuede give this sneaker its peppy look. The reinforced heel along with a side zipper and laces make for a comfy adjustable fit.
Upper Material: Micronappa & Microsuede
Toe: rounded with toe cap
Insole: lightly padded and removable
Lining: soft faux fur inner lining
Sole: stitched rubber, approx. 3 cm
Nino & Nina is the vegan winter boot for all women and men who like it casual and easygoing. It can be combined with all types of jeans, but also cut a good figure with stretch or cargo trousers!', '');
insert into `shesg_product` values (255349023577, 'https://www.noah-shop.com/en/luca.html', 'Vegan slip-on Luca', 'https://www.noah-shop.com/media/catalog/product/l/u/lucca_vegan_shoes_noah.jpg', 106.62, 0, now(), now(), 'Shoes', '', 'Sportlich-eleganter Halbschuh mit elastischer "Schnürung" und flexibler leichter Sohle.

This extremely comfortable shoe is a season’s must-have for those cooler months. Featuring a flexible sole, Luca will keep your feet warm and dry. A stylish combination of two premium vegan materials and bungee laces, this shoe blends high-quality comfort and support with a modern touch.
Upper material: microsuede and micronappa
Toe: rounded
Insole: removable, padded, perforated
Sole: stitched lightweight rubber
Fit: true to size
If you’re looking for a comfy off-duty moccasin then Luca is the shoe for you this season. Go casual and combine with cargo trousers or dress them up with chic velvet trousers.', '');
insert into `shesg_product` values (255349023578, 'https://www.noah-shop.com/en/carlotta.html', 'Vegan lace-up booties Carlotta', 'https://www.noah-shop.com/media/catalog/product/n/o/noah_vegan_boot_carlotta_brown.jpg', 160.47, 0, now(), now(), 'Shoes', '', 'The peppy design of the laces and side zipper add character and chic while providing an adjustable fit.

Elegant and comfortable, Carlotta is the ideal NOAH winter vegan bootie. Featuring laces on the front and a side zip to ensure the perfect fit, Carlotta is this season’s must-have boot for the colder months. Made from easy care microsuede, these boots come with a lightly cushioned insole and a microsuede covered heel. Expect extreme comfort and the perfect fit.
Upper material: microsuede
Sole: rubber
Insole: micronappa
Toe: rounded
Heel height: 5 cm
Carlotta will become a trusty wardrobe staple this winter, keeping your feet toasty warm! Combine with a mid-length dress, a wrap coat or a flared jacket.', '');
insert into `shesg_product` values (255349023579, 'https://www.noah-shop.com/en/martina.html', 'Vegan bootie Martina', 'https://www.noah-shop.com/media/catalog/product/n/o/noah-_italian_vegan_shoes-_martina_-_boot.jpg', 138.93, 0, now(), now(), 'Shoes', '', 'Inspired by the Chelsea boot, our vegan Martina is a modern take on a classic boot. Handcrafted with side elastic side inserts for a high-quality comfort fit.

Inspired by the Chelsea boot, our vegan Martina is a modern take on a classic boot. Handcrafted with side elastic side inserts for a high-quality comfort fit, Martina is suitable for all foot types and set on a chunky block heel to provide support. Delicate fluid stitching and an elegant offset insert create personality and ultimate feminine chic.
Upper material: micronappa
Toe: slender and levelled off
Insole: padded
Sole: contoured
Shaft height: approx. 14 cm
Heel height: 4 cm
Martina is your autumn wardrobe staple and perfect on most occasions. Combine with high-waisted 7/8 trousers, a long tulle skirt or an lightweight coat.', '');
insert into `shesg_product` values (255349023580, 'https://www.noah-shop.com/en/claude.html', 'Vegan winter boots Claude', 'https://www.noah-shop.com/media/catalog/product/c/l/claudi_claudio_unisex_faux_fur_brown_boots-_by_noah_.jpg', 171.23, 0, now(), now(), 'Shoes', '', 'Lined vegan boots for all weathers, stable, sporty in microsuede and micronappa.

What would a winter be like without a cozy up, faux fur lined boots? Claude are breathable, water-repellent, soft to the touch and guarantee a good grip on the ground thanks to their non-slip sole and reinforced heel.
Outer material: Microsuede and micronappa
Interior: Synthetic fur
Insole: removable
Outsole: profiled, made of recycled materials
Closing: laces
Collar: soft, padded to the ankle
Sole thickness: approx. 2 cm,
Heel: 3.5 cm
The feminine model goes perfectly with slim jeans, jackets and wide coats, as well as more classic outfits. The men\'s model can be worn with cargo pants and a tartan shirt or with a knitwear and a classic shirt for more formal occasions or at the office. No matter what outfit you choose, your feet will be warm and well protected.', '');
insert into `shesg_product` values (255349023581, 'https://consciousstep.com/collections/all/products/socks-that-protect-koalas', 'socks that save koalas', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MAWW001_4_204c1867-4b63-4639-97e4-f94f7f22354f_540x.jpg?v=1680011973', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Say g’day and g’nite to this sleeping koala pair! Represent your favorite animal or your love of naps, and feel all warm and fuzzy knowing you helped save these lovable endangered creatures.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India

', '');
insert into `shesg_product` values (255349023582, 'https://consciousstep.com/collections/all/products/squidward-socks-that-protect-oceans', 'squidward socks that protect oceans', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mnic003-1_540x.jpg?v=1669738300', 16.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'You don\'t have to have kelp-for-brains to know Squidward is Bikini Bottom\'s king of sarcasm.. We channeled that energy into this pair of turquoise Squidward socks that are perfect for grumpy days.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023583, 'https://consciousstep.com/collections/all/products/socks-that-protect-dolphins', 'socks that protect dolphins', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MOCE008_2_540x.jpg?v=1680011491', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'These fin flipping dolphins add a splash of fun to every fit! Share the love and get pairs for your whole pod.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023584, 'https://consciousstep.com/collections/all/products/spongebob-socks-that-protect-oceans', 'spongebob socks that protect oceans', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mnic001-1_540x.jpg?v=1669738273', 16.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Are you ready? Aye Aye Captain! Take these for a spin aroooound town and serve up smiles in our bright yellow SpongeBob pair.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023585, 'https://consciousstep.com/collections/all/products/socks-that-protect-our-planet-1', 'socks that protect our planet', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mdis003_1_540x.jpg?v=1675281684', 16.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'For the ones whose dreams go far beyond our atmosphere. Let your imagination soar with these Saturn, star and rocket socks that are as black as the galaxy’s edge.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India
', '');
insert into `shesg_product` values (255349023586, 'https://consciousstep.com/collections/all/products/socks-that-protect-our-planet', 'socks that protect our planet', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mdis001-2_540x.jpg?v=1675280181', 16.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'The mountains are calling! Adventure into woodland nights under the light of a neon moon with this retro teal pair.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023587, 'https://consciousstep.com/collections/all/products/socks-that-protect-our-planet-2', 'socks that protect our planet', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mdis002_540x.jpg?v=1675280258', 16.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Take a dive 20,000 leagues under the sea to swim with sharks and explore incredible ocean ecosystems with this navy, deep-sea style.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023588, 'https://consciousstep.com/collections/all/products/socks-that-protect-oceans-1', 'socks that protect oceans', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MOCE007_a5755c2e-e74d-4717-bb4c-1cbb953130df_540x.jpg?v=1652101794', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Make waves supporting healthy oceans! Everyone loves the beach whether you’re landlocked or on the coast, so represent that love and restore our ocean’s beauty in this iconic pair. These socks feature crashing waves in shades of blue and an Oceana logo embroidery.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023589, 'https://consciousstep.com/collections/all/products/socks-that-protect-elephants-2', 'socks that protect elephants', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mcon016-3_540x.jpg?v=1680012005', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Start a stampede! This unforgettable gray pair features electric orange and bright blue elephants and elephant embroidery.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023590, 'https://consciousstep.com/collections/all/products/socks-that-protect-toucans', 'socks that protect toucans', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MCON013N_1_540x.jpg?v=1680011027', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'For those days you need a reminder that toucan do it! Our light blue tropical forest socks feature palms and toucans in green, black, white, and orange, plus a toucan embroidery.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023591, 'https://consciousstep.com/collections/all/products/socks-that-protect-macaws', 'socks that protect macaws', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MCON012_3_540x.jpg?v=1680011527', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Take the tropics with you wherever you go in this blue pair that’s almost as colorful as our favorite forest flier.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023592, 'https://consciousstep.com/collections/all/products/socks-that-protect-sloths', 'socks that protect sloths', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/mcon009n_540x.gif?v=1680013099', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Let the world know you love to take it sloooow. This adorable gray jungle sloth pair is perfect for days you’re just hanging out.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023593, 'https://consciousstep.com/collections/all/products/mental-health-ankle-socks', 'socks that support mental health', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/Conscious_Step_r1_1039_540x.jpg?v=1628287411', 12.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Walk on clouds in these super-soft ankle socks! These blue pairs are as calming and cozy as they look, featuring pillowy clouds and sunshine embroidery.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023594, 'https://consciousstep.com/collections/all/products/pride-ankle-socks', 'socks that save lgbtq lives', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/AMLGB0012_540x.jpg?v=1669225689', 12.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Everyone deserves to be proud! Stand with LGBTQ youth in these gray ankle socks featuring a vibrant rainbow pattern and a rainbow flag embroidery.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023595, 'https://consciousstep.com/collections/all/products/socks-that-protect-turtles-ankle', 'socks that protect turtles', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/AMOCE001_e68afc9b-7f5f-43e8-b269-ca354fe70f61_540x.jpg?v=1652103404', 12.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Step out of your shell and into these turtle ankle socks that protect oceans! Featuring green turtles happily swimming along in the dark blue with a turtle embroidery, this pair is perfect for all animal and ocean lovers.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023596, 'https://consciousstep.com/collections/all/products/socks-that-save-cats-3', 'socks that save cats', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/amcat001_1_540x.jpg?v=1675878428', 12.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'This pair is the cat’s meow, an all-time best-seller, a style icon… we could go on and on. But the truth really is that your sock drawer needs this gray cat print pair.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023597, 'https://consciousstep.com/collections/all/products/lgbtq-lives', 'socks that save lgbtq lives', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MLGB0042_540x.jpg?v=1669226178', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Wear the colors of pride all year long with our one and only asymmetrical pair! Just like you, this unique pair has half the rainbow on one side and half on the other. Why fit in when you were born to stand out?

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023598, 'https://consciousstep.com/collections/all/products/socks-that-save-cats-2', 'socks that save cats', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MCAT003_540x.jpg?v=1668543391', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'You’re in luck if these black cat socks cross your path. They’re as soft and sweet as kittens can be!

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 80% Fairtrade Organic Cotton, 18% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023599, 'https://consciousstep.com/collections/all/products/socks-for-mental-health', 'socks that support mental health', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MNAM001_540x.jpg?v=1666712701', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'These fluffy blue cloud socks are as cozy as they look, supporting mental health and featuring sunshine embroidery.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023600, 'https://consciousstep.com/collections/all/products/socks-that-protect-lgbtq-lives-rainbow', 'socks that save lgbtq lives', 'https://cdn.shopifycdn.net/s/files/1/0275/1277/products/MLGB0062_540x.jpg?v=1669226430', 14.95, 0, now(), now(), 'Basics & Intimates', 'socks', 'Somewhere over the rainbow, dreams do come true. Our dream is that LGBTQ youth always feel loved, accepted, and celebrated for who they are. These gray rainbow socks are helping make that dream a reality.

• Fairtrade, GOTS, and Vegan Certified
• Terry padding for comfort
• Machine wash cold. Do not Bleach. Tumble dry Low. Do not Iron.
• 75% Fairtrade Organic Cotton, 23% Recycled Polyester, 2% Elastane
• Made in India', '');
insert into `shesg_product` values (255349023601, 'https://thesusoutdoors.com/collections/all/products/anyday-rainboot-in-black', 'Anyday Rainboot In Black', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/MacBookPro16_-3_1280x.jpg?v=1681506190', 213.46, 0, now(), now(), 'Shoes', 'Anyday Rainboot In Black', 'This essential waterproof chelsea is not your typical rain boot. It is better than a rain boot. Wear them any day, all day, even when it’s not raining. Each pair is sustainably made with recycled rubber and takes 1.4 Kg out of our landfill and waterways

→ Handmade. Made in a family run factory in Portugal.

→ Waterproof and easy to clean made with 100% recycled rubber upper.

→ Versatile ankle height for maximum wearability around town. .

→ Grippy all season lug sole made from 45% recycled rubber.

→ Sweat-wicking lining made from 100% recycled nylon.

→ Comfy memory foam insole makes you feel like you are walking on a cloud.

→ Easy on and off with pull tabs and stretch side panels made with recycled nylon. .', '');
insert into `shesg_product` values (255349023602, 'https://thesusoutdoors.com/collections/all/products/the-scarlet-weekend-boot', 'New In - The Scarlet Weekend Boot', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/0006400_1280x.jpg?v=1676454393', 202.25, 0, now(), now(), 'Shoes', 'New In - The Scarlet Weekend Boot', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023603, 'https://thesusoutdoors.com/collections/all/products/the-marlin-weekend-boot', 'New In - The Marlin Weekend Boot', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/blue_1280x.jpg?v=1676454595', 202.25, 0, now(), now(), 'Shoes', 'New In - The Marlin Weekend Boot', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Temperature control lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city..

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023604, 'https://thesusoutdoors.com/collections/all/products/simone-weekend-boot', 'New In - The Simone Weekend Boot', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/0006425_1280x.jpg?v=1676454310', 202.25, 0, now(), now(), 'Shoes', 'New In - The Simone Weekend Boot', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Temperature control lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city..

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023605, 'https://thesusoutdoors.com/collections/all/products/the-farrah-weekend-boot', 'New In - The Farrah Weekend Boot', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Farrahweekendboot_1280x.jpg?v=1676454218', 202.25, 0, now(), now(), 'Shoes', 'New In - The Farrah Weekend Boot', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Temperature control lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city..

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023606, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-allegra', 'The Limited Edition Allegra Weekend Boot', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1-The-Weekend-Boot-Allegra-Alice_Whittles-2000x2000_1280x.jpg?v=1632758527', 202.25, 0, now(), now(), 'Shoes', 'The Limited Edition Allegra Weekend Boot', 'The boot that sold out 5 times last year is back! The Allegra’s are the essential outdoor boot to go on a hike, foraging, running errands in the city, and more. The comfort, versatility, and style of The Weekend Boot lets you be outside cozy all year, comfy all day, and can be worn with anything.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023607, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-beige', 'The Weekend Boot Beige', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1TheWeekendBoot-Beige-Alice_Whittles-2000x2000_1_1_28a57c1c-2208-4acd-85df-fe1990864c14_1280x.jpg?v=1633353330', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot Beige', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023608, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-in-black', 'The Weekend Boot in Black', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1TheWeekendBoot-Black-Alice_Whittles-2000x2000_1_1_2000x_eb0f14e1-2dbd-4aa5-ac2d-6c1149f27955_1280x.jpg?v=1633352989', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot in Black', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Temperature control lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city..

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023609, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-in-sage', 'The Weekend Boot in Sage', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1TheWeekendBoot-Beige-Alice_Whittles-2000x2000_1_1_2000xcopy_0ca5ba97-dd52-495d-bfdd-bfb3fa2f7ab2_1280x.jpg?v=1633353133', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot in Sage', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park, or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023610, 'https://thesusoutdoors.com/collections/all/products/thesus-the-weekend-boot-in-indigo', 'The Weekend Boot in Indigo', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/FallWinter_2021_Product-1332_1280x.jpg?v=1668116019', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot in Indigo', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Temperature control lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city..

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023611, 'https://thesusoutdoors.com/collections/all/products/thesus-the-weekend-boot-in-navy', 'The Weekend Boot in Navy', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/FallWinter_2021_NavyBlue-1323_9c45bdb9-80ed-4462-a913-5da863d40dfb_1280x.jpg?v=1635148527', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot in Navy', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Temperature control lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city..

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023612, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-in-cuero', 'The Weekend Boot in Cuero', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/FallWinter_2021_Product-1801_1280x.jpg?v=1668116118', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot in Cuero', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park, or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023613, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-classic-black', 'The Weekend Boot Classic Black', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1-The-Weekend-Boot-BlackonBlack-Alice_Whittles-2000x2000_2_83ec888d-edde-4933-9023-fc4dcbf662e4_1280x.jpg?v=1633353544', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot Classic Black', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023614, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-classic-brown', 'The Weekend Boot Classic Brown', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1-The-Weekend-Boot-BlackBrown-Alice_Whittles-2000x2000_558e5d5b-81e8-4002-b36c-6379b6a1dab7_1280x.jpg?v=1668115927', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot Classic Brown', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023615, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-classic-sage', 'The Weekend Boot Classic Sage', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/Image-1-The-Weekend-Boot-BlackonSage-Alice_Whittles-2000x2000FLATTENED2_1_c108be71-c6e3-4bf6-a300-d27e2c9e9e03_1280x.jpg?v=1633353818', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot Classic Sage', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023616, 'https://thesusoutdoors.com/collections/all/products/thesus-the-weekend-boot-z-in-grey', 'The Weekend Boot Z in Grey', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/02_TheWeekendBootZ_Grey_Sustainble_Vegan_2000x2000_c6367af4-64da-42fb-b754-affedbaf5360_1280x.jpg?v=1636413353', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot Z in Grey', 'It’s our bestselling boot - but upgraded. Be anywhere and do anything, in a boot that does it all. The Z is made with a water resistant upper, extra warm lining and grippy rubber sole. Featuring an inside zip that makes it easy to slip them on-and-off for life on the go. And the best part - each pair is 100% vegan and made with 95% natural and recycled materials.

→ Easy on and off. Inner zip for quick on-and-off.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Extra warm lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023617, 'https://thesusoutdoors.com/collections/all/products/thesus-the-weekend-boot-z-in-black', 'The Weekend Boot Z in Black', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/02_TheWeekendBootZ_Grey_Sustainble_Vegan_2000x2000_1_1280x.jpg?v=1636413538', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot Z in Black', 'It’s our bestselling boot - but upgraded. Be anywhere and do anything, in a boot that does it all. The Z is made with a water resistant upper, extra warm lining and grippy rubber sole. Featuring an inside zip that makes it easy to slip them on-and-off for life on the go.

→ Easy on and off. Inner zip for quick on-and-off.

→ Handmade. Made in a family run factory in Portugal.

→ Made for outdoor terrain. Seam-sealed water-resistant upper, anti-slip rubber lug sole, and temperature control lining.

→ Water-resistant upper.

→ Anti-slip lug sole.

→ Extra warm lining.

→ Versatile. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Easy to clean. Spot clean with warm water.

→ Absorbs traction. A 2" natural rubber heel to cushion long days on your feet.', '');
insert into `shesg_product` values (255349023618, 'https://thesusoutdoors.com/collections/all/products/the-weekend-boot-new-classic-brown', 'The Weekend Boot New Classic Brown', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/2021_Weekend_Boot_Women_Vegan_Susaintable_Brown_Red_Laces_57edf402-a997-4df6-82a4-6d42bef093f5_1280x.jpg?v=1643648177', 202.25, 0, now(), now(), 'Shoes', 'The Weekend Boot New Classic Brown', 'The Weekend Boots are vegan and sustainably made with over 95% natural and recycled materials. They keep you cozy and dry all year and comfy all day. Their minimalist design is made to take you wherever your day ends up - on a trail, in the park or at brunch, they’ve got you covered.

→ Handmade in a family run factory in Portugal.

→ Made with a seam-sealed water resistant upper, anti-slip rubber lug sole and temperature control lining.

→ Includes a removable gel insole made to absorb traction and contour to your feet.

→ We made these boots with versatility in mind. Wear them walking in the park, on a trail, brunch or errands in the city.

→ Spot clean with warm water. It\'s that simple.

→ A 2" heel to absorb the traction of everyday wear.

→ 3 lbs per pair.', '');
insert into `shesg_product` values (255349023619, 'https://thesusoutdoors.com/collections/all/products/terrus-sage', 'The Terrus in Sage', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/1_EverydaySlipOn-1062_731b4149-bbc2-4016-9892-a28fbbcfd0c7_1280x.jpg?v=1633354701', 140.98, 0, now(), now(), 'Shoes', 'The Terrus in Sage', 'The Terrus is a thoughtfully designed clog, made for the outdoors. Wear them around the city on a light hike, or sitting around by the lake with a book in hand. Just throw them on and stay easy, cool and comfy all day.

→ Handmade. Made in a family run factory in Portugal.

→ Comfy. Molded cork footbed, wide toe box, arch support and soft lining.

→ Made for the outdoors. Grippy rubber sole, sweat wicking lining, adjustable traps.

→ Versatile. The Terrus makes just as much sense in the city, as it does by the lake. Their versatile design makes them easy to wear with any outfit.

→ Easy to clean. Spot clean with warm water.', '');
insert into `shesg_product` values (255349023620, 'https://thesusoutdoors.com/collections/all/products/terrus-beige', 'The Terrus in Beige', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/1_EverydaySlipOn-1071_82388c86-6e51-4705-8176-bf29314f88a1_1280x.jpg?v=1633354793', 140.98, 0, now(), now(), 'Shoes', 'The Terrus in Beige', 'The Terrus is a thoughtfully designed clog, made for the outdoors. Wear them around the city on a light hike, or sitting around by the lake with a book in hand. Just throw them on and stay easy, cool and comfy all day.

→ Handmade. Made in a family run factory in Portugal.

→ Comfy. Molded cork footbed, wide toe box, arch support and soft lining.

→ Made for the outdoors. Grippy rubber sole, sweat wicking lining, adjustable traps.

→ Versatile. The Terrus makes just as much sense in the city, as it does by the lake. Their versatile design makes them easy to wear with any outfit.

→ Easy to clean. Spot clean with warm water.', '');
insert into `shesg_product` values (255349023621, 'https://thesusoutdoors.com/collections/all/products/terrus-allegra', 'The Terrus in Allegra', 'https://cdn.shopifycdn.net/s/files/1/0665/2889/products/1_EverydaySlipOn-1064_d52e8897-7daa-421f-b236-534ecb7125fc_1280x.jpg?v=1633354853', 140.98, 0, now(), now(), 'Shoes', 'The Terrus in Allegra', 'The Terrus is a thoughtfully designed clog, made for the outdoors. Wear them around the city on a light hike, or sit around by the lake with a book in hand. Just throw them on and stay easy, cool, and comfy all day.

→ Handmade. Made in a family run factory in Portugal.

→ Comfy. Molded cork footbed, wide toe box, arch support and soft lining.

→ Made for the outdoors. Grippy rubber sole, sweat wicking lining, adjustable traps.

→ Versatile. The Terrus makes just as much sense in the city, as it does by the lake. Their versatile design makes them easy to wear with any outfit.

→ Easy to clean. Spot clean with warm water.', '');
insert into `shesg_product` values (255349023622, 'https://www.womsh.com/en-ot/shoponline/unisex-leather-sneaker.WM.YOU.LEUW?color=YN002', 'Yng unisex leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/YN002/WM.S23.YOU.LEUW-YN002-1.jpg', 188.17, 0, now(), now(), 'Shoes', 'Yng unisex leather ', 'YNG is Womsh\'s first project for sustainable sneakers designed entirely in a unisex and genderless way. This range is aimed at curious people, conscious travellers and lovers of timeless and iconic products. The sole is 3 cm high.

Upper: Pelle 100%
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: Gomma 100 %

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023623, 'https://www.womsh.com/en-ot/shoponline/unisex-leather-sneaker.WM.YOU.LEUW?color=YN004', 'Yng unisex leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/YN004/WM.S23.YOU.LEUW-YN004-1.jpg', 188.17, 0, now(), now(), 'Shoes', 'Yng unisex leather', 'YNG is Womsh\'s first project for sustainable sneakers designed entirely in a unisex and genderless way. This range is aimed at curious people, conscious travellers and lovers of timeless and iconic products. The sole is 3 cm high.
Upper: Pelle 100%
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: Gomma 100 %

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023624, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.WISE.MXM?color=WI008', 'Wise Man Leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/WI008/WM.S23.WISE.MXM-WI008-1.jpg', 234.41, 0, now(), now(), 'Shoes', 'Wise Man Leather', 'Versatile, simple and colourful, Wise sneakers are the new additions to the Womsh collection. The upper on this model is made of 60% leather and 40% recycled polyester. The Wise range was conceived and designed in a series of contrasting colours to add character to your outfits. The sole is 3.5 cm high.
Upper: Pelle 60% 40% pet recycled
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023625, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.WISE.MXM?color=WI006', 'Wise man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/WI006/WM.S23.WISE.MXM-WI006-1.jpg', 234.41, 0, now(), now(), 'Shoes', 'Wise man leather', 'Versatile, simple and colourful, Wise sneakers are the new additions to the Womsh collection. The upper on this model is made of 60% leather and 40% recycled polyester. The Wise range was conceived and designed in a series of contrasting colours to add character to your outfits. The sole is 3.5 cm high.
Upper: Pelle 60% 40% pet recycled
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023626, 'https://www.womsh.com/en-ot/shoponline/unisex-leather-sneaker.WM.WISE.MXUW?color=WI009', 'Wise unisex leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/WI009/WM.S23.WISE.MXUW-WI009-1.jpg', 220.43, 0, now(), now(), 'Shoes', 'Wise unisex leather', 'Versatile, simple and colourful, Wise sneakers are the new additions to the Womsh collection. The upper on this model is made of 60% leather and 40% recycled polyester. The Wise range was conceived and designed in a series of contrasting colours to add character to your outfits. The sole is 3.5 cm high.
Upper: Pelle 60% 40% pet recycled
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023627, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.CIRCLE.LEM?color=CI001', 'Circle man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/CI001/WM.S23.CIRCLE.LEM-CI001-1.jpg', 213.98, 0, now(), now(), 'Shoes', 'Circle man leather', 'Circle are the new sneakers with a retro design from Womsh. The leather upper is combined with a comfortable sole that guarantees extreme comfort. Available in various colours, they are perfect for all your looks. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Fabric 50% spugna50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023628, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.CIRCLE.LEM?color=CI005', 'Circle man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/CI005/WM.S23.CIRCLE.LEM-CI005-1.jpg', 213.98, 0, now(), now(), 'Shoes', 'Circle man leather', 'Circle Man Leather
Circle are the new sneakers with a retro design from Womsh. The leather upper is combined with a comfortable sole that guarantees extreme comfort. Available in various colours, they are perfect for all your looks. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Fabric 50% spugna50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023629, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.HYPER.LEM?color=HY053', 'Hyper man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/HY053/WM.S23.HYPER.LEM-HY053-1.jpg', 213.98, 0, now(), now(), 'Shoes', 'Hyper man leather', 'Hyper are the sneakers that combine a romantic interpretation of street style and a vintage reference to the 80s. They are comfortable and versatile. The upper on this model is made of leather. The WOMSH logo is on the heel. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023630, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.HYPER.LEM?color=HY055', 'Hyper man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/HY055/WM.S23.HYPER.LEM-HY055-1.jpg', 213.98, 0, now(), now(), 'Shoes', 'Hyper man leather', 'Hyper are the sneakers that combine a romantic interpretation of street style and a vintage reference to the 80s. They are comfortable and versatile. The upper on this model is made of leather. The WOMSH logo is on the heel. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023631, 'https://www.womsh.com/en-ot/shoponline/unisex-leather-sneaker.WM.YOU.LEUM?color=YN031', 'Yng unisex leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/YN031/WM.S23.YOU.LEUM-YN031-1.jpg', 203.23, 0, now(), now(), 'Shoes', 'Yng unisex leather', 'YNG is Womsh\'s first project for sustainable sneakers designed entirely in a unisex and genderless way. This range is aimed at curious people, conscious travellers and lovers of timeless and iconic products. The sole is 3 cm high.
Upper: Pelle 100%
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: Gomma 100 %

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023632, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.DOUBLE.LEM?color=DO005', 'Double man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/DO005/WM.S23.DOUBLE.LEM-DO005-1.jpg', 209.68, 0, now(), now(), 'Shoes', 'Double man leather', 'Double are the new sneakers with a minimal and clean design from Womsh. The leather upper is combined with a comfortable sole that guarantees extreme comfort. Available in various colours, Double are perfect for all your looks. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023633, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.DOUBLE.LEM?color=DO003', 'Double man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/DO003/WM.S23.DOUBLE.LEM-DO003-1.jpg', 209.68, 0, now(), now(), 'Shoes', 'Double man leather', 'Double are the new sneakers with a minimal and clean design from Womsh. The leather upper is combined with a comfortable sole that guarantees extreme comfort. Available in various colours, Double are perfect for all your looks. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023634, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.HYPER.VEM?color=HY057', 'Hyper man vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/HY057/WM.S23.HYPER.VEM-HY057-1.jpg', 213.98, 0, now(), now(), 'Shoes', 'Hyper man vegan', 'Hyper are the sustainable sneakers that combine a romantic interpretation of street style and a vintage reference to the 80s. They are comfortable and versatile. The upper on this model is made of Apple Skin, an innovative material that reproduces the texture and characteristics of leather using fibres derived from apple processing waste. The WOMSH logo is on the heel. The sole is 2.5 cm high.
Upper: Appleskin vegan 100 %
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023635, 'https://www.womsh.com/en-ot/shoponline/man-leather-sneaker.WM.HYPER.LEM?color=HY053', 'Hyper man leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/HY053/WM.S23.HYPER.LEM-HY053-1.jpg', 213.98, 0, now(), now(), 'Shoes', 'Hyper man leather', 'Hyper are the sneakers that combine a romantic interpretation of street style and a vintage reference to the 80s. They are comfortable and versatile. The upper on this model is made of leather. The WOMSH logo is on the heel. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023636, 'https://www.womsh.com/en-ot/shoponline/unisex-leather-sneaker.WM.YOU.LEUW?color=YN002', 'Yng unisex leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/YN002/WM.S23.YOU.LEUW-YN002-1.jpg', 188.17, 0, now(), now(), 'Shoes', 'Yng unisex leather', 'YNG is Womsh\'s first project for sustainable sneakers designed entirely in a unisex and genderless way. This range is aimed at curious people, conscious travellers and lovers of timeless and iconic products. The sole is 3 cm high.
Upper: Pelle 100%
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: Gomma 100 %

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023637, 'https://www.womsh.com/en-ot/shoponline/unisex-leather-sneaker.WM.YOU.LEUW?color=YN005', 'Yng unisex leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/YN005/WM.S23.YOU.LEUW-YN005-1.jpg', 188.17, 0, now(), now(), 'Shoes', 'Yng unisex leather', 'YNG is Womsh\'s first project for sustainable sneakers designed entirely in a unisex and genderless way. This range is aimed at curious people, conscious travellers and lovers of timeless and iconic products. The sole is 3 cm high.
Upper: Pelle 100%
Lining: Microfibra 20% spugna 80%
Insole: Pu 100%
Sole: Gomma 100 %

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023638, 'https://www.womsh.com/en-ot/shoponline/woman-vegan-sneaker.WM.DOUBLE.VEW?color=DO016', 'Double woman vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/DO016/WM.S23.DOUBLE.VEW-DO016-1.jpg', 198.93, 0, now(), now(), 'Shoes', 'Double woman vegan', 'Double are the sustainable sneakers from Womsh. The upper on this model is made of Apple Skin, an innovative material that reproduces the texture and characteristics of leather using fibres derived from apple processing waste. Thanks to their timeless design they are perfect for all your looks. The sole is 2.5 cm high.
Upper: Appleskin vegan 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023639, 'https://www.womsh.com/en-ot/shoponline/woman-vegan-sneaker.WM.DOUBLE.VEW?color=DO017', 'Double woman vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/DO017/WM.S23.DOUBLE.VEW-DO017-1.jpg', 198.93, 0, now(), now(), 'Shoes', 'Double woman vegan', 'Double are the sustainable sneakers from Womsh. The upper on this model is made of Apple Skin, an innovative material that reproduces the texture and characteristics of leather using fibres derived from apple processing waste. Thanks to their timeless design they are perfect for all your looks. The sole is 2.5 cm high.
Upper: Appleskin vegan 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023640, 'https://www.womsh.com/en-ot/shoponline/woman-vegan-sneaker.WM.HYPER.VEW?color=HY064', 'Hyper woman vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/HY064/WM.S23.HYPER.VEW-HY064-1.jpg', 203.23, 0, now(), now(), 'Shoes', 'Hyper woman vegan', 'Hyper are the sustainable sneakers that combine a romantic interpretation of street style and a vintage reference to the 80s. They are comfortable and versatile. The upper on this model is made of Apple Skin, an innovative material that reproduces the texture and characteristics of leather using fibres derived from apple processing waste. The WOMSH logo is on the heel. The sole is 2.5 cm high.
Upper: Appleskin vegan 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023641, 'https://www.womsh.com/en-ot/shoponline/woman-leather-sneaker.WM.HYPER.LEW?color=HY059', 'Hyper woman vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/HY059/WM.S23.HYPER.LEW-HY059-1.jpg', 203.23, 0, now(), now(), 'Shoes', 'Hyper woman vegan', 'Hyper are the sneakers that combine a romantic interpretation of street style and a vintage reference to the 80s. They are comfortable and versatile. The upper on this model is made of leather. The WOMSH logo is on the heel. The sole is 2.5 cm high.
Upper: Pelle 100%
Lining: Microfibra 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023642, 'https://www.womsh.com/en-ot/shoponline/woman-leather-sneaker.WM.SNIK.LEW?color=SN042', 'Snik woman leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/SN042/WM.S23.SNIK.LEW-SN042-1.jpg', 224.73, 0, now(), now(), 'Shoes', 'Snik woman leather', 'A new look for the original cornerstone of the Womsh collection, Snik sneakers are perfect for every occasion. The upper on this model is made of leather. With a colourful, contrasting heel they represent the essence of the brand: simplicity is never trivial, indeed many times it is our main resource. The sole is 3 cm high.
Upper: Pelle 100%
Lining: Pelle 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023643, 'https://www.womsh.com/en-ot/shoponline/woman-leather-sneaker.WM.SNIK.LEW?color=SN045', 'Snik woman leather', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/SN045/WM.S23.SNIK.LEW-SN045-1.jpg', 224.73, 0, now(), now(), 'Shoes', 'Snik woman leather', 'A new look for the original cornerstone of the Womsh collection, Snik sneakers are perfect for every occasion. The upper on this model is made of leather. With a colourful, contrasting heel they represent the essence of the brand: simplicity is never trivial, indeed many times it is our main resource. The sole is 3 cm high.
Upper: Pelle 100%
Lining: Pelle 50% spugna 50%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023644, 'https://www.womsh.com/en-ot/shoponline/woman-vegan-sneaker.WM.WAVE.VEW?color=WA024', 'Wave woman vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/WA024/WM.S23.WAVE.VEW-WA024-1.jpg', 256.99, 0, now(), now(), 'Shoes', 'Wave woman vegan', 'Wave are the sneakers with a thousand faces, perfect for those who walk in the city but also for those who want to get off the beaten track. They have a thick sole designed to support and follow the ergonomics of the foot and a variety of fabrics and materials for the upper to meet everyone\'s needs. The upper on this model is made of Apple Skin (50% apple, 50% recycled polyester), an innovative material that reproduces the texture and characteristics of leather using fibres derived from apple processing waste. The sole is 4 cm high.
Upper: Appleskin vegan 50% pet recy 50%
Lining: Sintetico 70% spugna 30%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023645, 'https://www.womsh.com/en-ot/shoponline/woman-vegan-sneaker.WM.WAVE.VEW?color=WA025', 'Wave woman vegan', 'https://hub.artcrafts.it/_public/resized/1200x1200/WM/S23/WA025/WM.S23.WAVE.VEW-WA025-1.jpg', 256.99, 0, now(), now(), 'Shoes', 'Wave woman vegan', 'Wave are the sneakers with a thousand faces, perfect for those who walk in the city but also for those who want to get off the beaten track. They have a thick sole designed to support and follow the ergonomics of the foot and a variety of fabrics and materials for the upper to meet everyone\'s needs. The upper on this model is made of Apple Skin (50% apple, 50% recycled polyester), an innovative material that reproduces the texture and characteristics of leather using fibres derived from apple processing waste. The sole is 4 cm high.
Upper: Appleskin vegan 50% pet recy 50%
Lining: Sintetico 70% spugna 30%
Insole: Pu 100%
Sole: TR light 100%

Due to the resolution of your mobile and computer screens, actual color may vary.

Compensate for CO2
The future lies in circularity

Recycle
Long live Womsh

Clean energy and happy people
A healthy environment to work, inside and out

Packaging
100% recycled packaging', '');
insert into `shesg_product` values (255349023646, 'https://sayadesigns.com/pala-hair-sticks', 'THE PALA HAIR STICKS', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/p/a/palatemplate14.jpg', 40.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'The Pala Hairsticks come in a set of three. The three pins are designed to style your hair in versatile ways and create options to give the full focus on the hair style itself. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. Each piece is unique. Your Pala Hairsticks arrive in fully recyclable packaging with a fabric sleeve to protect them whilst traveling.

Suited For Your Hair Type? : The Para Hair Sticks are suited for medium to longer hair that is in need of additional support. They are also a great choice if styling for a special occasion and want an alternative to bobby pins or plastic clips. Each one can be used singularly, or all together to give additional support to more ambitious styles. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. See our tutorials page for ideas.
Benefits of Wood? : Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship : All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023647, 'https://sayadesigns.com/soka-bud-hairstick', 'THE SOKA BUD HAIRSTICK', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/s/o/soka-bud-hairstick-teak-tamarind-rosewood-table-view.png', 36.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'The Soka Bud Hairstick best suits long and thick hair. It’s long and curved shape allows it to wrap and support a lot of hair in one short sweep. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Soka Bud Hairstick arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Soka Bud Hairstick best suits long and thick hair. It’s long and curved shape allows it to wrap and support a lot of hair in one short sweep. The thick upper body allows it to secure and hold your hair firmly in place once styled. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. See our tutorials page for ideas.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023648, 'https://sayadesigns.com/tapioca-hair-stick', 'THE TAPIOCA HAIR STICK', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/t/a/tapioca-hairstick-teak-rosewood-view.jpg', 35.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'The Tapioca Hairstick specifically suits the longest and thickest of hair types. It’s large upper body and long length allows it to support and hold a lot of hair. The indentation at the top of the hair stick is designed to hook and help secure hair in place. Available in sustainably sourced Teak and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Tapioca hair stick arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Tapioca hair stick specifically suits the longest and thickest of hair types. It’s large upper body and long length allows it to support and hold a lot of hair. The indentation at the top of the hair stick is designed to hook and help secure hair in place. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. See our tutorials page for ideas.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023649, 'https://sayadesigns.com/mini-palms-hair-pins', 'THE MINI PALM HAIR STICKS', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/m/i/minipalmstemplate3.jpg', 28.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'The Mini Palms come as a set of two and in opposing wood types. Designed to suit the finest and shortest of hair types. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Mini Palm Hairsticks arrive in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Mini Palms come as a set of two and in opposing wood types. Designed to suit the finest and shortest of hair types. The two sticks together offer additional strength and support if needed to secure your style.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023650, 'https://sayadesigns.com/banana-leaf-hair-stick', 'THE BANANA LEAF HAIR STICK', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/b/a/banana-leaf-hairstick-rosewood-teak-tamarind-aerial-view.jpg', 24.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'Due to its slender shape, the Banana Leaf suits finer hair types and medium to short lengths. Its curved twist and hooked point allows you to wrap and secure your style in place. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Banana Leaf hair stick arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | Due to its slender shape, the Banana Leaf suits finer hair types and medium to short lengths. Its curved twist and hooked point allows you to wrap and secure your style in place. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. See our tutorials page for ideas.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023651, 'https://sayadesigns.com/double-pandans-hair-pins', 'THE DOUBLE PANDAN HAIR STICKS', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/d/o/double-pandan-hairsticks-table-view.jpg', 46.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'The Double Pandan Hairsticks are available as a set of two. Designed to style in medium to long hair types. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Double Pandan Hairsticks arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | Designed to style in medium to long hair types. The two sticks provide additional support and strength for any up do style. See our tutorials page for ideas.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023652, 'https://sayadesigns.com/mini-pandans-hair-pins', 'THE MINI PANDAN HAIR STICKS', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/m/i/mini-pandan-hairsticks-top-view.jpg', 28.00, 0, now(), now(), 'Accessories', 'HAIR STICKS', 'The Mini Pandan\'s come as a set of two and in opposing wood types. Designed to suit a variety of hair types. A perfect option if unsure which model to choose. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Mini Pandan hair sticks arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | Designed to suit a variety of hair types, the Mini Pandans are able to style and support a range from short to fine and thick to curley. The two sticks offer additional strength and support if needed for thicker hair.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023653, 'https://sayadesigns.com/melati-hair-fork', 'THE MELATI HAIR FORK', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/c/h/champakatemplate12.jpg', 47.00, 0, now(), now(), 'Accessories', 'HAIR FORKS', 'The Melati Hairfork is best suited for medium lengths of hair. The two pronged fork allows it to hold and support thick and heavy hair types as well as finer and shorter styles. Its versatile design makes it very easy to use. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Melati Hairfork arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? : The Melati Hair fork is best suited for medium lengths of hair. The two pronged fork allows it to hold and support thick and heavy hair types as well as finer and shorter styles. Its versatile design makes it very easy to use. The long wide teeth are designed to gently work its way through thick and textured hair whilst reducing breakage. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. See our tutorials page for ideas.
Benefits of Wood? : Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship : The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023654, 'https://sayadesigns.com/chanang-hair-fork', 'THE CHANANG HAIRFORK', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/c/h/chanang-hairfork-tamarind-rosewood-angle-view.jpg', 60.00, 0, now(), now(), 'Accessories', 'HAIR FORKS', 'The Chanang Hairfork is designed to suit curley, textured and afro hair types. Hair forks are able to hold and support larger and fuller amounts of hair. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Chanang Hairfork arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Chanang Hairfork is designed to suit curley, textured and afro hair types. Hair forks are able to hold and support larger and fuller amounts of hair. A unique final touch to any outfit for any special event. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. With opposing tips, they will stand out in any hair colour. See our tutorials page for ideas.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023655, 'https://sayadesigns.com/barrette-hair-fork', 'THE BARRETTE HAIR FORK', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/b/a/barrettetemplate.jpg', 49.00, 0, now(), now(), 'Accessories', 'HAIR FORKS', 'Barrettes have been used for centuries and are an all-time classic hair accessory. They are designed to hold and support long, thick and curly hair types. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Barrette Hairfork arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? : Barrettes have been used for centuries and are an all-time classic hair accessory. They are designed to hold and support long, thick and curly hair types in an easy updo style. See our tutorials page for ideas.
Benefits of Wood? : Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship : All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023656, 'https://sayadesigns.com/the-jasmine-hairslide', 'THE JASMINE HAIRSLIDE', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/j/a/jasminetemplate3.jpg', 40.00, 0, now(), now(), 'Accessories', 'HAIR SLIDES', 'The Jasmine Hairslide comes as a two piece set. Similar to the Black Orchid and Moon Flower design, which are designed for thicker and longer hair types, this design is designed for shorter and finer hair types. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. Each piece is unique. Your Jasmine Hairslide arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Jasmine hair slide is our smallest hair slide and is best suited for shorter to medium and finer hair types that are not too heavy. The shape is designed to hold your updo in place by covering the bun, whilst the stick is used to secure it. The Black Orchid and Moon Flower are designed for longer, thicker and textured hair. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023657, 'https://sayadesigns.com/black-orchid-hair-slide', 'THE BLACK ORCHID HAIRSLIDE', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/t/h/the_black_orchid_hairslide-closeup_2.jpg', 44.00, 0, now(), now(), 'Accessories', 'HAIR SLIDES', 'The Black Orchid Hair Slide is designed for medium to shorter and finer hair types. This was designed as a smaller version of our Moon Flower Hair slide which is intended to hold and support longer, thicker hair types. The Black Orchid can be styled and used in a variety of ways. Available in sustainably sourced Teak, Tamarind and Rosewood. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones.

Suited For Your Hair Type? | The Black Orchid hair slide is our mid way hair slide and is best suited for medium and finer hair types that are not too heavy. The shape is designed to hold your updo in place by covering the bun, whilst the stick is used to secure it. Similar to the Jasmine and Moon Flower design, which are designed for finer and thicker hair types. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023658, 'https://sayadesigns.com/moonflower-hair-slide', 'THE MOONFLOWER HAIRSLIDE', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/m/o/moonflower-hairslide-tamarind-teak-side-view.jpg', 60.00, 0, now(), now(), 'Accessories', 'HAIR SLIDES', 'The Moonflower comes as a two piece set. It is a hair slide with an organic feel, and a smooth, modern shape. It is one of the most popular models in our range. Suiting longer, thicker hair it makes a real statement while holding your hair back. Available in sustainably sourced Teak and Tamarind. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. No one piece is ever the same. Your Moon Flower hairslide arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Moon Flower hair slide is our larger hair slide and is best suited for medium and long, thicker and textured hair types. The shape is designed to hold your updo in place by covering the bun, whilst the stick is used to secure it. Similar to the Jasmine and Black Orchid design, which are designed for finer and shorter hair types. Each wood variation will compliment individual hair colours, either by choosing a wood type with opposing tones or similar ones. See our tutorials page for ideas.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023659, 'https://sayadesigns.com/the-nipa-comb', 'THE NIPA COMB', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/n/i/nipatemplate10.jpg', 49.00, 0, now(), now(), 'Accessories', 'HAIR COMBS', 'The Nipa Hair Comb is one of our latest additions to our collection. Designed to gently brush and comb tangled ends whilst massaging and soothing the roots. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. Each piece is unique. Your Nipa Comb arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Nipa Hair Comb is designed for thick, curly and afro hair types. The long wide teeth are designed to gently work its way through thick and textured hair whilst reducing breakage. The large base allows you to comfortably hold your comb and brush your hair in a combination of angles.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023660, 'https://sayadesigns.com/the-jambu-comb', 'THE JAMBU COMB', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/j/a/jambutemplate9.jpg', 44.00, 0, now(), now(), 'Accessories', 'HAIR COMBS', 'The Jambu Hair Comb is one of our latest additions to our collection. Designed to gently brush and comb tangled ends whilst massaging and soothing the roots. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. Each piece is unique. Your Jambu HairComb arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? | The Jambu Hair Comb is designed for thick, curly and afro hair types. The long wide teeth are designed to gently work its way through thick and textured hair whilst reducing breakage. The large base allows you to comfortably hold your comb and brush your hair in a combination of angles.
Benefits of Wood? | Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship | All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023661, 'https://sayadesigns.com/lotus-wooden-hair-comb', 'THE LOTUS COMB', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/l/o/lotus-hair-comb-teak-tamarind-rosewood-main-view._1.jpg', 32.00, 0, now(), now(), 'Accessories', 'HAIR COMBS', 'The Lotus Comb is one of our first ever combs to be introduced into our collection. Designed to gently brush and comb tangled ends whilst massaging and soothing the roots. Perfect for all hair lengths and types, ideal for a travel comb to take with you on the move. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. Each piece is unique. Your Lotus Comb arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? : The Lotus Comb is designed to gently brush and comb tangled ends whilst massaging and soothing the roots. Perfect for all hair lengths and types, ideal for a travel comb to take with you on the move.
Benefits of Wood? : Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship : All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023662, 'https://sayadesigns.com/kamboja-wooden-hair-comb', 'THE KAMBOJA COMB', 'https://sayadesigns.com/media/catalog/product/cache/8859116d44ae4af5da9359a3a8dc8160/k/a/kamboja-comb-rosewood_1.jpg', 40.00, 0, now(), now(), 'Accessories', 'HAIR COMBS', 'The Kamboja Comb is one of our first ever combs to be introduced into our collection. Designed to gently brush and comb tangled ends whilst massaging and soothing the roots. Perfect for all hair lengths and types, ideal for a travel comb to take with you on the move. Available in sustainably sourced Teak, Tamarind and Rosewood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia. Each piece is unique. Your Kamboja Comb arrives in fully recyclable packaging with a fabric sleeve to protect it whilst traveling.

Suited For Your Hair Type? : The Kamboja Hair Comb is designed to gently brush and comb tangled ends whilst massaging and soothing the roots. Perfect for all hair lengths and types, ideal for a travel comb to take with you on the move.
Benefits of Wood? : Wooden combs and accessories help to reduce anti static, breakage and damage to hair, unlike plastic and metal. The porous nature of wood absorbs and redistributes your natural oils and maintains healthy hair continuously through your wash cycle. Wooden tips also gently massage your skin, stimulating blood flow which over time promotes hair growth. View our shop here to explore our whole collection.

Craftsmanship : All our collections are uniquely designed, inspired by local flora and fauna in Indonesia. The process from rough-cut waste to hand-polished combs and forks are made by our artisans in Indonesia, creating truly one-of-a-kind pieces everytime. They are unique from the details in their shape and in the grains of the wood. All of our accessories are hand carved from waste offcuts left over from plantations in Indonesia.', '');
insert into `shesg_product` values (255349023663, 'https://www.batoko.com/collections/swimsuits/products/seal?variant=39249768218701', 'Seal', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Seal-Swimsuit-2_720x.jpg?v=1672947520', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Bestseller
We got a lot of requests for a seal print and it\'s quickly become a firm favourite. Inspired by the vast underwater kelp forests and grey seal colonies found all around the UK coastline. A proportion of the proceeds made from sales of this print goes to helping the rescue and rehabilitate of grey seal pups at the Cornish Seal Sanctuary.

Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023664, 'https://www.batoko.com/collections/swimsuits/products/camo?variant=39948215812173', 'Camo', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Camo-Swimsuit---Front_720x.jpg?v=1666872080', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'New Arrival
One for your next wild adventure. A classic earthy green camouflage print with splashes of soft pink.

Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023665, 'https://www.batoko.com/collections/swimsuits/products/narwhal?variant=39249766678605', 'Narwhal', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Narwhal-Swimsuit_720x.jpg?v=1614680571', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Narwhal, the unicorns of the sea. These mysterious tusked whales spend their days ice dipping far north in arctic waters. We chose a deep rich ocean blue and weaved through golden stars inspired by the magical northern skies.

Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023666, 'https://www.batoko.com/collections/swimsuits/products/otter?variant=39948213256269', 'Otter', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Otter-Swimsuit---Back-4_720x.jpg?v=1673442452', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'New Arrival
The eurasian otter. This loveable semi-aquatic mammal enjoys dipping in rivers, lakes and along rocky coastlines - adapted to life both on land and in water - a wild swimmers spirit animal. We chose a soft turquoise green layered with swaying aquatic plants for our otters to dive through.
A proportion of the proceeds made from sales of this print goes to helping the rescue and rehabilitate of otter pups at the UK Wild Otter Trust.

Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023667, 'https://www.batoko.com/collections/swimsuits/products/fern?variant=39948328271949', 'Ferns', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Fern-Swimsuit---Front-2_720x.jpg?v=1673441545', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'New Arrival
An ode to an ancient plant that carpets our woodlands and riverbanks. Lush green ferns against a soft mustard yellow with some sweet furry bumblebees buzzing on by.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023668, 'https://www.batoko.com/collections/swimsuits/products/wild-cat-swimsuit?variant=37380907409', 'Wild Cat', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Wild-Cat-Swimsuit_720x.jpg?v=1555491789', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'One for the jungle cats that love cooling off with a dip at their local watering hole. Sandy coloured with classic black animal print markings.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023669, 'https://www.batoko.com/collections/swimsuits/products/puffin-swimsuit?variant=21040910008397', 'Puffin', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Puffin-Swimsuit_720x.jpg?v=1555489834', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'A miniature seabird with a big bright orange bill and an even bigger character. We chose a soft purple to contrast against the monochrome, inspired by the coastal thrift flowers that carpet the cliff tops where atlantic puffins nest and raise their pufflings.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023670, 'https://www.batoko.com/collections/swimsuits/products/lobster-swimsuit?variant=6045646225435', 'Lobster', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Lobster-Swimsuit_4b7ba913-460b-4578-9208-ba9d8e52f227_720x.jpg?v=1673182982', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Bestseller
Our lobster - in a striking red and soft pink colourway - is one of our OG\'s and a firm favourite. We\'ve also teamed up with the National Lobster Hatchery for this print. For every lobster swimsuit sold, a baby lobster is reared and released back into the sea.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023671, 'https://www.batoko.com/collections/swimsuits/products/crab?variant=39249761239117', 'Crab', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Crab-Swimsuit_720x.jpg?v=1614854896', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'A classic rockpooler. And the perfect companion to our lobster cozzie.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023672, 'https://www.batoko.com/collections/swimsuits/products/hare?variant=39948335185997', 'Hare', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Hare-Swimsuit---Front-3_720x.jpg?v=1673441231', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'New Arrival
The iconic shapeshifting brown hare. Boxing and leaping through grasses and dandelions against a soft sky blue.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023673, 'https://www.batoko.com/collections/swimsuits/products/orca-swimsuit?variant=6045642293275', 'Orca', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Orca-Web-2000-px_720x.jpg?v=1518525744', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Bestseller
One of our OG\'s and a firm favourite. A playful pod of killer whales splashing through a contrasting soft turquoise blue. Community wild swimming at its best.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023674, 'https://www.batoko.com/collections/swimsuits/products/shark-swimsuit?variant=36999788817', 'Shark', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Shark_May_H_Res_3_720x.jpg?v=1525080197', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'The great white gets a bad rep, but it\'s easy to be misunderstood when you\'ve got 300 teeth and a cult thriller made about you. Light grey shark print against a soft ocean blue.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023675, 'https://www.batoko.com/collections/swimsuits/products/jellyfish?variant=39948216303693', 'Jellyfish', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Jellyfish-Swimsuit---Front_720x.jpg?v=1666873759', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'New Arrival
Inspired by a bloom of bioluminescent jellyfish floating through deep blue waters.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023676, 'https://www.batoko.com/collections/swimsuits/products/fruity?variant=39948216139853', 'Fruity', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Watermelon-Swimsuit---Front_720x.jpg?v=1666874675', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'New Arrival
Our fruity print is a bold juicy red with contrasting black pips, inspired by a refreshing slice of watermelon of a hot summers day. More subtle than some of our other patterns, whilst still packing a punch similarly to our wild cat.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023677, 'https://www.batoko.com/collections/swimsuits/products/sunflower?variant=39249782308941', 'Sunflower', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Sunflower-Swimsuit_720x.jpg?v=1614853111', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Inspired by a field of bright yellow sunflowers on a blue sky summers day. We hope this one brings you as much joy as it does for us!
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023678, 'https://www.batoko.com/collections/swimsuits/products/wildflower-swimsuit?variant=20868725309517', 'Wildflower', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Batoko-Wildflower-Swimsuit_720x.jpg?v=1561466155', 74.38, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Our wildflower print is inspired by british summertime, when the bees are busy and grasses and flowers are scrambling to the sky. Important wild patches, offering food for birds and mammals, from the insects they attract to the seeds they produce at the end of their cycle. There\'s an entire world beneath our feet and to notice it is to fall in love with it, celebrate it and protect it.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023679, 'https://www.batoko.com/collections/swimsuits/products/cockatoo-swimsuit?variant=6045646848027', 'Cockatoo', 'https://cdn.shopify.com/s/files/1/0165/5142/products/Cockatoo_High_Res_edit_720x.jpg?v=1525084349', 63.22, 0, now(), now(), 'Swimwear', 'Swimwear ', 'Last chance to grab this print before it\'s discontinued! Our cockatoo print is as bright and badass as the birds themselves. Feathered friends perched in lush green foliage and a soft neon pink backdrop for a nod to more tropical climes.
Materials and specs
Batoko swimwear is made from GRS certified 100% recycled post-consumer plastic waste.
Recycled fabric content: 85% polyester 15% elastane (spandex)
Digitally printed
Fully lined
Scooped back
Excellent bust support and coverage without the need for cups, wiring or shelf bra
Designed to fit a variety of body shapes and lengths', '');
insert into `shesg_product` values (255349023680, 'https://underprotection.eu/collections/sale/products/tenna-bucket-hat-green', 'TENNA BUCKET HAT GREEN
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Tenna_Bucket_Hat_Green_Front_720x.jpg?v=1643027631', 28.00, 0, now(), now(), 'Womenswear', 'TENNA BUCKET HAT GREEN
', 'WHY WE LOVE IT
Did you know that it is recommended to take a siesta from the sun in the middle of the day? And that wearing a hat can protect your face from the sun? This bucket hat will both bring you joy and protection. The bucket hat is made in the same material as your swimwear which means it will dry fast in case of getting wet. Match with Tenna swimsuit or one of the other swimwear styles in matching colors.
Get it with orange stripes too.
QUALITY & CARE

- Soft swimwear jersey in 85% polyester (recycled PET bottles) and 15% elastane
- Wash at 30*
CERTIFICATIONS & ORIGIN
This product is made at a BSCI and WRAP certified factory in China. The product is PETA-Approved Vegan and the material is GRS certified. Read more about our sustainable values here.
', '');
insert into `shesg_product` values (255349023681, 'https://underprotection.eu/collections/sale/products/tenna-swimsuit-green', 'TENNA SWIMSUIT GREEN
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Tenna_Swimsuit_Green_Front_0c4be38a-df1e-467f-a628-f2fbe3d10c0c_720x.jpg?v=1658150563', 61.00, 0, now(), now(), 'Womenswear', 'TENNA SWIMSUIT GREEN
', '
WHY WE LOVE IT

Tenna swimsuit is cut in seersucker like jersey made from recycled polyester. It has a drawstring halterneck and a beautiful and sexy cut out back. The bandeau shaped cups offers a nice support and have removable padding. Use it as a top and show off the nice deep back. In need of a siesta? Matching Tenna bucket hat will do the job.

Also available with orange stripes.

QUALITY & CARE

- Soft swimwear jersey in 85% polyester (recycled PET bottles) and 15% elastane
- Removable padding in 100% polyamide (recycled)
- Metallic look trim
- Wash at 30*

CERTIFICATIONS & ORIGIN

This product is made at a BSCI and WRAP certified factory in China. The product is PETA-Approved Vegan and the material is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023682, 'https://underprotection.eu/collections/sale/products/celine-long-sleeve-bodystocking-khaki', 'CELINE LONG SLEEVE BODYSTOCKING KHAKI
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Celine_LS_Body_Khaki_Front_720x.jpg?v=1663232496', 71.00, 0, now(), now(), 'Womenswear', 'CELINE LONG SLEEVE BODYSTOCKING KHAKI', 'WHY WE LOVE IT
Our long sleeved Celine body in khaki green is made from soft and airy jersey of TENCEL™ Lyocell quality. This basic body has a romantic square neckline which, combined with the string bottom, makes it a very comfortable end elegant wearing. Celine body can be used as both underwear and outerwear - perfect for easy layering! Wear as a top with high waist jeans or style together with matching Celine leggings.

Also available in creme and black.

QUALITY & CARE
- Soft Jersey made from 96% TENCEL™ Lyocell and 4% elastane
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in Portugal, at a SEDEX certified factory. The fabric is PETA-Approved Vegan. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023683, 'https://underprotection.eu/collections/new-arrivals/products/brigitte-bikini-bra', 'BRIGITTE BIKINI BRA
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Brigitte_Bikini_Bra_Orange_1800x1800.jpg?v=1681819228', 61.00, 0, now(), now(), 'Womenswear', 'BRIGITTE BIKINI BRA', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE
Brigitte bikini bra is made in a funky wavy logo pattern that is sure to make you in the mood for summer. The bra has a classic triangle shape that gives it a timeless fit.

Complete the set with matching Brigitte Bikini Briefs or Brigitte Bikini Tanga.
QUALITY & CARE

- Soft swimwear jersey in 85% polyester (recycled PET bottles) and 15% elastane
- Removable padding in 100% polyamide (recycled)
- Golden trim
- Wash at 30*
- We recommend you use Gubbyfriend washing bag for all synthetic products
CERTIFICATIONS & ORIGIN

This product is made at a BSCI and WRAP certified factory in China. T', '');
insert into `shesg_product` values (255349023684, 'https://underprotection.eu/collections/new-arrivals/products/brigitte-swimsuit', 'BRIGITTE SWIMSUIT
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Brigitte_Swimsuit_Orange_7f7f6fad-10c0-4755-86cd-9321d9a343f2_720x.jpg?v=1681812895', 121.00, 0, now(), now(), 'Womenswear', 'BRIGITTE SWIMSUIT
', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE
Brigitte swimsuit is made in a funky wavy logo pattern that is sure to make you in the mood for summer. The drawstrings down the sides and the crossback straps gives it a sporty and fresh look. It is made in polyester jersey (recycled), and the cups have removable padding and offers a nice support.
QUALITY & CARE

- Soft swimwear jersey in 85% polyester (recycled PET bottles) and 15% elastane
- Removable padding in 100% polyamide (recycled)
- Golden trim
- Wash at 30*
- We recommend you use Gubbyfriend washing bag for all synthetic products
CERTIFICATIONS & ORIGIN

This product is made at a BSCI and WRAP certified factory in China. The product is PETA-Approved Vegan and the fabric is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023685, 'https://underprotection.eu/collections/underprotectionxblanche/products/brigitte-bucket-hat', 'BRIGITTE BUCKET HAT', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Brigitte_Bucket_Hat_Orange_720x.jpg?v=1681823098', 61.00, 0, now(), now(), 'Womenswear', 'BRIGITTE BUCKET HAT
', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE
Brigitte bucket hat is made in a funky wavy logo pattern that is sure to make you in the mood for summer. This bucket hat will bring you both joy and protection. It is made in the same material as your swimwear which means it will dry fast in case of getting wet.

Match with Brigitte swimsuit or one of the other swimwear styles in matching colors.
QUALITY & CARE

- Soft swimwear jersey in 85% polyester (recycled PET bottles) and 15% elastane
- Wash at 30*
CERTIFICATIONS & ORIGIN

This product is made at a BSCI and WRAP certified factory in China. The product is PETA-Approved Vegan and the fabric is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023686, 'https://underprotection.eu/collections/underprotectionxblanche/products/brigitte-dress', 'BRIGITTE DRESS
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/BUP_Comfy_Dress_Orange_720x.jpg?v=1681822170', 193.00, 0, now(), now(), 'Womenswear', 'BRIGITTE DRESS', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE
Brigitte dress is made in a funky wavy logo pattern that is sure to make you in the mood for summer. It is ultra soft and has a cute and comfortable a-shape with a self tie halterneck.
QUALITY & CARE

- Soft swimwear jersey in 87% polyester (recycled PET bottles) and 13% elastane
- Golden trim
- Wash at 30*
- We recommend you use Gubbyfriend washing bag for all synthetic products
CERTIFICATIONS & ORIGIN

This product is made in Portugal and the fabric is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023687, 'https://underprotection.eu/collections/underprotectionxblanche/products/yrsa-swimsuit', 'YRSA SWIMSUIT
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Yrsa_Swimsuit_Creme_720x.jpg?v=1677767193', 132.00, 0, now(), now(), 'Womenswear', 'YRSA SWIMSUIT', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE

Yrsa swimsuit is cut in seersucker jersey made with recycled polyamid. Inspired by Yin & Yang - Yrsa combines soft lines with a bold colour contrast for an eye catching look. With its scooped neckline, high cut leg and a deep back, this swimsuit can be styled in so many ways.
QUALITY & CARE

- Seersucker jersey in 86% polyamid (53% recycled) and 14% spandex
- Wash at 30*
CERTIFICATIONS & ORIGIN

This product is made in China. The product is PETA-Approved Vegan and the material is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023688, 'https://underprotection.eu/products/dita-short-shirt-violet?pr_prod_strat=copurchase&pr_rec_id=7c069829c&pr_rec_pid=6589179428929&pr_ref_pid=6947396124737&pr_seq=uniform', 'DITA SHORT SHIRT VIOLET', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Dita_Short_Shirt_Violet_Front_5ff01b2a-81ef-4e3f-a79e-afc001777edb_720x.jpg?v=1635170963', 36.00, 0, now(), now(), 'Womenswear', 'DITA SHORT SHIRT VIOLET', 'WHY WE LOVE IT
Dita shortsleeved shirt is made in airy lyocell crepe that is made from banana leaf fibers. It has a seersucker structure and a spectacular collar with pretty ruffled edges. Dita short shirt is with its many cute details a twisted version of a classic shortsleeved pyjama shirt. To complete the set, match it with Dita shorts.
Also available in blue.

QUALITY & CARE
- 100% natural lyocell made from banana leaf fibers
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in New Delhi, India at a GOTS and BSCI certified factory. It is PETA-Approved Vegan and the lyocell fabric is GRS certified. Read more about our sustainable values here. ', '');
insert into `shesg_product` values (255349023689, 'https://underprotection.eu/collections/underprotectionxblanche/products/yrsa-towel', 'YRSA TOWEL
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/BUP_Towel_Creme_720x.jpg?v=1681887265', 121.00, 0, now(), now(), 'Womenswear', 'YRSA TOWEL
', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE

Yrsa towel is made in the softest organic cotton, its size makes it perfect both to use as a beach blanket and to embrace your body after a swim in the ocean or the swimmingpool.
QUALITY & CARE

- 100% Cotton (organic)
CERTIFICATIONS & ORIGIN

This product is made in Portugal. The product is PETA-Approved Vegan and the fabric is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023690, 'https://underprotection.eu/collections/underprotectionxblanche/products/yrsa-beach-bag', 'YRSA BEACH BAG
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/BUP_Beach_Bag_Creme_720x.jpg?v=1681888440', 516.00, 0, now(), now(), 'Womenswear', '', 'WHY WE LOVE IT
UNDERPROTECTION X BLANCHE
Yrsa Beach Bag is made in comfortable canvas of organic cotton. This spacious bag has a inside pocket and a snap-closure that makes it perfect for your beach essentials or for shopping.
QUALITY & CARE

- 100% Cotton (organic)
CERTIFICATIONS & ORIGIN

This product is made at a BSCI and WRAP certified factory in China. The product is PETA-Approved Vegan and the fabric is GRS certified. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023691, 'https://underprotection.eu/collections/upcycled/products/upcycled-weekend-bag-rose2', 'UPCYCLED WEEKEND BAG ROSE2', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Upcycled_Weekend_Bag_Rose2_720x.jpg?v=1671439208', 105.00, 0, now(), now(), 'Womenswear', 'UPCYCLED WEEKEND BAG ROSE2', 'WHY WE LOVE IT
The weekend bag has room for everything you\'ll need on a weekend trip.
UNDERPROTECTION x I TRÅD MED VERDEN
This year we are launching Underprotection Upcycled, a collection of upcycled one-of-a-kind accessories made in collaboration with ‘I Tråd Med Verden’ a socio-economic sewing room, for vulnerable women in Denmark.
‘I Tråd Med Verden’ have worked with our discarded Underprotection items and textiles, that for some reason no longer can be sold or used in our production, to give them new life through colourful and vibrant patchworks. The items are imperfectly perfect and not two items will be the same, giving the collection charm and soul.
Each item is handmade with love and care for our environment and people.
Read more about the collaboration here.

QUALITY & CARE
- Made in discarded textiles
- Metal zipper
- Wash at 30˚

CERTIFICATIONS & ORIGIN
Handmade and carefully curated in Denmark by the talented women at ‘I Tråd Med Verden’. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023692, 'https://underprotection.eu/collections/upcycled/products/upcycled-duffle-bag-blue1', 'UPCYCLED DUFFLE BAG BLUE1', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Upcycled_Duffel_Bag_Blue1_1800x1800.jpg?v=1671439299', 105.00, 0, now(), now(), 'Womenswear', 'UPCYCLED DUFFLE BAG BLUE1', 'WHY WE LOVE IT
The duffle bag is ideal for but not limited to bring with you to yoga sessions, the gym or other activities.
UNDERPROTECTION x I TRÅD MED VERDEN
This year we are launching Underprotection Upcycled, a collection of upcycled one-of-a-kind accessories made in collaboration with ‘I Tråd Med Verden’ a socio-economic sewing room, for vulnerable women in Denmark.
‘I Tråd Med Verden’ have worked with our discarded Underprotection items and textiles, that for some reason no longer can be sold or used in our production, to give them new life through colourful and vibrant patchworks. The items are imperfectly perfect and not two items will be the same, giving the collection charm and soul.
Each item is handmade with love and care for our environment and people.
Read more about the collaboration here.

QUALITY & CARE
- Made in discarded textiles
- Metal zipper
- Wash at 30˚

CERTIFICATIONS & ORIGIN
Handmade and carefully curated in Denmark by the talented women at ‘I Tråd Med Verden’. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023693, 'https://underprotection.eu/collections/upcycled/products/upcycled-small-clutch-beige', 'UPCYCLED SMALL POUCH BLACK
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Upcycled_Small_Pouch_White_720x.jpg?v=1671450632', 44.00, 0, now(), now(), 'Womenswear', 'UPCYCLED SMALL POUCH BLACK', 'WHY WE LOVE IT
The small clutch has many functions, but mainly it\'s just perfect for keeping all of your small things together - whatever that might be.
UNDERPROTECTION x I TRÅD MED VERDEN
This year we are launching Underprotection Upcycled, a collection of upcycled one-of-a-kind accessories made in collaboration with ‘I Tråd Med Verden’ a socio-economic sewing room, for vulnerable women in Denmark.
‘I Tråd Med Verden’ have worked with our discarded Underprotection items and textiles, that for some reason no longer can be sold or used in our production, to give them new life through colourful and vibrant patchworks. The items are imperfectly perfect which is giving the collection charm and soul.
Each item is handmade with love and care for our environment and people.
Read more about the collaboration here.

QUALITY & CARE
- Made in discarded textiles
- Metal zipper
- Wash at 30˚

CERTIFICATIONS & ORIGIN
Handmade and carefully curated in Denmark by the talented women at ‘I Tråd Med Verden’. Read more about our sustainable values here.', '');
insert into `shesg_product` values (255349023694, 'https://underprotection.eu/collections/loungewear/products/wilda-shirt-orange', 'WILDA SHIRT ORANGE
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Wilda_Shirt_Orange_Front_720x.jpg?v=1676556302', 121.00, 0, now(), now(), 'Womenswear', 'WILDA SHIRT ORANGE', 'WHY WE LOVE IT
Wilda shirt in creme with orange flowers are cut from the softest lyocell satin. It has an elegant and casual fit. This shirt is a perfect edition for both casual and festive occasions. Wear it with our Wilda pants and a pair of heels for an elegant look on a night out!

Get it in black as well.
QUALITY & CARE
- Satin made from 100% lyocell
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in New Delhi, India at a GOTS and SEDEX certified factory. The product is PETA-Approved Vegan. Read more about our sustainable values here. ', '');
insert into `shesg_product` values (255349023695, 'https://underprotection.eu/collections/loungewear/products/wilda-slip-dress-orange', 'WILDA SLIP DRESS ORANGE
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Wilda_Slip_Orange_Front_720x.jpg?v=1674741005', 127.00, 0, now(), now(), 'Womenswear', 'WILDA SLIP DRESS ORANGE
', 'WHY WE LOVE IT
Wilda slip dress with orange flowers is cut from our soft lyocell satin. It has thin adjustable straps with golden trimmings, and a midi-length loose fit. The Fie slip dress is wonderful as loungewear as well as a cool and elegant dress for festive occasions.
Get it in black as well.
QUALITY & CARE
- Satin made from 100% lyocell
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in New Delhi, India at a GOTS and SEDEX certified factory. The product is PETA-Approved Vegan. Read more about our sustainable values here. ', '');
insert into `shesg_product` values (255349023696, 'https://underprotection.eu/collections/loungewear/products/wilda-short-shirt-orange', 'WILDA SHORT SHIRT ORANGE
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Wilda_Short_Shirt_Orange_Front_720x.jpg?v=1676556952', 94.00, 0, now(), now(), 'Womenswear', 'WILDA SHORT SHIRT ORANGE', 'WHY WE LOVE IT
Wilda shirt in creme with orange flowers are cut from the softest lyocell satin. It has an elegant and casual fit. Match it with our Wilda shorts for lounging at home or style it with with jeans or a midi skirt for weekend lunch dates.
Get it in black as well.
QUALITY & CARE
- Satin made from 100% lyocell
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in New Delhi, India at a GOTS and SEDEX certified factory. The product is PETA-Approved Vegan. Read more about our sustainable values here. ', '');
insert into `shesg_product` values (255349023697, 'https://underprotection.eu/collections/loungewear/products/fie-slip-dress-ginger', 'FIE SLIP DRESS GINGER
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Fie_Slip_Ginger_Front_720x.jpg?v=1639579037', 61.00, 0, now(), now(), 'Womenswear', 'FIE SLIP DRESS GINGER
', 'WHY WE LOVE IT
Fie slip dress is cut from our soft and shiny lyocell satin and comes in a beautiful floral print that really brightens your everyday. It has thin adjustable straps with golden trimmings, and a midi-length loose fit. The Fie slip dress is wonderful as loungewear as well as a cool and elegant dress for festive occasions.
Get the same style in the other print, Fie slip dress green.
QUALITY & CARE
- Satin made from 100% natural lyocell
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in New Delhi, India at a GOTS and SEDEX certified factory. The product is PETA-Approved Vegan. Read more about our sustainable values here. ', '');
insert into `shesg_product` values (255349023698, 'https://underprotection.eu/collections/loungewear/products/fie-shirt-ginger', 'FIE SHIRT GINGER
', 'https://cdn.shopify.com/s/files/1/0063/8048/6725/products/Fie_Shirt_Ginger_Front_720x.jpg?v=1639579315', 61.00, 0, now(), now(), 'Womenswear', 'FIE SHIRT GINGER
', 'WHY WE LOVE IT
Fie shirt is made from the softest and most comfortable lyocell satin fabric. It has an elegant and casual fit with hidden buttons and comes in a beautiful floral print that really brighten your everyday. This shirt is a perfect edition for both casual and festive occasions. Wear it with our Fie pants and a pair of heels for an elegant look on a night out!

Get the same style in the other print, Fie shirt green.
QUALITY & CARE
- Satin made from 100% natural lyocell
- Wash at 30°

CERTIFICATIONS & ORIGIN
This product is made in New Delhi, India at a GOTS and SEDEX certified factory. The product is PETA-Approved Vegan. Read more about our sustainable values here. ', '');
insert into `shesg_product` values (255349023699, 'https://thela.eco/shop/bags-pouches/sustainable-pouches/travel-pouch-khari/', 'Travel Pouch – Khari
', 'https://thela.eco/wp-content/uploads/2021/06/bb05.1a-khari.jpg', 40.00, 0, now(), now(), 'Womenswear', 'Pouches', 'Have electronics? Have toiletries or makeup? We guarantee it will all fit in this roomy, vegan, zero-waste pouch.
Handmade sustainably in India with 15 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023700, 'https://thela.eco/shop/bags-pouches/sustainable-pouches/travel-pouch-gado/', 'Travel Pouch – Gado
', 'https://thela.eco/wp-content/uploads/2021/06/bb02.2a-gado.jpg', 40.00, 0, now(), now(), 'Womenswear', 'Pouches', 'A foldable pencil case with pockets that create the perfect place to store your stationery. And of course, it’s sustainable.
Handmade sustainably in India with 15 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023701, 'https://thela.eco/shop/bags-pouches/sustainable-pouches/pencil-case-ulhas/', 'Pencil Case – Ulhas
', 'https://thela.eco/wp-content/uploads/2023/04/ulhas-02.jpg', 26.00, 0, now(), now(), 'Womenswear', 'Pouches', 'A foldable pencil case with pockets that create the perfect place to store your stationery. And of course, it’s sustainable.
Handmade sustainably in India with 15 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023702, 'https://thela.eco/shop/bags-pouches/sustainable-pouches/travel-pouch-makhna/', 'Travel Pouch – Makhna
', 'https://thela.eco/wp-content/uploads/2022/06/bb04.3a-makhna.jpg', 42.00, 0, now(), now(), 'Womenswear', 'Pouches', 'Have electronics? Have toiletries or makeup? We guarantee it will all fit in this roomy, vegan, zero-waste pouch.
Handmade sustainably in India with 15 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023703, 'https://thela.eco/shop/bags-pouches/ethical-crossbody-bags/sling-nira/', 'Sling – Nira', 'https://thela.eco/wp-content/uploads/2023/04/nira-02.jpg', 40.00, 0, now(), now(), 'Womenswear', 'Crossbody Bags ', 'Comfortably fit your daily essentials – keys, phone and wallet – in this mini, vegan and zero-waste sling.
Handmade sustainably in India with 20 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean', '');
insert into `shesg_product` values (255349023704, 'https://thela.eco/shop/bags-pouches/sustainable-backpacks/urban-backpack-nara/', 'Backpack – Nara
', 'https://thela.eco/wp-content/uploads/2023/04/nara_4.1_look_B1.jpg', 145.00, 0, now(), now(), 'Womenswear', 'Crossbody Bags ', 'Form meets function with this minimal, vegan and zero-waste urban backpack, designed for everyday use.
Handmade sustainably in India with 65 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023705, 'https://thela.eco/shop/bags-pouches/sustainable-backpacks/zero-waste-backpack-virai/', 'Backpack – Virai
', 'https://thela.eco/wp-content/uploads/2022/05/virai_1_front.jpg', 140.00, 0, now(), now(), 'Womenswear', 'Crossbody Bags ', 'Form meets function with this minimal, vegan and zero-waste backpack, designed for everyday use.
Handmade sustainably in India with 65 discarded plastic bags.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023706, 'https://thela.eco/shop/jewellery-accessories/silver-earrings/long-silver-earrings-koukaki/', 'Long Silver Earrings – Koukaki
', 'https://thela.eco/wp-content/uploads/2022/05/koukaki-long_1_front.jpg', 50.00, 0, now(), now(), 'Womenswear', 'Eearrings', 'Minimal. Bold. Elegant. The go-to long silver earrings for an effortless look. And of course, they are sustainable.
Handmade sustainably in India with plastic waste and sterling silver.
Every purchase you make removes 10 plastic bottles from the ocean.
', '');
insert into `shesg_product` values (255349023707, 'https://thela.eco/shop/jewellery-accessories/silver-earrings/short-silver-earrings-koukaki/', 'Short Silver Earrings – Koukaki
', 'https://thela.eco/wp-content/uploads/2022/05/koukaki-short_2_look.jpg', 50, 0, now(), now(), 'Womenswear', 'Eearrings', 'Minimal. Bold. Elegant. The go-to short silver earrings for an effortless look. And of course, they are sustainable.
Handmade sustainably in India with plastic waste and sterling silver.
Every purchase you make removes 10 plastic bottles from the ocean.', '');
insert into `shesg_product` values (255349023708, 'https://thela.eco/shop/jewellery-accessories/silver-earrings/short-silver-earrings-anafiotika/', 'Short Silver Earrings – Anafiotika
', 'https://thela.eco/wp-content/uploads/2022/05/anafiotika-short_1_front.jpg', 50.00, 0, now(), now(), 'Womenswear', 'Eearrings', 'Minimal. Bold. Elegant. The go-to short silver earrings for an effortless look. And of course, they are sustainable.
Handmade sustainably in India with plastic waste and sterling silver.
Every purchase you make removes 10 plastic bottles from the ocean', '');
insert into `shesg_product` values (255349023709, 'https://biancaspender.com/collections/new-arrivals/products/khaki-cotton-twill-henri-trench?variant=41070065713288', 'KHAKI COTTON TWILL HENRI TRENCH
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7600_3.jpg?v=1683768685&width=3000', 677.27, 0, now(), now(), 'Shirts', 'new-arrivals', 'Our timeless midi-length trench features a channel through the back waist with a self-belt and D-ring fastening. Crafted in a striking Khaki Cotton Twill blend, making it the perfect lightweight trench.

- Regular fit; midi length
- V neckline
- D-ring adjustable belt
- Classic lapel detail
- Unlined

100% Cotton.

Cold gentle machine wash.
Do not rub, soak or bleach.
Warm iron or Light steam.
Dry cleanable.

Made in Australia.', '');
insert into `shesg_product` values (255349023710, 'https://biancaspender.com/collections/new-arrivals/products/ecru-linen-twill-bellini-dress?variant=40962975924360', 'ECRU LINEN TWILL BELLINI DRESS
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7530_1.jpg?v=1671498501&width=3000', 631.82, 0, now(), now(), 'Shirts', 'new-arrivals', 'A twill linen update of our classic Bellini dress. This flattering, figure-hugging silhouette, cut with gathers through the centre front, balanced with a narrow v-neck and puff blouson relaxed sleeve, elongates the body and draws the eye to give the illusion of a small waist. Finishing below the knee and just above the calf, the drape through the front skirt conceals a split to just above the knee. The dress fastens through the centre back with an invisible zip to the back neck. Made using remnant (deadstock) fabric.
- V-neck, drawstring ruching detail down the front of the dress
- Asymmetrical hemline, adjustable front hem by tying the drawstring differently
- Tuck shoulder detailing, cascading into the relaxed and uncuffed sleeve
- Fastened with invisible zipper at back

Noting: this dress is not lined.
Our model is size 8 AU / 175cm tall and wears a size 1. ', '');
insert into `shesg_product` values (255349023711, 'https://biancaspender.com/collections/new-arrivals/products/camel-coating-essence-coat?variant=41120479936648', 'CAMEL COATING ESSENCE COAT
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7830_7520_7754_3.jpg?v=1681789598&width=3000', 904.55, 0, now(), now(), 'Shirts', 'new-arrivals', 'Effortless sophistication for the day into night and a true investment to finish any look across the seasons. This Camel tone has a warmth that allows it to style back with a multitude of hues. Featuring custom tortoise shell buttons. The trench has a generous fit and finishes mid-calf.
- Upturn sleeves, 3/4
- Pockets
- Wide lapel, thick collar', '');
insert into `shesg_product` values (255349023712, 'https://biancaspender.com/collections/new-arrivals/products/olive-crepe-satin-composition-jacket?variant=41070055850120', 'OLIVE CREPE SATIN COMPOSITION JACKET
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7690_3.jpg?v=1683768752&width=3000', 722.73, 0, now(), now(), 'Shirts', 'new-arrivals', 'Modern tailoring with refined detailing. The Olive Crepe Satin Composition Jacket is the perfect Winter tailoring piece. Style with our matching Olive Crepe Satin Kent Pant for a suiting look.
- Drawstring detailing on front panels, adjustable
- Long front lapel with single-button fastening
- Shoulder pads
- Bigger make. Recommend sizing down. ', '');
insert into `shesg_product` values (255349023713, 'https://biancaspender.com/collections/new-arrivals/products/khaki-devore-bystander-top?variant=40990428889224', 'KHAKI DEVORE BYSTANDER TOP
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/files/7620_4copy.jpg?v=1683768693&width=3000', 359.09, 0, now(), now(), 'Shirts', 'new-arrivals', '



Designed to be worn both ways, the Khaki Devore Bystander Top features a neck tie/pussy bow, long sleeves, and finishes just below the hip. Fabricated in an archived remnant (deadstock) fabric from previous collections.














', '');
insert into `shesg_product` values (255349023714, 'https://biancaspender.com/collections/new-arrivals/products/bronze-silk-misura-skirt?variant=40962982543496', 'BRONZE SILK MISURA SKIRT
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7803.jpg?v=1676260020&width=3000', 495.45, 0, now(), now(), 'Shirts', 'new-arrivals', 'Signature drape imbued with the craftsmanship Bianca Spender is known for in our new Bronze silk. This soft A-line midi-length skirt features a subtle twist at the front waist. A split through the front is concealed in the twist for ease of wear. The skirt fasts with an invisible at the centre-back.
- Drapey relaxed fit
- Non-stretch waistband
- Knee-high slit to the front
- Invisible zip at back closure ', '');
insert into `shesg_product` values (255349023715, 'https://biancaspender.com/collections/new-arrivals/products/olive-crepe-satin-kent-pant?variant=41070056898696', 'OLIVE CREPE SATIN KENT PANT
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/78021_07117a52-9b40-4b6b-a2c6-7c47e9fecee5.jpg?v=1677544125&width=3000', 450.00, 0, now(), now(), 'Shirts', 'new-arrivals', 'Refined comfort and a twist on power suiting. The Olive Crepe Satin Kent Pant are a relaxed fit high rise trouser. Style with our matching Olive Crepe Satin Composition Jacket for a statement suit.
- Front pleats
- Zip fly fastening
- Straight leg style
- Bigger make. Recommend sizing down. ', '');
insert into `shesg_product` values (255349023716, 'https://biancaspender.com/collections/new-arrivals/products/black-leatherette-cyrano-top?variant=41120479707272', 'BLACK LEATHERETTE CYRANO TOP
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7752_4.jpg?v=1683768194&width=3000', 313.64, 0, now(), now(), 'Shirts', 'new-arrivals', 'A Leatherette adaption of our Circa shirt. The Cyrano Top features a deep slit in the front neck and a cap shirt sleeve.
- Collarless V-neck blouse
- Finishes on hips', '');
insert into `shesg_product` values (255349023717, 'https://biancaspender.com/collections/new-arrivals/products/ecru-linen-twill-diane-top?variant=40962976186504', 'ECRU LINEN TWILL DIANE TOP
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7531_4.jpg?v=1683768452&width=3000', 313.64, 0, now(), now(), 'Shirts', 'new-arrivals', 'The Diane top is an asymmetrical cut-out tank top. It features a cut-out on the right torso, piping detailing around the neckline and cut-out, and is designed to sit just below the hips. Made in remnant (deadstock) linen twill fabric.
- Bust darts
- Thick straps
- Asymmetric neckline
Our model is size 8 AU / 175cm tall and wears a size 1. ', '');
insert into `shesg_product` values (255349023718, 'https://biancaspender.com/collections/new-arrivals/products/olive-crepe-satin-mori-mini-dress?variant=41070056374408', 'OLIVE CREPE SATIN MORI MINI DRESS
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7692_2_f51b85be-6414-4a18-8888-fbd3708cddd6.jpg?v=1677544048&width=3000', 631.82, 0, now(), now(), 'Shirts', 'new-arrivals', 'Effortlessly flattering, the Olive Crepe Satin Mori Mini dress, made in our remnant (deadstock fabric) is a gorgeous Winter party style.
- Off centre cowl neckline
- Long sleeves
- Finishes at the mid thigh/above the knee
- Waist-tie detailing', '');
insert into `shesg_product` values (255349023719, 'https://biancaspender.com/collections/new-arrivals/products/embrace-silk-butterfly-dress?variant=40687045050504', 'EMBRACE SILK BUTTERFLY DRESS
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/6910FRONT.jpg?v=1677550454&width=3000', 722.73, 0, now(), now(), 'Shirts', 'new-arrivals', 'Fun in floral. Cut in a sheer, distorted floral and contrast, bold, stripe print, this beautifully crafted dress features an asymmetric hemline and a bold draping detailed sleeve in this striking stripe print.
- Waste button closure, wrap dress
- Fully lined
- Draped pieces cascading from the bodice neckline', '');
insert into `shesg_product` values (255349023720, 'https://biancaspender.com/collections/new-arrivals/products/bronze-silk-isabella-gown?variant=40962981789832', 'BRONZE SILK ISABELLA GOWN
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/78003.jpg?v=1683768399&width=3000', 1086.36, 0, now(), now(), 'Shirts', 'new-arrivals', 'The Isabella Gown exudes glamour and sophistication. The gown is cut from lustrous Bronze silk satin and gracefully falls to the ground, skimming the body. It features a high neckline and a delicate side adjustable belt that cinches in at the waist, creating a stunning feminine silhouette.

- Regular fit; full-length
- High neckline
- Side adjustable belt
- Button fastening at the back', '');
insert into `shesg_product` values (255349023721, 'https://biancaspender.com/collections/new-arrivals/products/olive-crepe-satin-crosby-dress?variant=41070056112264', 'OLIVE CREPE SATIN CROSBY DRESS
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/7691_2.jpg?v=1677544002&width=3000', 677.27, 0, now(), now(), 'Shirts', 'new-arrivals', 'Derived from our Circa top, a winning style into a wearable statement dress. The Crosby dress made in our Remnant (deadstock) Olive crepe satin fabric, is the epitome of day to night. Dress up with a heel or boot, dress down with a sandal.
- Cap sleeve detailing
- Gathered neckline
- Adjustable drawstring gather detailing on side
- Midi length
- Centre back button fastening', '');
insert into `shesg_product` values (255349023722, 'https://biancaspender.com/collections/new-arrivals/products/embrace-silk-ford-gown?variant=40853352808584', 'EMBRACE SILK FORD GOWN
', 'https://cdn.shopify.com/s/files/1/0373/2642/2152/products/6900FRONT.jpg?v=1677550465&width=3000', 677.27, 0, now(), now(), 'Shirts', 'new-arrivals', 'An elegant nighttime version of our Bellini dress, the Ford Gown features a deep V neck with a drawstring front detail down the middle of the gown. It hugs the body and features a racer back and zip fastening', '');
insert into `shesg_product` values (255349023723, 'https://swedishstockings.com/products/tuva-sculpting-tights-beige', 'TUVA SCULPTING TIGHTS
', 'https://swedishstockings.com/cdn/shop/products/112007112-tuva-sculpting-tights-beige-swedish-stockings-1_5682dbb6-f762-48c0-8e9d-337ad194f14e.jpg?v=1679321720&width=780', 41.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Tuva is our sculpting tights, created to fit and shape you. You’re looking for the perfect control top? Try them out! Please note that this style has an extra firm control top, making them hard to put on. Size up if unsure and follow our care guide for instructions on how to put them on. Here\'s why you\'ll love Tuva as much as we do:
20 denier control top tights
Sheer
Extra firm control top
Flat seams
Toe reinforcement
Cotton gusset
Knitted from recycled yarn
Made in Italy', '');
insert into `shesg_product` values (255349023724, 'https://swedishstockings.com/products/maja-flower-tights-ivory', 'MAJA FLOWER TIGHTS
', 'https://swedishstockings.com/cdn/shop/products/113047901-maja-flower-tights-ivory-swedish-stockings-2_x2400.jpg?v=1673446534', 47.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Lace tights in a graphic floral design. Here’s why you’ll love Maja:
30 denier lace tights
Semi-sheer
Soft and broad waistband
Flat seams
Toe reinforcement
Cotton gusset
Knitted from recycled yarn
Made in Italy
', '');
insert into `shesg_product` values (255349023725, 'https://swedishstockings.com/products/livia-shaping-shorts-beige', 'LIVIA SEAMLESS SHAPING SHORTS
', 'https://swedishstockings.com/cdn/shop/products/112006112-livia-shaping-shorts-beige-swedish-stockings-2_x2400.jpg?v=1679039945', 62.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Livia is a pair of seamless shaping shorts with medium shaping throughout. Invisible under dresses and skirts, they enhance your curves and gives you a smooth silhouette. Here\'s why you\'ll love Livia as much as we do:
Seamless shaping shorts
Opaque
Medium shaping throughout
Broad waistband
Knitted from recycled yarn
Made in Italy

90% recycled polyamide, 10 % recycled elastane
', '');
insert into `shesg_product` values (255349023726, 'https://swedishstockings.com/products/tuva-sculpting-tights-black', 'TUVA SCULPTING TIGHTS
', 'https://swedishstockings.com/cdn/shop/products/112007001-tuva-sculpting-tights-black-swedish-stockings-1_e0da6222-bd48-46d4-9a0c-077425b078c9_x2400.jpg?v=1679321714', 41, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'uva is our sculpting tights, created to fit and shape you. You’re looking for the perfect control top? Try them out! Please note that this style has an extra firm control top, making them hard to put on. Size up if unsure and follow our care guide for instructions on how to put them on. Here\'s why you\'ll love Tuva as much as we do:
20 denier control top tights
Sheer
Extra firm control top
Flat seams
Toe reinforcement
Cotton gusset
Knitted from recycled yarn
Made in Italy

90% recycled polyamide, 10 % recycled elastane
', '');
insert into `shesg_product` values (255349023727, 'https://swedishstockings.com/products/maja-flower-tights-black', 'MAJA FLOWER TIGHTS
', 'https://swedishstockings.com/cdn/shop/products/113047001-maja-flower-tights-swedish-stockings-1_4eb32f88-e302-4699-a4c5-53fcdc88b60d_x2400.jpg?v=1680192978', 47.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Lace tights in a graphic floral design. Here’s why you’ll love Maja:
30 denier lace tights
Semi-sheer
Soft and broad waistband
Flat seams
Toe reinforcement
Cotton gusset
Knitted from recycled yarn
Made in Italy

90% recycled polyamide, 10 % recycled elastane
', '');
insert into `shesg_product` values (255349023728, 'https://swedishstockings.com/products/thea-cotton-socks-black', '2-PACK THEA COTTON SOCKS
', 'https://swedishstockings.com/cdn/shop/products/191012001-thea-cotton-socks-black-swedish-stockings-1_5181a9fe-6825-41e8-bff9-b189b4b0dab3_x2400.jpg?v=1679671013', 47.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Ultra thin, breathable socks in recycled polyamide and organic cotton. Here\'s why you\'ll love Thea:
2-pack knit socks
Semi-opaque
Soft cuff
Toe and heel reinforcements for durability
Knitted from recycled yarn and organic cotton
Produced by Emy Calze S.r.l.
Made in Italy

50% SENSIL® EcoCare recycled polyamid, 43% organic cotton, 7% elastane
', '');
insert into `shesg_product` values (255349023729, 'https://swedishstockings.com/products/livia-shaping-shorts-black', 'LIVIA SEAMLESS SHAPING SHORTS
', 'https://swedishstockings.com/cdn/shop/products/112006001-livia-shaping-shorts-black-swedish-stockings-4_x2400.jpg?v=1679039938', 62.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Livia is a pair of seamless shaping shorts with medium shaping throughout. Invisible under dresses and skirts, they enhance your curves and gives you a smooth silhouette. Here\'s why you\'ll love Livia as much as we do:
Seamless shaping shorts
Opaque
Medium shaping throughout
Broad waistband
Knitted from recycled yarn
Made in Italy

82% recycled polyamide, 18% elastane
', '');
insert into `shesg_product` values (255349023730, 'https://swedishstockings.com/products/wilma-soft-bra-lavender', 'WILMA SOFT BRA
', 'https://swedishstockings.com/cdn/shop/products/301001302-wilma-soft-bra-lavender-swedish-stockings-1_jpg_x2400.jpg?v=1673446627', 58.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Soft and comfortable. Here’s why you’ll love Wilma:
Seamless soft bra
Opaque
Broad monogrammed elastic
Knitted from recycled yarns
Produced by Athena Calze S.r.l.
Made in Italy

92% Q-NOVA® recycled polyamide, 8% elastane
', '');
insert into `shesg_product` values (255349023731, 'https://swedishstockings.com/products/tyra-rib-leggings-lavender', 'TYRA RIB LEGGINGS', 'https://swedishstockings.com/cdn/shop/products/131003302-tyra-rib-leggings-lavender-swedish-stockings-1_jpg_jpg_x2400.jpg?v=1673446557', 79.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Tyra has a ribbed texture for a dressed look, and seamless fit following your every curve. Here\'s why you\'ll love Tyra as much as we do:
Seamless ribbed leggings
Opaque
Broad monogrammed waistband
Knitted from recycled yarns
Produced by Athena Calze S.r.l.
Made in Italy

92% Q-NOVA® recycled polyamide, 8% elastane
', '');
insert into `shesg_product` values (255349023732, 'https://swedishstockings.com/products/rita-one-piece-black#shopify-product-reviews', 'RITA ONE PIECE
', 'https://swedishstockings.com/cdn/shop/products/370001001-rita-one-piece-black-swedish-stockings-3_x2400.jpg?v=1678788960', 120.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'With light shaping for a smoothing silhouette, Rita One Piece is a versatile and flattering body suit. Here\'s why you\'ll love Rita:
Seamless one piece with thin shoulder straps
Opaque
Light shaping around the waist
Knitted from recycled yarns
Made in Italy

95% recycled polyamide, 5% elastane
', '');
insert into `shesg_product` values (255349023733, 'https://swedishstockings.com/products/wilma-soft-bra-sage', 'WILMA SOFT BRA
', 'https://swedishstockings.com/cdn/shop/products/301001408-wilma-soft-bra-sage-swedish-stockings-1_x2400.jpg?v=1673446634', 58.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Soft and comfortable. Here’s why you’ll love Wilma:
Seamless soft bra
Opaque
Broad monogrammed elastic
Knitted from recycled yarns
Produced by Athena Calze S.r.l.
Made in Italy

92% Q-NOVA® recycled polyamide, 8% elastane
', '');
insert into `shesg_product` values (255349023734, 'https://swedishstockings.com/products/svea-premium-tights-navy', 'SVEA PREMIUM TIGHTS
', 'https://swedishstockings.com/cdn/shop/products/111005200-svea-premium-tights-navy-swedish-stockings-2.jpg?v=1671177556&width=780', 33.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Silky, smooth and semi-sheer, Svea is here! Here are the reasons why you’ll love Svea us much as we do:
30 denier tights
Semi-sheer
Comfort waistband
Flat seams
Toe reinforcement
Cotton gusset
Knitted from recycled yarn
Produced by Calze Ileana S.p.a.
Made in Italy

89% SENSIL® EcoCare recycled polyamide, 11% elastane
', '');
insert into `shesg_product` values (255349023735, 'https://swedishstockings.com/products/rita-one-piece-grey', 'RITA ONE PIECE
', 'https://swedishstockings.com/cdn/shop/products/370001007-rita-one-piece-grey-swedish-stockings-2_x2400.jpg?v=1678788970', 120.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'With light shaping for a smoothing silhouette, Rita One Piece is a versatile and flattering body suit. Here\'s why you\'ll love Rita:
Seamless one piece with thin shoulder straps
Opaque
Light shaping around the waist
Knitted from recycled yarns
Made in Italy

95% recycled polyamide, 5% elastane
', '');
insert into `shesg_product` values (255349023736, 'https://swedishstockings.com/products/alicia-grid-socks-black', 'ALICIA GRID SOCKS', 'https://swedishstockings.com/cdn/shop/products/191010001-alicia-grid-socks-black-swedish-stockings-1_5b4ae7b1-e66c-4401-ade6-37d7875373f1_x2400.jpg?v=1679671001', 40.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'The graphic, geometrical design of these socks will not go unnoticed. Here\'s why you\'ll love Alicia:
Knitted
Soft cuff
Toe and sole reinforcements for durability
Knitted from recycled yarn
Made in Italy

97% recycled polyamide, 3% elastane
', '');
insert into `shesg_product` values (255349023737, 'https://swedishstockings.com/products/lois-rip-resistant-tights-bundle', 'LOIS RIP RESISTANT TIGHTS BUNDLE: 2 PAIRS
', 'https://swedishstockings.com/cdn/shop/products/401023001-2-pack-lois-rip-resistant-tights-black-swedish-stockings_x2400.jpg?v=1677582942', 178.00, 0, now(), now(), 'Basics & Intimates', 'New Arrivals
', 'Buy Lois Tights as a 2-pack and save 15%! Lois is the world’s first rip resistant tights made from recycled materials. Developed with Sheertex® Knit Technology, using one of the world’s strongest polymers for long-lasting wear. Lasts an estimated 10 times longer than traditional tights. Here\'s why you will love Lois as much as we do:
40 denier, sheer rip resistant tights
Sheertex® Knit Technology
Soft and broad waistband
Toe reinforcement
Cotton gusset
Made in Canada
Read more about Lois and Sheertex
30 days warranty

56% recycled polyamide, 29% polyethylene, 12.5% elastane, 0.5% polyester.
', '');
insert into `shesg_product` values (255349023738, 'https://byherth.com/products/khay-gots-organic-silk-culottes', 'KHAY ALMOND: GOTS ORGANIC SILK CULOTTES', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/Silkculotteconsciousluxurygotssilkhaybyherth_400x.png?v=1668070141', 209.703, 0, now(), now(), 'Basics & Intimates', 'khay-gots-organic-silk-culottes', 'Crafted from lustrous GOTS Certified Organic Silk, the Khay bottoms has a mid-rise fit with an elasticated waistband for a comfortable fit.
Wear them with the coordinated Eve bralette. A breathable silk set, ultra-light, hyper soft, naturally thermoregulating and hypoallergenic.
Mid-rise fit
Elasticated bandwaist
Composition: 100% GOTS certified organic silk sourced from Como. It does not contain elastane
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by skilled artisans
Model is cm and is wearing size S
The benefits of wearing Silk', '');
insert into `shesg_product` values (255349023739, 'https://byherth.com/collections/day-to-night/products/else-gots-organic-silk-v-neck-tank', 'BUTTER-COLORED TOP, GOTS CERTIFIED SILK', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/ElegantSilktopsustainableclothingbyherth_800x1200.png?v=1665321443', 306.49, 0, now(), now(), 'Basics & Intimates', 'ELSE: BUTTER-COLORED TOP, GOTS CERTIFIED SILK', 'Embrace the spirit of the new season with Else. Designed in a relaxed silhouette, it is a representation of effortless elegance with clean, modern line. Ethically crafted from the highest quality GOTS Certified Organic Silk, it looks just as good with the matching Yari shorts as an effortless chic set or styled with jeans for casual plans.
Skinny shoulder straps, deep V-neck front, relaxed fit
For an oversized fit take one size larger
Composition: 100% GOTS certified organic silk sourced from Como. It does not contain elastane
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 177 cm and is wearing size Small
The Benefits of wearing Silk: ', '');
insert into `shesg_product` values (255349023740, 'https://byherth.com/collections/day-to-night/products/cora-black-gots-organic-silk-round-neck-top', 'CORA BLACK: GOTS ORGANIC SILK TOP', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/Cora-tops-in-seta-biologica-byherth_0d55752d-c8cc-469e-b2ba-cec1028243c5_1200x1200.png?v=1680257260', 327.997, 0, now(), now(), 'Basics & Intimates', 'CORA BLACK: GOTS ORGANIC SILK TOP', 'The silhouette of a classic T-shirt with an ever-so stylish take: round neck, relaxed fit and breathable pure GOTS Certified Organic Silk.
A versatile yet chic mainstay that will take you from everyday to the weekend and beyond. Style it with the coordinating Roy trousers or Yari shorts for a chic monochrome vibe or wear it with jeans for a day to evening look.
Round neck, relaxed fit with a buttoned keyhole at the nape
For an oversized fit take one size larger
Composition: 100% GOTS certified organic silk sourced from Como. It does not contain elastane
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 175 cm and is wearing size Small
The Benefits of wearing Silk:', '');
insert into `shesg_product` values (255349023741, 'https://byherth.com/collections/silkwear/products/andie-black-gots-organic-silk-long-sleeve-top', 'ANDIE BLACK: GOTS ORGANIC SILK T-SHIRT, BLACK COLOR', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/Completoneroinsetaandreiezenobyherth_800x1200.png?v=1665320483', 375.00, 0, now(), now(), 'Basics & Intimates', 'ANDIE BLACK: GOTS ORGANIC SILK T-SHIRT, BLACK COLOR', 'Endlessly versatile style that will keep you chic and cozy all season long. The Andie t-shirt is made from 100% soft GOTS Certified Organic Silk sourced from Como. Cut for a relaxed fit and shaped in a sleek silhouette with a round neck and long sleeves.
Wear yours with everything from Zeno trousers or Roy pants to denim.
Round neck, long sleeve, relaxed fit with a buttoned keyhole at the nape
For an oversized fit take one size larger
Composition: 100% GOTS certified organic silk sourced from Como. It does not contain elastane
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 175 cm and is wearing size Small
The Benefits of wearing Silk:', '');
insert into `shesg_product` values (255349023742, 'https://byherth.com/collections/silkwear/products/ivy-orchid-gots-organic-silk-soft-triangle-bra', 'IVY HOT PINK: GOTS ORGANIC SILK LUXURY BRA', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/reggisenoatriangoloinsetabyherth_a639817f-b017-4242-afaa-4dc6f1b65c5c_510x840.png?v=1665641792', 195.00, 0, now(), now(), 'Basics & Intimates', 'IVY HOT PINK: GOTS ORGANIC SILK LUXURY BRA', 'There is a bra to wear everywhere, and its name is Ivy. Consciously and impeccably crafted from breathable 100% GOTS Certified Organic Silk, it’s the perfect intersection of everyday and elegance. Wear it as a top under a blazer or under a shirt. It’s too beautiful to keep hidden.
Non-wired, soft-cup triangle bra with a partially elasticated back band for a more comfortable fit
Slim adjustable straps
Gold rings and back hook closure
Composition: 100% GOTS certified organic silk sourced from Como. It does not contain elastane
Hardware: metal parts in nickel free Zamak
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 177 cm and is wearing size Small
The Benefits of wearing Silk:', '');
insert into `shesg_product` values (255349023743, 'https://byherth.com/collections/silkwear/products/nyx-ivory-gots-organic-silk-bodysuit', 'NYX BLACK: GOTS ORGANIC SILK BODYSUIT', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/Blacksilkbodysuitbyherth_700x1050.png?v=1680254624', 305.00, 0, now(), now(), 'Basics & Intimates', 'NYX BLACK: GOTS ORGANIC SILK BODYSUIT', 'Slip into a cool, effortless vibrancy, with our Nyx.
Craftsmanship, curated details, and minimalist silhouette meet contemporary elegance in our newest bodysuit. Designed to adapt perfectly to your body for a comfortable yet cool fit, the Nyx bodysuit delivers the stylish upgrade for a cooler conscious wardrobe.
Wide scoop neck, slim adjustable straps and high-rise waist slim elasticated band. The high cut leg design is embellished with a flounced hemline
Gold rings
Designed to fit your body perfectly
Composition: 100% GOTS Certified Organic Silk sourced from Como. It does not contain elastane
Hardware: metal parts in nickel free Zamak
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 175 cm and is wearing size Small', '');
insert into `shesg_product` values (255349023744, 'https://byherth.com/collections/silkwear/products/keri-gots-organic-silk-soft-triangle-bra', 'KERI GOLD SAND: MINIMAL SAND COLOR BRA', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/LuxurySilklingeriebyherth_700x1050.png?v=1680207957', 135.00, 0, now(), now(), 'Basics & Intimates', 'KERI GOLD SAND: MINIMAL SAND COLOR BRA', 'The signature Keri feels as special as it looks. Minimalist aesthetic and lightweight define this latest chic Essential. Handcrafted from 100% GOTS Certified Organic Silk, it’s designed to enable you to customize the perfect fit and feels completely weightless, so you can imagine how comfortable it is.
Exceptionally soft, comfy and, stylish it’s perfect under a blazer or shirt and styled with the matching Roy trousers for a sleek look.
Non-wired, soft-cup triangle bra with a thin and adjustable band to ensure the perfect fit
Slim adjustable straps
Gold rings and back hook closure
Composition: 100% GOTS certified organic silk sourced from Como, it does not contain elastane
Hardware: metal parts in nickel free Zamak
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 175 cm and is wearing size Small', '');
insert into `shesg_product` values (255349023745, 'https://byherth.com/collections/silkwear/products/else-gots-organic-silk-v-neck-tank', 'ELSE: BUTTER-COLORED TOP, GOTS CERTIFIED SILK', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/TopinsetabiologicagotsElsebyherth_1300x1300.png?v=1665322909', 285.00, 0, now(), now(), 'Basics & Intimates', 'ELSE: BUTTER-COLORED TOP, GOTS CERTIFIED SILK', 'Embrace the spirit of the new season with Else. Designed in a relaxed silhouette, it is a representation of effortless elegance with clean, modern line. Ethically crafted from the highest quality GOTS Certified Organic Silk, it looks just as good with the matching Yari shorts as an effortless chic set or styled with jeans for casual plans.
Skinny shoulder straps, deep V-neck front, relaxed fit
For an oversized fit take one size larger
Composition: 100% GOTS certified organic silk sourced from Como. It does not contain elastane
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 177 cm and is wearing size Small', '');
insert into `shesg_product` values (255349023746, 'https://byherth.com/collections/silkwear/products/nyx-ivory-gots-organic-silk-bodysuit', 'NYX BLACK: GOTS ORGANIC SILK BODYSUIT', 'https://cdn.shopifycdn.net/s/files/1/0521/6393/6447/products/Bodyblacksilkluxurylingeriebyherth_1800x1800.png?v=1680254624', 305.00, 0, now(), now(), 'Basics & Intimates', 'NYX BLACK: GOTS ORGANIC SILK BODYSUIT', 'Slip into a cool, effortless vibrancy, with our Nyx.
Craftsmanship, curated details, and minimalist silhouette meet contemporary elegance in our newest bodysuit. Designed to adapt perfectly to your body for a comfortable yet cool fit, the Nyx bodysuit delivers the stylish upgrade for a cooler conscious wardrobe.
Wide scoop neck, slim adjustable straps and high-rise waist slim elasticated band. The high cut leg design is embellished with a flounced hemline
Gold rings
Designed to fit your body perfectly
Composition: 100% GOTS Certified Organic Silk sourced from Como. It does not contain elastane
Hardware: metal parts in nickel free Zamak
Skin friendly: natural dyes. No chemicals or pesticides
Made in Italy by expert artisans
Model is 175 cm and is wearing size Small', '');
insert into `shesg_product` values (255349023747, 'https://mashu.co.uk/collections/all/products/irene-pink-1?variant=43555300016315', 'Irene Bubblegum Pink', 'https://mashu.co.uk/cdn/shop/products/0B9A1084r_3000x.jpg?v=1665055391', 279.60, 0, now(), now(), 'Bags', 'Home All Irene Bubblegum Pink', 'Irene is a soft mini bag (our first take on soft bags since all our bags have been structured) Comes with a zip to keep your belongings safe and our signature T-Bar plated brass design on the strap (just decorative). Has an internal branded pocket. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023748, 'https://mashu.co.uk/collections/all/products/cassiopeia-navy?variant=43555358277819', 'Cassiopeia Navy', 'https://mashu.co.uk/cdn/shop/products/R6S_6665_3000x.jpg?v=1665056577', 473.18, 0, now(), now(), 'Bags', 'Home All Cassiopeia Navy', 'Meet Cassiopeia - our interpretation of the classic bucket bag. Beautiful in her appearance and practical in her design, the Cassiopeia bag features multiple compartments and an internal pouch to keep you organised. Featuring our signature hammered hardware handle, she is the ultimate day-to-day bag that will
Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023749, 'https://mashu.co.uk/collections/all/products/penelope-cinnamon?variant=43555535356091', 'Penelope Cinnamon', 'https://mashu.co.uk/cdn/shop/products/R6S_6532_3000x.jpg?v=1666083597', 494.68, 0, now(), now(), 'Bags', 'Home All Penelope Cinnamon', 'Penelope is our XL, do-it-all tote bag. Featuring our signature wavy cut and framed by our structured, square handles, she will stand out in the crowd for all the right reasons. Made from re-purposed wood, our handles are handmade by expert wood artisans using Greek Oak from.Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023750, 'https://mashu.co.uk/collections/all/products/crossbody-strap?variant=44595161596091', 'Crossbody Strap', 'https://mashu.co.uk/cdn/shop/files/03_6b7bf860-bb42-4d0e-a3d1-abd3206a4a67_3000x.jpg?v=1683107313', 59.15, 0, now(), now(), 'Bags', 'Home All Crossbody Strap', 'Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023751, 'https://mashu.co.uk/collections/all/products/mashu-gift-card?variant=42279901200571', 'Mashu Gift Card', 'https://mashu.co.uk/cdn/shop/products/f_e4485321-f1bc-4b3c-94ea-b58b12e2d6fa_3000x.png?v=1637246350', 107.54, 0, now(), now(), 'Bags', 'Home All Mashu Gift Card', 'Give someone you love the joy of choosing their own Mashu bag with our gift card option. We will email the receiver a digital code that they can shop with at checkout. It\'s that simple! Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023752, 'https://mashu.co.uk/collections/tote-bags/products/cassiopeia-cork-and-white?variant=42069563900091', 'Cassiopeia Cork and White', 'https://mashu.co.uk/cdn/shop/products/MASHU_AW2117203_retouch_3000x.jpg?v=1654938578', 473.18, 0, now(), now(), 'Bags', 'Home Tote Bags Cassiopeia Cork and White', 'Meet Cassiopeia - our interpretation of the classic bucket bag. Beautiful in her appearance and practical in her design, the Cassiopeia bag features multiple compartments and an internal pouch to keep you organised. Featuring our signature hammered hardware handle, she is the ultimate day-to-day bag that will.Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023753, 'https://mashu.co.uk/collections/gift-guide/products/philippa-blue-and-white?variant=42965812281531', 'Philippa 2 Blue and White', 'https://mashu.co.uk/cdn/shop/products/057C7452_corrected_3000x.jpg?v=1653924314', 295.00, 0, now(), now(), 'Bags', 'Home Gift Guide Philippa 2 Blue and White', 'The classic baguette bag just got an upgrade...Meet Philippa 2! An evolution of our best-selling original Philippa bag, Philippa 2 features a signature wavy flap with magnetic fastening and our favourite T-Bar hammered hardware. Comes with a removable shoulder strap. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023754, 'https://mashu.co.uk/collections/baguette-bags/products/philippa-2-black?variant=43148575408315', 'Philippa 2 Green', 'https://mashu.co.uk/cdn/shop/products/06.12.209945_3000x.jpg?v=1632665878', 317.24, 0, now(), now(), 'Bags', 'Home Baguette Bags Philippa 2 Black', 'The classic baguette bag just got an upgrade...Meet Philippa 2! An evolution of our best-selling original Philippa bag, Philippa 2 features a signature wavy flap with magnetic fastening and our favourite T-Bar hammered hardware. Comes with a removable shoulder strap. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023755, 'https://mashu.co.uk/collections/baguette-bags/products/philippa-green?variant=42965810872507', 'Philippa 2 Green', 'https://mashu.co.uk/cdn/shop/products/057C7311_3000x.jpg?v=1653907586', 295.00, 0, now(), now(), 'Bags', 'Home Baguette Bags Philippa 2 Green', 'The classic baguette bag just got an upgrade...Meet Philippa 2! An evolution of our best-selling original Philippa bag, Philippa 2 features a signature wavy flap with magnetic fastening and our favourite T-Bar hammered hardware. Comes with a removable shoulder strap. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023756, 'https://mashu.co.uk/collections/baguette-bags/products/philippa-2-brown?variant=43555335962811', 'Sophia 2 Merlot', 'https://mashu.co.uk/cdn/shop/products/Screenshot2022-10-18at11.51.07AM_3000x.png?v=1666083332', 295.00, 0, now(), now(), 'Bags', 'Home Gift Guide Sophia 2 Merlot', 'The classic baguette bag just got an upgrade...Meet Philippa 2! An evolution of our best-selling original Philippa bag, Philippa 2 features a signature wavy flap with magnetic fastening and our favourite T-Bar hammered hardware. Comes with a removable shoulder strap. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023757, 'https://mashu.co.uk/collections/mini-bags/products/irene-pink?variant=42991320531131', 'Irene Pink', 'https://mashu.co.uk/cdn/shop/products/057C7119_3000x.jpg?v=1653934902', 230.00, 0, now(), now(), 'Bags', 'Home Mini Bags Irene Pink', 'Irene is a soft mini bag (our first take on soft bags since all our bags have been structured) Comes with a zip to keep your belongings safe and our signature T-Bar plated brass design on the strap (just decorative). Has an internal branded pocket. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023758, 'https://mashu.co.uk/collections/mini-bags/products/calliope-creme?variant=43555044262075', 'Calliope Creme', 'https://mashu.co.uk/cdn/shop/products/0B9A9394r_3000x.jpg?v=1665049849', 345.00, 0, now(), now(), 'Bags', 'Home Mini Bags Calliope Creme', 'Calliope is a structured mini bag with our signature wiggle handle in plated Brass. It\'s compact compartment closes with two snap buttons on the sides or you can choose to leave her open depending on the shape and space within the bag you need.
Features an internal branded pocket and comes with a detachable crossbody strap  (W:1 cm x L: 106 cm).
Height: 19cm
Width: 22cm
Depth: 8cm
-106 cm crossbody removable strap
-Designed in London, handcrafted in Athens
We plant 5 trees with your purchase via Treeapp.Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023759, 'https://mashu.co.uk/collections/mini-bags/products/sophia-pearl?variant=42497956872379', 'Sophia Pearl', 'https://mashu.co.uk/cdn/shop/products/shot_04_463_3000x.jpg?v=1632666028', 165.00, 0, now(), now(), 'Bags', 'Home Mini Bags Sophia Pearl', 'Looking for the perfect mini bag? Meet Sophia. With her show-stopping scrunchy handles and structured form, she is comfy to wear and stylish to look at. Small but mighty, Sophia features a metal zip fastening and internal pocket and will fit all of your essentials.Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023760, 'https://mashu.co.uk/collections/mini-bags/products/sophia-2-merlot?variant=41769327722683', 'Nicole White', 'https://mashu.co.uk/cdn/shop/products/Screenshot2022-10-18at11.58.43AM_3000x.png?v=1666083539', 300.00, 0, now(), now(), 'Bags', 'Home Gift Guide Nicole White', 'Nicole is our vintage purse with a contemporary twist. Featuring a custom made frame, each bag is crafted by our expert artisans using plated brass. Her internal pocket fits all your essentials, and her dual strap option means she\'s the perfect versatile occasion bag. Opt for her detachable strap that you can wear crossbody or choose her detachable shoulder strap.Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023761, 'https://mashu.co.uk/collections/gift-guide/products/philippa-blue-and-white?variant=42965812281531', 'Philippa 2 Blue and White', 'https://mashu.co.uk/cdn/shop/products/057C7452_corrected_3000x.jpg?v=1653924314', 295.00, 0, now(), now(), 'Bags', 'Home Gift Guide Philippa 2 Blue and White', 'The classic baguette bag just got an upgrade...Meet Philippa 2! An evolution of our best-selling original Philippa bag, Philippa 2 features a signature wavy flap with magnetic fastening and our favourite T-Bar hammered hardware. Comes with a removable shoulder strap. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023762, 'https://mashu.co.uk/collections/gift-guide/products/aphrodite-camel?variant=41742149681339', 'Aphrodite Camel', 'https://mashu.co.uk/cdn/shop/products/06.12.2015131copy_3000x.jpg?v=1645436122', 300.00, 0, now(), now(), 'Bags', 'Home Gift Guide Aphrodite Camel', 'Named after Aphrodite - the goddess of beauty, a name has never felt more appropriate for a bag. The Aphrodite is an ode to the classic shoulder bag, featuring a signature Mashu twist with wavy lines and hammered hardware t-bar fastening. Includes an internal pocket. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023763, 'https://mashu.co.uk/collections/gift-guide/products/aphrodite-pink?variant=41680373874875', 'Aphrodite Pink', 'https://mashu.co.uk/cdn/shop/products/MASHU_AW2116812_retouch_corr_3000x.jpg?v=1637657174', 300.00, 0, now(), now(), 'Bags', 'Home Gift Guide Aphrodite Pink', 'Named after Aphrodite - the goddess of beauty, a name has never felt more appropriate for a bag. The Aphrodite is an ode to the classic shoulder bag, featuring a signature Mashu twist with wavy lines and hammered hardware t-bar fastening. Includes an internal pocket. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023764, 'https://mashu.co.uk/collections/gift-guide/products/philippa-2-brown?variant=43555335962811', 'Philippa 2 Brown', 'https://mashu.co.uk/cdn/shop/products/Screenshot2022-10-18at11.51.07AM_3000x.png?v=1666083332', 295.00, 0, now(), now(), 'Bags', 'Home Gift Guide Philippa 2 Brown', 'The classic baguette bag just got an upgrade...Meet Philippa 2! An evolution of our best-selling original Philippa bag, Philippa 2 features a signature wavy flap with magnetic fastening and our favourite T-Bar hammered hardware. Comes with a removable shoulder strap. Between outings, we recommend storing your Mashu in its dustbag. When out, be careful of abrasive surfaces. Avoid contact with harsh chemicals or any substance containing alcohol, including perfumes, cosmetics or hand sanitisers, as they can result in discolouration or permanent damage. To clean, use a soft dry cloth. ', '');
insert into `shesg_product` values (255349023765, 'https://up-fuse.com/collections/pocket-wallet/products/pocket-wallet-monopoly?variant=44651265392931', 'Pocket Wallet- Monopoly', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/5-front.jpg?v=1681051676&width=3000', 495.00, 0, now(), now(), 'Bags', 'Pocket Wallet- Monopoly', 'Our wallet are crafted using eco-friendly materials to ensure maximum durability and sustainability.They are designed with convenience and style in mind, featuring a sleek and slim design that will fit easily in your purse. With a variety of colors to choose from.Want to know more about the people behind your product? Visit this pageBecause they’re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023766, 'https://up-fuse.com/collections/pocket-wallet/products/pocket-wallet-white-confetti?variant=44651266081059', 'Pocket Wallet- White Confetti', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/6-key-chain.jpg?v=1681051687&width=3000', 311.00, 0, now(), now(), 'Bags', 'Pocket Wallet- White Confetti', 'Our wallet are crafted using eco-friendly materials to ensure maximum durability and sustainability.They are designed with convenience and style in mind, featuring a sleek and slim design that will fit easily in your purse. With a variety of colors to choose from.Want to know more about the people behind your product? Visit this pageIMPORTANTBecause they’re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023767, 'https://up-fuse.com/collections/laptop-sleeves/products/folder-laptop-sleeve-white-confetti?variant=44651131765027', 'Folder Laptop Sleeve - White Confetti', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/IMG_3083.jpg?v=1681050066&width=3000', 715.00, 0, now(), now(), 'Bags', 'Folder Laptop Sleeve - White Confetti', 'Outer pocket
Padded interior
Flap
Waterproof exterior
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Eacplastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023768, 'https://up-fuse.com/collections/travel/products/sprinkles-lunch-bag?variant=44651135959331', 'Lunch Bag - Sprinkles', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/buckle-lunch-bag-sprinkles-front.jpg?v=1681050134&width=3000', 638.00, 0, now(), now(), 'Bags', 'Travel Lunch Bag - Sprinkles', 'Our Lunch Bag will keep the temperature of both hot/cold meals and drinks for you to have them ready at any time.
Take it along with you to school, the office, or on short trips and enjoy your favorite treats!
As with all Up-fuse creations, this lunch bag is made out of sustainable and recycled materials to minimize your ecological footprint.
All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this pageBecause they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023769, 'https://up-fuse.com/collections/travel/products/keychain-beige-monopoly?variant=44651280204067', 'Keychain- Beige Monopoly', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/Beige-monopoly-keychain.jpg?v=1681051861&width=3000', 95.00, 0, now(), now(), 'Bags', 'Keychain- Beige Monopoly', 'Your Favourite Keychains are a practical and stylish accessory for keeping keys secure, easily accessible and also add style and personality to your everyday routine.', '');
insert into `shesg_product` values (255349023770, 'https://up-fuse.com/collections/travel/products/1970?variant=44651282432291', 'Passport Holder - Dallas', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/1_2-2-e1585164259205.jpg?v=1681051907&width=3000', 396.00, 0, now(), now(), 'Bags', '
Travel Passport Holder - Dallas', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023771, 'https://up-fuse.com/collections/travel/products/burano-passport-holder?variant=44651361829155', 'Passport Holder - Burano', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/21_1.jpg?v=1681052711&width=3000', 230.00, 0, now(), now(), 'Bags', 'Passport Holder - Burano', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023772, 'https://up-fuse.com/collections/bags/products/city-twin-backpack-blue-whitie?variant=44651127046435', 'City Twin- Blue Whhitie', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/SOLID-CITY-TWIN-13-e1585165818643.png?v=1681049983&width=3000', 1242.00, 0, now(), now(), 'Bags', ' Home Bags City Twin- Blue Whhitie', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023773, 'https://up-fuse.com/collections/laptop-sleeves/products/classic-laptop-sleeve-white?variant=44651158995235', 'Classic Laptop Sleeve - White', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/Laptop-13-2a-1.png?v=1681050416&width=3000', 715.00, 0, now(), now(), 'Bags', 'Home Laptop Sleeves Classic Laptop Sleeve - White', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023774, 'https://up-fuse.com/collections/footwear/products/beige-footprint-slippers?variant=44651148247331', 'Footprint Slippers - Beige', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/beige-1.jpg?v=1681050282&width=3000', 99, 0, now(), now(), 'Bags', 'Home Footwear Footprint Slippers - Beige', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023775, 'https://up-fuse.com/collections/streetwear/products/40-one-years-t-shirt?variant=44651143659811', 'Wasted T Shirt - White', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/Wasted.png?v=1681050217&width=3000', 633.00, 0, now(), now(), 'Bags', 'Home Streetwear Wasted T Shirt - White', 'Materials used:
50% recycled polyester and 50% cotton
Eco-friendly dyeing process
Care instructions:
Cold wash at 30°C
Don\'t iron wet
Iron on a delicate program

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023776, 'https://www.upfuse.co/collections/keychains/products/keychain-orange-black?variant=44651281645859', 'Keychain- Orange Black', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/black-orange.jpg?v=1681051886&width=3000', 95.00, 0, now(), now(), 'Bags', 'Home Keychains Keychain- Orange Black', 'Your Favourite Keychains are a practical and stylish accessory for keeping keys secure, easily accessible and also add style and personality to your everyday routine.', '');
insert into `shesg_product` values (255349023777, 'https://www.upfuse.co/collections/streetwear/products/140-two-years-old-crop-top?variant=44651146248483', 'Bottled Crop Top - Black', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/MG_4997-scaled.jpg?v=1681050256&width=3000', 540.00, 0, now(), now(), 'Bags', 'Home Streetwear Bottled Crop Top - Black', 'Materials used:
50% recycled polyester and 50% cotton
Eco-friendly dyeing process
Care instructions:
Cold wash at 30°C
Don\'t iron wet
Iron on a delicate program

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023778, 'https://www.upfuse.co/collections/cardholders/products/flip-cardholder-orange-black?variant=44651163582755', 'Home Cardholders Flip Cardholder - Orange/Black', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/FLIP-CARDHOLDER-black-front.jpg?v=1681050438&width=3000', 437.00, 0, now(), now(), 'Bags', 'Flip Cardholder - Orange/Black', 'Choose your favourite one-of-a-kind pattern to store your important cards and cash.
With a unique elastic design, this is the smallest product you can carry to store your most important cards and some cash.
Made from 2-5 recycled plastic bags.

All our products are sustainably and locally produced in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
None of our products look 100% alike, so please note that the product you receive may slightly differ from the picture. Each plastic sheet we use to make our products is unique, making each produced item one of a kind. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023779, 'https://www.upfuse.co/collections/not-your-average/products/not-your-average-laptop-sleeve-terrific?variant=44651192713507', 'Not Your Average Laptop Sleeve - Terrific', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/infused-laptop-sleeve-terrific-front.jpg?v=1681050815&width=3000', 650.00, 0, now(), now(), 'Bags', 'Home Not Your Average Not Your Average Laptop Sleeve - Terrific', 'Features:
Outside zipper
Padded interior
Internal separator
Waterproof exterior
Materials Used:
20-25 upcycled plastic bags
No dyes added to the recycled material
Canvas interior
All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page
IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023780, 'https://www.upfuse.co/collections/tote-shopping-body-bag/products/57714?variant=44651558895907', 'Shopping bag - Fresh Food', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/IMG_6996-scaled.jpg?v=1681054418&width=3000', 280, 0, now(), now(), 'Bags', 'Home Tote & Shopping Bag Shopping bag - Fresh Food', 'Features:
Foldable technique
Elastic band for closing
64 cm long straps
Materials used:
Made out of 30 upcycled/recycled plastic bags
No dyes added to the upcycled material
Cotton straps

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023781, 'https://upfuse.co/collections/new-in/products/orange-triangles-kimono?variant=44651276992803', 'Beach Cover Up- Orange Triangles', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/66.jpg?v=1681051801&width=3000', 1380.00, 0, now(), now(), 'Bags', 'Home New IN! Beach Cover Up- Orange Triangles', 'Protect your skin from harmful UV rays while still looking fashionable with our beach cover up. Its breathable fabric and airy silhouette make it the ideal choice for a day in the sun.', '');
insert into `shesg_product` values (255349023782, 'https://upfuse.co/collections/new-in/products/blue-dusk-kimono?variant=44651278336291', 'Beach Cover Up- Blue Dusk', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/IMG_8704.jpg?v=1681051829&width=3000', 1380.00, 0, now(), now(), 'Bags', 'Home New IN! Beach Cover Up- Blue Dusk', 'Protect your skin from harmful UV rays while still looking fashionable with our beach cover up. Its breathable fabric and airy silhouette make it the ideal choice for a day in the sun.', '');
insert into `shesg_product` values (255349023783, 'https://upfuse.co/collections/new-in/products/lolita-multi-way-bag-xl-blues-confetti?variant=44651278696739', 'Lolita Multi-Way Bag XL- Blues Confetti', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/Lolita-XL-Blues-Confetti-Front.jpg?v=1684926367&width=3000', 920.00, 0, now(), now(), 'Bags', 'Home New IN! Lolita Multi-Way Bag XL- Blues Confetti', 'Features:
Attachable Strap
Handle
Outer Zipper
Two Inner Pockets
Detachable Cross Strap: 120 CM Length
Materials used:
Made out of 15 upcycled plastic bags
No dyes added to the upcycled material

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023784, 'https://upfuse.co/collections/bags/products/plastic-base-tote-bag-azure?variant=44651784143139', 'Plastic base Tote Bag - Azure', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/plastic-base-tote-bag-azure-front-1.jpg?v=1681058759&width=3000', 290.00, 0, now(), now(), 'Bags', 'Home Bags Plastic base Tote Bag - Azure', 'Materials used:
Made out of 15 upcycled/recycled plastic bags
No dyes added to the upcycled/recycled material
Cotton

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they’re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023785, 'https://upfuse.co/collections/new-in/products/canvas-tote-bag-watermelon?variant=44651272536355', 'Canvas Tote Bag- Watermelon', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/Monopoly-1-front-1.jpg?v=1684925664&width=3000', 265.00, 0, now(), now(), 'Bags', 'Home New IN! Canvas Tote Bag- Watermelon', 'Material: Cotton
Sizes: 45*50 CM

All our products are sustainably and locally produced in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
None of our products look 100% alike, so please note that the product you receive may slightly differ from the picture. Each plastic sheet we use to make our products is unique, making each produced item one of a kind. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023786, 'https://upfuse.co/collections/travel/products/sustainable-recycled-black-lunch-bag-2?variant=44651130519843', 'Lunch Bag - Black', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/buckle-lunch-bag-black-side.jpg?v=1681050041&width=3000', 638.00, 0, now(), now(), 'Bags', 'Home Travel Lunch Bag - Black', 'Our Lunch Bag will keep the temperature of both hot/cold meals and drinks for you to have them ready at any time.
Take it along with you to school, the office, or on short trips and enjoy your favorite treats!
As with all Up-fuse creations, this lunch bag is made out of sustainable and recycled materials to minimize your ecological footprint.
All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023787, 'https://upfuse.co/products/black-oversized-hoodie?pr_prod_strat=copurchase_transfer_learning&pr_rec_id=acfe1e203&pr_rec_pid=8216514461987&pr_ref_pid=8216470585635&pr_seq=uniform&variant=44651246879011', 'Black Oversized Hoodie', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/black-hoodie-lifestyle.jpg?v=1681051431&width=3000', 900.00, 0, now(), now(), 'Bags', 'Home Black Oversized Hoodie', 'The awesomeness of simplicity .
Express yourself and let your true colors shine with our latest sustainable Hoodie
This set is very comfortable for your everyday.
Change the look by adding a coat or a jeans jacket.
You can always have a cool bag from up-fuse to change your narrative, it’s always Up to how you feel.

. Every piece recycles around 6 plastic bottles and is made from Cotton.
. All Materials are certified by the Global Recycling initiative.', '');
insert into `shesg_product` values (255349023788, 'https://upfuse.co/products/black-one-of-a-kind-pants-white?pr_prod_strat=use_description&pr_rec_id=c72e61834&pr_rec_pid=8302132003107&pr_ref_pid=8216514461987&pr_seq=uniform&variant=44946552389923', 'Black One of a Kind Pants- White', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/white-one-of-a-kind-2.jpg?v=1684407606&width=3000', 820.00, 0, now(), now(), 'Bags', 'Home Black One of a Kind Pants- White', 'Express yourself and let your true colors shine with our latest sustainable sweatpants.
This sweatpants is very comfortable for your everyday.
You can always have a cool bag from up-fuse to change your narrative, it’s always Up to how you feel.

. Every piece recycles around 6 plastic bottles and is made from Cotton.
All Materials are certified by the Global Recycling initiative.', '');
insert into `shesg_product` values (255349023789, 'https://upfuse.co/collections/lunch-bags/products/brown-lunch-bag-pink-triangle?variant=44651752554787', 'Brown Lunch Bag - Pink Triangle', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/brown-bag-lunchbag-pink-triangles-front.jpg?v=1681058280&width=3000', 360, 0, now(), now(), 'Bags', 'Home Lunch Bags Brown Lunch Bag - Pink Triangle', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page

IMPORTANT
Because they\'re handmade, none of our pieces look 100% alike so please note that the one you receive may slightly differ from the picture. Each plastic sheet we use as part of our upcycling process is unique, making each of our pieces one of a kind just like their owners. Enjoy your individualized purchase!', '');
insert into `shesg_product` values (255349023790, 'https://upfuse.co/collections/streetwear/products/wasted-t-shirt-purple?variant=44651180556579', 'Wasted T Shirt - Purple', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/qqq.jpg?v=1681050695&width=3000', 633.00, 0, now(), now(), 'Bags', 'Home Streetwear Wasted T Shirt - Purple', 'All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023791, 'https://upfuse.co/collections/streetwear/products/crop-top-sleeveless-planet-b?variant=44651186192675', 'Crop Top Sleeveless - Galaxy', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/crop-top-black-planet-B-1.jpg?v=1681050741&width=3000', 540.00, 0, now(), now(), 'Bags', 'Home Streetwear Crop Top Sleeveless - Galaxy', 'Materials used:
50% recycled polyester and 50% cotton
Eco-friendly dyeing process
Care instructions:
Cold wash at 30°C
Don\'t iron wet
Iron on a delicate program

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023792, 'https://upfuse.co/collections/streetwear/products/shorts-coral-set?variant=44651212669219', 'Pants Black Set

 ', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/set-black.jpg?v=1681051129&width=3000', 810.00, 0, now(), now(), 'Bags', 'Home Streetwear Pants Black Set', 'The set comes in three colors: Jungle, Coral, and Black with One Size Guide.
We hope you enjoy your one of a kind pieces as much as we did enjoy creating them.
All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023793, 'https://upfuse.co/collections/streetwear/products/respect-t-shirt-purple?variant=44651216830755', 'Respect T Shirt - Purple', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/purple-t-shirt-respect-back.jpg?v=1681051197&width=3000', 633.00, 0, now(), now(), 'Bags', 'Home Streetwear Respect T Shirt - Purple', 'Materials used:
50% recycled polyester and 50% cotton
Eco-friendly dyeing process
Care instructions:
Cold wash at 30°C
Don\'t iron wet
Iron on a delicate program

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023794, 'https://upfuse.co/collections/streetwear/products/belt-blues-confetti?variant=44651224138019', 'Belt - Blues Confetti', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/belt-blues-confetti-1.jpg?v=1681051264&width=3000', 350.00, 0, now(), now(), 'Bags', 'Home Streetwear Belt - Blues Confetti', 'This sustainable A6 notebook is made out of upcycled plastic and paper. Use it for jotting down any ideas that cross your mind, taking notes at work or school, sketching, or just about anything you want to use it for.
Materials used:
Made of 10-15 upcycled/recycled plastic bags
No dyes added to the upcycled/recycled material
Egyptian cotton
Product features:
Elastic band to close your notebook
All our products are sustainably and locally produced in Egypt. We create our unique material from plastic bags that have been thrown away.', '');
insert into `shesg_product` values (255349023795, 'https://upfuse.co/collections/streetwear/products/cropped-hoodie-winter-fusion?variant=44651249860899', 'Cropped Hoodie Winter Fusion', 'https://cdn.shopifycdn.net/s/files/1/0739/5786/7811/products/cropped-hoodie-winter-fusion-back-2.jpg?v=1681051465&width=3000', 850.00, 0, now(), now(), 'Bags', 'Home Streetwear Cropped Hoodie Winter Fusion', 'Materials used:
50% recycled polyester and 50% cotton
Eco-friendly dyeing process
Care instructions:
Cold wash at 30°C
Don\'t iron wet
Iron on a delicate program

All our pieces are sustainably and locally handmade in Egypt. Want to know more about the people behind your product? Visit this page', '');
insert into `shesg_product` values (255349023796, 'https://ohsevendays.com/collections/sale-tops/products/lotus-blouse-pearl', ' Lotus Wrap Collared Shirt with Elasticated Waist', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF2352_1200x.jpg?v=1587525709', 99.45, 0, now(), now(), 'Dresses & Playsuits', 'Lotus Blouse (Pearl)', 'Model is 180cm, size small, wearing a One Size Fits Many
One Size Fits Many fits the following size range (US 4, 6, 8 / Euro 36, 38, 40)
Made from off cut Modal.
Cool hand wash.
Made in Istanbul Turkey
Questions about fit? Email info@ohsevendays.com
80% Modal 20% Vis
DESCRIPTION: Made from surplus modal fabric, this collared wrap top featured a tiered elasticated waist and wide dramatic sleeves. With subtle shoulder pleats and soft drapes this blouse is built to flatter all shapes.
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023797, 'https://ohsevendays.com/collections/sale-tops/products/scrunch-top-sample', 'SCRUNCH TOP ( SAMPLE )', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/4_1200x.png?v=1664282038', 54.69, 0, now(), now(), 'Dresses & Playsuits', '', 'All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com
Details
Wheat Stripe made from 100% Linen.   This fabric was sourced from Zeytinburnu in Istanbul.
Blue Stripe made from 100% Cotton.   This fabric was sourced from Zeytinburnu in Istanbul.
Cool hand wash.
Made in Istanbul Turkey
Questions about fit? Email info@ohsevendays.com', '');
insert into `shesg_product` values (255349023798, 'https://ohsevendays.com/collections/sale-tops/products/samantha-shirt', 'SAMANTHA SHIRT', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/2_a570e595-5a99-445d-ae91-1ad3b95498e9_1200x.jpg?v=1633011201', 109.39, 0, now(), now(), 'Dresses & Playsuits', '', 'Details
Oversized 100% cotton shirt
Single front breast pocket
Dropped sleeve
Poet cuffs
Fabric & Care
Black&White Stripes: 100% Oeko Certified Cotton | Blue Striped: Certified Viscose 89% PES 11%
Machine wash with gentle programs, water temperature under 30°C
Cool hand wash is recommended
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023799, 'https://ohsevendays.com/collections/sale-tops/products/reese-reversible-blouse', 'REESE REVERSIBLE BLOUSE', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/2_91784bc1-f4ee-4a33-b8f9-51a1cad1f4a3_1200x.jpg?v=1635146729', 109.40, 0, now(), now(), 'Dresses & Playsuits', '', 'Details
Reversible wrap blouse
Balloon sleeves
Extra-long ties
Cropped waist length
Fabric & Care
100% Tencel
Machine wash with gentle programs, water temperature under 30°C
Cool hand wash is recommended
Do not bleach
The maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023800, 'https://ohsevendays.com/collections/sale-tops/products/patchwork-sweatshirt', 'PATCHWORK SWEATSHIRT', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF6123_1200x.jpg?v=1634911158', 74.59, 0, now(), now(), 'Dresses & Playsuits', '', 'Details
Puzzle piece style crew neck sweater
A comfy loose fit with drop shoulders
OhSevenDays logo
Fabric & Care
100% Cotton
Machine wash with gentle programs, water temperature under 30°C
Cool hand wash is recommended
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023801, 'https://ohsevendays.com/collections/sale-tops/products/billow-reversible-blouse', 'BILLOW REVERSIBLE BLOUSE', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF5090_1200x.jpg?v=1634810737', 119.34, 0, now(), now(), 'Dresses & Playsuits', '', 'Details
Wrap closure
Spagetti strap style wraps with side seam tunnel
Matte Vegan Silk
Fabric & Care
100% Cupro
Machine wash with gentle programs, water temperature under 30°C
Cool hand wash is recommended
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023802, 'https://ohsevendays.com/collections/sale-tops/products/winona-top-blush-1', 'WINONA TOP (BLUSH)', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF2688_1200x.jpg?v=1625743492', 99.45, 0, now(), now(), 'Dresses & Playsuits', '', 'Details
Linen gathered top with tie waistband closures
Peplum waist
This style is a relaxed fit with open front
1 top hook and 2 ties below
Fabric & Care
100% Linen
Machine wash under 30 °C
Do not bleach
Maximum ironing temperature is 200 °C
Dry flat
We know it\'s hard to always find the right size, that\'s why we offer custom sizing! If we have fabrics in stock, or if we can find a suitable alternative, we can have a bespoke piece made to fit your measurements. Please note, custom pieces are final sale and none refundable. Please send us an email with your detailed measurements to info@ohsevendays.com
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023803, 'https://ohsevendays.com/collections/sale-tops/products/winnie-top-mustard', 'WINNIE TOP (MUSTARD)', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF5638_1200x.jpg?v=1606213749', 109.39, 0, now(), now(), 'Dresses & Playsuits', '', 'Details
Pullover blouse
Elasticated cropped elasticated
Square neckline
Elasticated wrist
Raglan sleeve silhouette
Fabric & Care
30º Wash Cycle
Medium Iron
Do not bleach
45% Cupro 55% Rayon
We know it\'s hard to always find the right size, that\'s why we offer custom sizing! If we have fabrics in stock, or if we can find a suitable alternative, we can have a bespoke piece made to fit your measurements. Please note, custom pieces are final sale and none refundable. Please send us an email with your detailed measurements to info@ohsevendays.com', '');
insert into `shesg_product` values (255349023804, 'https://ohsevendays.com/collections/sale-tops/products/cecil-blouse', 'Made from Oeko-Tex certified surplus V-Label Vegan silk, this oversized boxy blouse features a Bauhaus inspired print in contrast ruby on a blush coloured. Contrast cinnamon coloured buttons.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF0328-2_700x.jpg?v=1616505032', 129.29, 0, now(), now(), 'Dresses & Playsuits', 'CECIL BLOUSE', 'Details
Oversized blouse
Front breast pocket
Back yoke
Dropped sleeve
Button fastenings
Sizes come in XS, One Size Fits Many (euro 36 to 40 US 4 to 8) and in XL
Fabric & Care
45% Cupro    55% Rayon
Machine wash with gentle programs, water temperature under 30 °C
Cool hand wash is recommended
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023805, 'https://ohsevendays.com/collections/sale-tops/products/samantha-shirt-patchwork-faulty', 'Oversized color-blocked vegan silk with a single chest pocket, featuring extra-long poet cuffs.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/samanthashirt_ae780569-5170-4328-bc6d-a4390eee551f_978x.png?v=1674037201', 134.26, 0, now(), now(), 'Dresses & Playsuits', 'SAMANTHA SHIRT PATCHWORK ( FAULTY )', 'Details
Oversized 100% cupro shirt
Single front breast pocket
Dropped sleeve
Poet cuffs
Fabric & Care
100% Cupro
Machine wash with gentle programs, water temperature under 30°C
Cool hand wash is recommended
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat






 ', '');
insert into `shesg_product` values (255349023806, 'https://ohsevendays.com/collections/sale-tops/products/scrunch-top-faulty', 'Cotton elasticated tube top of the season! The strapless super-stretchy Scrunch Top is perfect for post beach relaxation and sunburn respite.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/15_1_1200x.png?v=1678889269', 79.56, 0, now(), now(), 'Dresses & Playsuits', 'SCRUNCH TOP (FAULTY)', 'Details
Wheat Stripe made from 100% Linen.  This fabric was sourced from Zeytinburnu in Istanbul.
Blue Stripe made from 100% Cotton.  This fabric was sourced from Zeytinburnu in Istanbul.
Cool hand wash.
Made in Istanbul Turkey
Questions about fit? Email info@ohsevendays.com
SIZE: XLARGE', '');
insert into `shesg_product` values (255349023807, 'https://ohsevendays.com/collections/tops/products/ruby-crop-top', 'Made from surplus cotton elastane blend, this top features a gathered elasticated crop top both with a 2cm elasticated waistband. The ultimate Sunday morning coffee in bed attire.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/image_3ddf4c81-2968-4037-ac23-b566ea7f0caa_433x.png?v=1630408455', 54.69, 0, now(), now(), 'Dresses & Playsuits', 'RUBY CROP TOP', 'Details
The top is cropped and gathered
Stretching fabric with 2 cm thick elasticated waistband
The elasticity of the fabric allows for size flexibility
Fabric & Care
75% Cotton     20% Polyamid     5% Elastane
Machine wash under 30 °C
Do not iron
Do not tumble dry
Do not bleach
We know it\'s hard to always find the right size, that\'s why we offer custom sizing! If we have fabrics in stock, or if we can find a suitable alternative, we can have a bespoke piece made to fit your measurements. Please note, custom pieces are final sale and none refundable. Please send us an email with your detailed measurements to info@ohsevendays.com', '');
insert into `shesg_product` values (255349023808, 'https://ohsevendays.com/collections/tops/products/rosa-shirt', 'Made from surplus printed cotton, this short sleeve oversized linen shirt features statement butterfly effect print, breast pockets, and centre front button fastening.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF9638_1200x.jpg?v=1616505313', 109.39, 0, now(), now(), 'Dresses & Playsuits', 'ROSA SHIRT', 'Details
Button down short sleeve shirt
Oversized
Breast pocketed
Sizes come in XS, One Size Fits Many (euro 36 to 40 US 4 to 8) and in XL
Fabric & Care
100% Linen
Machine wash permanent press with water temperature under 30 °C,
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023809, 'https://ohsevendays.com/collections/tops/products/cecil-blouse', 'Made from Oeko-Tex certified surplus V-Label Vegan silk, this oversized boxy blouse features a Bauhaus inspired print in contrast ruby on a blush coloured. Contrast cinnamon coloured buttons.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF0328-2_1200x.jpg?v=1616505032', 129.29, 0, now(), now(), 'Dresses & Playsuits', 'CECIL BLOUSE', 'Details
Oversized blouse
Front breast pocket
Back yoke
Dropped sleeve
Button fastenings
Sizes come in XS, One Size Fits Many (euro 36 to 40 US 4 to 8) and in XL
Fabric & Care
45% Cupro    55% Rayon
Machine wash with gentle programs, water temperature under 30 °C
Cool hand wash is recommended
Do not bleach
Maximum ironing temperature is 150 °C
Dry flat
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023810, 'https://ohsevendays.com/collections/tops/products/nora-shirt-white-latte', 'Made from up-cycled linen, the Nora features statement centre front buttons, and structured lapel and collar. Color blocked Nora is carefully made with very fine craftsmanship. ', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF9557_1200x.jpg?v=1616506178', 109.40, 0, now(), now(), 'Dresses & Playsuits', 'NORA SHIRT ( WHITE - LATTE )', 'Details
Short sleeved linen shirt
Three center front buttons
Structured lapel and collar
Relaxed and boxy fit
Fabric & Care
100% Linen
Machine wash under 30 °C
Maximum ironing temperature is 200 °C
Dry flat
Do not bleach
We know it\'s hard to always find the right size, that\'s why we offer custom sizing! If we have fabrics in stock, or if we can find a suitable alternative, we can have a bespoke piece made to fit your measurements. Please note, custom pieces are final sale and none refundable. Please send us an email with your detailed measurements to info@ohsevendays.com', '');
insert into `shesg_product` values (255349023811, 'https://ohsevendays.com/collections/tops/products/winona-top-blush-1', 'Made from surplus Oeko-Tex certified fabrics, this top features gathered waist ties and optional hook & eye chest closure', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF2688_1200x.jpg?v=1625743492', 99.45, 0, now(), now(), 'Dresses & Playsuits', 'WINONA TOP (BLUSH)', 'Details
Linen gathered top with tie waistband closures
Peplum waist
This style is a relaxed fit with open front
1 top hook and 2 ties below
Fabric & Care
100% Linen
Machine wash under 30 °C
Do not bleach
Maximum ironing temperature is 200 °C
Dry flat
We know it\'s hard to always find the right size, that\'s why we offer custom sizing! If we have fabrics in stock, or if we can find a suitable alternative, we can have a bespoke piece made to fit your measurements. Please note, custom pieces are final sale and none refundable. Please send us an email with your detailed measurements to info@ohsevendays.com
All sale items are FINAL SALE - therefore we do not accept returns or exchanges on these items. If you have any fit questions, please don\'t hesitate to contact us at info@ohsevendays.com', '');
insert into `shesg_product` values (255349023812, 'https://ohsevendays.com/collections/tops/products/copy-of-fiorenza-long-sleeve', 'Relaxed fit custom illustrated vegan silk oversized blouse with single breast pocket, and button fastenings. Illustration by Artist Elena Gatti. Wear it over jeans, with our High Kick trousers. Also good for layering over t-shirts. ', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/4_d8c6fae9-0d0b-4687-a5d5-7718f81cbba9_1200x.jpg?v=1627471201', 159.12, 0, now(), now(), 'Dresses & Playsuits', 'FIORENZA LONG SLEEVE MUSTARD', 'Details
Oversized blouse
Front breast pocket
Back yoke
Dropped sleeve
Button fastenings
Fabric & Care
45% Cupro 55% Rayon
30º Wash Cycle
Medium Iron
Do not bleach', '');
insert into `shesg_product` values (255349023813, 'https://ohsevendays.com/collections/tops/products/fiorenza-blouse-cropped-sleeve-illustrated-shirt', 'Made from surplus satin linen viscose. Custom illustrated Print. Wide volume, with collar and mid-length sleeves. Front oversized button fastener and pleats on the yoke of the back and front.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/FiorenzaBlouse1_700x.jpg?v=1624283913', 149.18, 0, now(), now(), 'Dresses & Playsuits', 'FIORENZA BLOUSE - CROPPED SLEEVE ILLUSTRATED SHIRT', 'DETAILS
• Sizes come in XS, One Size Fits Many (euro 36 to 40 US 4 to 8) and in XL.
• Made from off-cut 60% Linen 40% Viscose
• Cool Hand Wash or Dry Clean
• Made in Istanbul Turkey
• Questions about fit? Email info@ohsevendays.com

DESCRIPTION:

Our newest illustrated is by the talented artist Elena Gatti AKA Fiorenza Art. The statement blouse is made from satin linen viscose! 100% made from natural fibers and ethically stitched by our beloved workshop team.
Garment Measurements:
XS: Chest: 102 cm  Length: (from shoulder)56cm Sleeve: 29cm Waist: 112cm
ONE SIZE :  Chest: 106cm  Length: (from shoulder)57cm Sleeve: 31cm Waist: 116cm
XL: Chest: 110cm  Length: (from shoulder)58cm Sleeve: 32cm Waist: 120cm
We accept returns within 30 days on non-sale items See More.

 ', '');
insert into `shesg_product` values (255349023814, 'https://ohsevendays.com/collections/tops/products/zero-waste-top-pearls', 'ZERO WASTE TOP (PEARL)', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSCF2002_1200x.jpg?v=1586920916', 94.48, 0, now(), now(), 'Dresses & Playsuits', 'ZERO WASTE TOP (PEARL)', 'DETAILS:
Model is 180 cm, size small, wearing One Size Fits Many.
Sizes come Small Medium & Large
Made from Offcut 100% Linen
Cool hand wash.
Made in Istanbul Turkey
Questions about fit? Email info@ohsevendays.com
DESCRIPTION:
Our zero waste top is made from the small leftovers from our cutting room. Small panels are sewn together to create a puzzle effect featuring double seam stitches. Fully open back with spaghetti strap ties. It can be worn in multiple ways.
Cool hand wash, air dry, hot iron ', '');
insert into `shesg_product` values (255349023815, 'https://ohsevendays.com/collections/outerwear/products/pick-pocket-jacket-1', 'The multi-seasonal jacket you\'ll want to wear with every outfit is made to pair seamlessly with all your bottoms. With concealed button closure, breast and waist overlapping pockets. A bonus matching belt to figure hug. Featuring contrast seaming for an added modern touch.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/DSC1029copy_1200x.jpg?v=1662470729', 288.41, 0, now(), now(), 'Dresses & Playsuits', 'PICK POCKET JACKET', 'Details
Button fastening
4 front pockets
Contract concealed button placket
Not lined
Fabric & Care
100% Cotton
 Made from ethically sourced deadstock OEKO-TEX® certified fabrics', '');
insert into `shesg_product` values (255349023816, 'https://ohsevendays.com/collections/outerwear/products/terrain-double-sided-jacket', 'The Reversible Terrain Jacket features a collarless neckline and a ripstop stitch in topography design. Made from tonal-green exterior with gingham pattern interior. Double pocketed and featuring fabric covered snap closures. Designed to be worn double sided.', 'https://cdn.shopifycdn.net/s/files/1/1870/2121/products/terrainjacket1_1_1200x.jpg?v=1635147789', 293.38, 0, now(), now(), 'Dresses & Playsuits', 'TERRAIN DOUBLE-SIDED JACKET', 'Details
Reversible collarless jacket
Sage with white stitch topography design and gingham
Pockets on each side
Snap buttons
Large fit
Made from 100% Cotton', '');
insert into `shesg_product` values (255349023817, 'https://motherofpearl.co.uk/products/lorna-top-pink', 'LORNA PINK TOP', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP26-5-222157_5024x5024.jpg?v=1671451151', 269.34, 0, now(), now(), 'Dresses & Playsuits', 'LORNA PINK TOP', 'The Lorna top is cut from a candy pink TENCEL ™ x REFIBRA ™ mesh cloth. REFIBRA is made in the same closed loop process as TENCEL ™ but with the addition of cotton scraps that are left over from garment production, meaning less virgin fibre is needed. A smocked bodice to give shape, the Lorna has gathered shoulders that billow into romantic puff sleeves. Style yours with the Britton\'s in tan. Fitted but elasticated for ease.', '');
insert into `shesg_product` values (255349023818, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/anya-top-black', 'ANYA BLACK TOP', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP26-5-221912_5024x5024.jpg?v=1671195290', 210.08, 0, now(), now(), 'Dresses & Playsuits', 'ANYA BLACK TOP', 'Cut from our ribbed organic cotton jersey, the Anya has a high neck for a chic silhouette. Fitted to the body, the Anya has long, slim sleeves pinned at the shoulder with pearls for the iconic Mother of Pearl look. Fitted.', '');
insert into `shesg_product` values (255349023819, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/hallie-top-black', 'HALLIE BLACK TOP', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/ECOM_AW_23_30_01_23132212_5024x5024.jpg?v=1675427235', 210.08, 0, now(), now(), 'Dresses & Playsuits', 'HALLIE BLACK TOP', 'Cut from our new ribbed organic cotton jersey, the Hallie is a move on from our best selling Ruth top. A scooped neck, the Hallie has a slim silhouette. Puff ball sleeves are pinned at the shoulder with pearls, the iconic Mother of Pearl detail. Fitted.', '');
insert into `shesg_product` values (255349023820, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/hallie-top-champagne', 'HALLIE CHAMPAGNE TOP', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP27-5-224175_5024x5024.jpg?v=1671196214', 210.08, 0, now(), now(), 'Dresses & Playsuits', 'HALLIE CHAMPAGNE TOP', 'Cut from our new ribbed organic cotton jersey, the Hallie is a move on from our best selling Ruth top. A scooped neck, the Hallie has a slim silhouette. Puff ball sleeves are pinned at the shoulder with pearls, the iconic Mother of Pearl detail. Fitted.

', '');
insert into `shesg_product` values (255349023821, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/lorna-top-plum', 'LORNA PLUM TOP', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP26-5-222283_5024x5024.jpg?v=1671452631', 269.34, 0, now(), now(), 'Dresses & Playsuits', 'LORNA PLUM TOP', 'The Lorna top is cut from a deep plum satin TENCEL ™cloth. A smocked bodice to give shape, the Lorna has gathered shoulders that billow into romantic puff sleeves. Style yours with the Amelie cut from the same cloth. Fitted but elasticated for ease.

', '');
insert into `shesg_product` values (255349023822, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/lorna-top-tanblackspot', 'LORNA PRINT TOP

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP-ECOM-31-5-225696_5024x5024.jpg?v=1671452997', 269.34, 0, now(), now(), 'Dresses & Playsuits', 'LORNA PRINT TOP

 ', 'The Lorna top is cut from our tan & black spot printed TENCEL ™cloth. A smocked bodice to give shape, the Lorna has gathered shoulders that billow into romantic puff sleeves. Style yours with the Amelie in the same print. Fitted but elasticated for ease.

', '');
insert into `shesg_product` values (255349023823, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/bethany-cardigan-praline', 'BETHANY PRALINE CARDIGAN

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/files/MOP27-5-225069copy_5024x5024.jpg?v=1683643806', 210.08, 0, now(), now(), 'Dresses & Playsuits', 'BETHANY PRALINE CARDIGAN

 ', 'The Bethany cardigan is knitted from a blend of merino wool, recycled polyester & elastane. It has a fine ribbed texture, for a lightweight feel for spring. Finished with our smaller branded gold pearl buttons, the Bethany contours to the body. If you loved the Charlotte, the Bethany is the new cardigan for you. Fitted.

', '');
insert into `shesg_product` values (255349023824, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/rosie-top-yellow', 'ROSIE YELLOW TOP

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOPECOM20-5-222213_5024x5024.jpg?v=1658832348', 296.27, 0, now(), now(), 'Dresses & Playsuits', 'ROSIE YELLOW TOP

 ', 'The Rosie is cut from a bright yellow organic cotton with a small amount of elastane for ease. Darts at the front cinch the waist of the Rosie and puff sleeves are gathered into a fitted cuff. A deep V neck flatters the body. Fitted.

', '');
insert into `shesg_product` values (255349023825, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/rosie-top-driedflower', 'ROSIE DRIED FLOWER PRINT TOP

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP27-5-223141_5024x5024.jpg?v=1658831535', 317.82, 0, now(), now(), 'Dresses & Playsuits', 'ROSIE DRIED FLOWER PRINT TOP

 ', 'The Rosie is cut from our Dried Flower printed onto a TENCEL™ lyocell twill. Darts at the front cinch the waist of the Rosie and puff sleeves are gathered into a fitted cuff. A deep V neck flatters the body. Fitted.
Composition', '');
insert into `shesg_product` values (255349023826, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/ruth-top-black', 'RUTH BLACK TOP

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOPECOMMFEB20226114_5024x5024.jpg?v=1657705448', 210.08, 0, now(), now(), 'Dresses & Playsuits', 'RUTH BLACK TOP

 ', 'Cut from our new ribbed organic cotton jersey, the Ruth has a high neck for a chic fit. Fitted to the body, the Ruth has puff ball sleeves pinned at the shoulder with pearls, our iconic sleeve shape. Fitted.', '');
insert into `shesg_product` values (255349023827, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/samantha-sweatshirt-undyed', 'SAMANTHA UNDYED SWEATSHIRT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/SAMANTHAUNDYED2_5024x5024.jpg?v=1636028756', 102.35, 0, now(), now(), 'Dresses & Playsuits', 'SAMANTHA UNDYED SWEATSHIRT

 ', 'Cut from a super soft fleeced back organic cotton, the Samantha has a raglan sleeve for a relaxed fit. Featuring \'Mother of Pearl\' embroidery, join the Pearly Queen tribe with this every day sweatshirt. Slightly oversized.
The exclusive Samantha sweatshirt is only available to buy from our website.', '');
insert into `shesg_product` values (255349023828, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/jessica-t-shirt-black', 'JESSICA BLACK T-SHIRT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/jessicablack1_51b19770-9d4c-4b41-b1f7-434ef160d62d_5024x5024.jpg?v=1635960014', 186.00, 0, now(), now(), 'Dresses & Playsuits', 'JESSICA BLACK T-SHIRT

 ', 'Jessica, like Monica but longer, is cut from a black Italian interlock jersey. Pleated at the sleeves and finished with a pearl pin, the Jessica is our new relaxed style tee. Wear over jeans or with bare legs for the summer. Oversized.', '');
insert into `shesg_product` values (255349023829, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/charlotte-cardigan-tan', 'CHARLOTTE TAN CARDIGAN

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/CHARLOTTETAN1_5024x5024.jpg?v=1617809981', 317.82, 0, now(), now(), 'Dresses & Playsuits', 'CHARLOTTE TAN CARDIGAN

 ', 'The Charlotte is knitted from organic cotton & non mulsed wool. It has a fine ribbed texture, adding to it\'s sophisticated feel. Finished with our branded gold pearl buttons, wear back with Chloe jeans. Oversized.

', '');
insert into `shesg_product` values (255349023830, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/parker-shirt-striped', 'PARKER STRIPE SHIRT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/Parkerstripe1_5024x5024.jpg?v=1635961029', 269.34, 0, now(), now(), 'Dresses & Playsuits', 'PARKER STRIPE SHIRT

 ', 'The Parker is cut oversized to give it the boyfriend fit feel. It\'s deep cuffs are finished with our gold kidney poppers. Oversized fit.', '');
insert into `shesg_product` values (255349023831, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/eliza-hoodie-grey', 'ELIZA GREY HOODIE

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/ELIZAGREY1_5024x5024.jpg?v=1617790092', 210.08, 0, now(), now(), 'Dresses & Playsuits', 'ELIZA GREY HOODIE

 ', 'The Eliza hoodie in grey is cut from a super soft fleece backed organic cotton jersey. A move on from our most loved Dani jumper, we\'ve updated this \'not so basic basic\' for the season. Wear back with the Lara joggers to complete the look. Loose fit.', '');
insert into `shesg_product` values (255349023832, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/kendra-t-shirt-black', 'KENDRA BLACK T-SHIRT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOPECOM20-5-220372_5024x5024.jpg?v=1667555854', 134.67, 0, now(), now(), 'Dresses & Playsuits', 'KENDRA BLACK T-SHIRT

 ', 'A move on from our Monica best selling t-shirt, the Kendra is longer in length and with a V neck to create a flattering silhouette for all shapes. Cut from an organic cotton jersey, the Kendra falls to the high hip. Pleated at the sleeves and finished with a pearl pin, wear the Kendra over the Jude skirt to complete the look. Slightly oversized.', '');
insert into `shesg_product` values (255349023833, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/kendra-t-shirt-stripe', 'KENDRA STRIPE T-SHIRT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOPECOM20-5-220081_5024x5024.jpg?v=1667558566', 156.21, 0, now(), now(), 'Dresses & Playsuits', 'KENDRA STRIPE T-SHIRT

 ', 'A move on from our Monica best selling t-shirt, the Kendra is longer in length and with a V neck to create a flattering silhouette for all shapes. The Kendra is cut from our new oatmeal and navy stripe interlock, a softer alternative to the classic fleece, the Kendra falls to the high hip. Pleated at the sleeves and finished with a pearl pin, wear the Kendra over the Jude skirt to complete the look. Slightly oversized.

', '');
insert into `shesg_product` values (255349023834, 'https://motherofpearl.co.uk/collections/tops-shirts-sustainable-fashion/products/monica-t-shirt-undyed', 'MONICA UNDYED T-SHIRT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOPECOMM21-11-22106622_5024x5024.jpg?v=1669993697', 234.36, 0, now(), now(), 'Dresses & Playsuits', 'MONICA UNDYED T-SHIRT

 ', 'The Monica is our new best selling t-shirt. We\'ve updated it for summer and cut it from an organic cotton jersey. The Monica is cropped at the waist for an easy fit. Pleated at the sleeves and finished with a pearl pin, wear the Monica over your favourite high waisted jeans. Slightly oversized.

', '');
insert into `shesg_product` values (255349023835, 'https://motherofpearl.co.uk/products/ainsley-dress-stonewash', 'AINSLEY STONEWASH DRESS

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/AINSLEYSTONEWASHSHIRTDRESS1_5024x5024.jpg?v=1625757880', 317.82, 0, now(), now(), 'Dresses & Playsuits', 'AINSLEY STONEWASH DRESS

 ', 'Our new edition to our Core collection, the Ainsley shirt dress. Cut from our organic denim, the Ainsley can be worn as a shirt/jacket, or as a mini dress. Perfect for trans-seasonal dressing, the Ainsley is produced all in one country meaning that it\'s carbon footprint is super low. True to size.', '');
insert into `shesg_product` values (255349023836, 'https://motherofpearl.co.uk/products/ainsley-dress-black', 'AINSLEY BLACK DRESS

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP-ECOM-31-5-226913_5024x5024.jpg?v=1658494894', 317.82, 0, now(), now(), 'Dresses & Playsuits', 'AINSLEY BLACK DRESS

 ', 'Our new edition to our Core collection, the Ainsley shirt dress. Cut from our organic black denim, the Ainsley can be worn as a shirt/jacket, or as a mini dress. Perfect for trans-seasonal dressing, the Ainsley is produced all in one country meaning that it\'s carbon footprint is super low. True to size.

', '');
insert into `shesg_product` values (255349023837, 'https://motherofpearl.co.uk/products/arlo-coat-tan', 'ARLO TAN COAT

 ', 'https://cdn.shopifycdn.net/s/files/1/0079/8179/3337/products/MOP26-5-222470_5024x5024.jpg?v=1656647945', 533.30, 0, now(), now(), 'Dresses & Playsuits', 'ARLO TAN COAT

 ', 'Our new tailored coat, the Arlo is fashioned in a non mulesed wool coating. A fitted silhouette, the Arlo is fastened with our gold kidney button at the centre front. From the sheep the wool came from, to the manufacture of this garment, everything about this coat is made in one country meaning it has a super low carbon footprint. True to size.

', '');
insert into `shesg_product` values (255349023838, 'https://www.outerknown.com/products/rewind-polo-night', 'Rewind to the past in fibers for the future with this retro-inspired polo, cut from plush terry fabric.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/SU23_Lifestyle_Rewind_Polo_Shorts_Look_21_10836_1440x.jpg?v=1679420603', 136.38, 0, now(), now(), 'Outerwear', 'Rewind Polo', 'Slightly more relaxed fit than your average polo.
Soft terry with a smooth interior.
Rib spread collar, button placket and side vented hem.
Pair with matching shorts for a set look.', '');
insert into `shesg_product` values (255349023839, 'https://www.outerknown.com/products/thompson-blouse-bright-white', 'An everyday button-up meets simple sophistication with airy organic cotton fabrication and shirred details.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/2320077_Thompson_Blouse_BWI_3_1440x.jpg?v=1676579076', 148.96, 0, now(), now(), 'Outerwear', 'Thompson Blouse', 'Feminine blouse made of a light and airy organic cotton voile.
Shirring across the body and sleeves.
Tailored sleeves hit right above the elbow.
Hidden button placket closure with faux mother-of-pearl buttons.', '');
insert into `shesg_product` values (255349023840, 'https://www.outerknown.com/products/rewind-cross-tank-olive-night', 'Rewind to the past in fibers for the future with this retro-inspired cross tank, cut from plush terry fabric. Crafted with recycled polyester made from 100% post-consumer waste like plastic bottles.', 'https://cdn.shopify.com/s/files/1/2445/4975/files/2230004_Rewind_Cross_Tank_OLN_1_1440x.jpg?v=1682362417', 123.79, 0, now(), now(), 'Outerwear', 'Rewind Cross Tank', 'The perfect warm-weather tank for any activity under the sun.
Pair with your favorite cut-off shorts or Summer jeans.
Cross front and back detail.
Soft terry with a smooth interior.
OK embroidery logo at hem.', '');
insert into `shesg_product` values (255349023841, 'https://www.outerknown.com/products/sydney-sleeveless-linen-shirt-bright-white', 'A soft breeze in shirt form. Travel-ready linen that keeps you cool in the hottest temps in an easy-wearing sleeveless silhouette.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/SU23_Lifestyle_Sydney_Linen_Look_16_9946_1440x.jpg?v=1679420465', 161.55, 0, now(), now(), 'Outerwear', 'Sydney Sleeveless Linen Shirt', 'Mother-of-pearl front button closure.
Oversized chest pockets with embroidered OK logo', '');
insert into `shesg_product` values (255349023842, 'https://www.outerknown.com/products/womens-wyatt-denim-shirt-heritage-blue', 'A vintage-inspired western shirt with a classic fit.

 ', 'https://cdn.shopify.com/s/files/1/2445/4975/files/2310027_Wyatt_Denim_Shirt_HRE_1_1440x.jpg?v=1682720963', 249.68, 0, now(), now(), 'Outerwear', 'Women\'s Wyatt Denim Shirt', 'Made with premium denim from the renowned Kaihara mill in Japan.
Washed down for a soft hand and well-worn look from day one.
Features chest pockets, reinforced back yoke, and matte mother of pearl snap buttons.', '');
insert into `shesg_product` values (255349023843, 'https://www.outerknown.com/products/womens-chroma-blanket-shirt-azure-blue', 'Borrowed from the boys? Not anymore! Designed for women by women, we believe these are the softest sustainable shirts ever made! Outerknown’s most beloved items for all seasons–heavy enough to keep you warm and light enough to layer over your favorite tees and tanks.', 'https://cdn.shopify.com/s/files/1/2445/4975/files/2220015_Sojourn_Ribbed_Tank_BWI0352_1_1440x.jpg?v=1684254757', 186.73, 0, now(), now(), 'Outerwear', 'Women\'s Chroma Blanket Shirt', 'Cut from soft organic cotton lofty twill.
Designed for ultimate comfort and effortless versatility that keeps up with whatever your day has in store.
Rounded hem, chest pockets and buttons made from nuts.
Available in XS/S, M/L and XL/XXL sizes.', '');
insert into `shesg_product` values (255349023844, 'https://www.outerknown.com/products/sydney-boyfriend-shirt-salt', 'Nothing says soft like silk!', 'https://cdn.shopify.com/s/files/1/2445/4975/products/2310031_Sydney_Silky_Boyfriend_Shirt_SLT_2_1440x.jpg?v=1654188058', 161.55, 0, now(), now(), 'Outerwear', 'Sydney Boyfriend Shirt', 'Stolen from the boys, but designed for the ladies. Relaxed-fit boyfriend shirt can be dressed up or down for an everyday essential that works across the seasons.
Designed to fit slightly oversized and longer than our classic Marlow Shirt.
Mother of pearl buttons, front pocket, back yoke, center box pleat detail and embroidered OK logo.', '');
insert into `shesg_product` values (255349023845, 'https://www.outerknown.com/products/womens-blanket-shirt-half-light-little-boxes-1', 'Designed for women by women, we believe these are the softest sustainable shirts ever made! Outerknown’s most beloved items for all seasons–heavy enough to keep you warm and light enough to layer over your favorite tees and tanks.', 'https://cdn.shopify.com/s/files/1/2445/4975/files/2310056_Womens_Blanket_Shirt_HLB0455_1440x.jpg?v=1684172309', 186.73, 0, now(), now(), 'Outerwear', 'Women\'s Blanket Shirt', 'Cut from soft organic cotton lofty twill.
Designed for ultimate comfort and effortless versatility that keeps up with whatever your day has in store.
Rounded hem, chest pockets and buttons made from nuts.
Available in XS/S, M/L and XL/XXL sizes.', '');
insert into `shesg_product` values (255349023846, 'https://www.outerknown.com/products/thompson-blouse-marine', 'An everyday button-up meets simple sophistication with airy organic cotton fabrication and shirred details.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/2320077_Thompson_Blouse_MRN_1_1440x.jpg?v=1676579655', 148.96, 0, now(), now(), 'Outerwear', 'Thompson Blouse', 'Feminine blouse made of a light and airy organic cotton voile.
Shirring across the body and sleeves.
Tailored sleeves hit right above the elbow.
Hidden button placket closure with faux mother-of-pearl buttons.', '');
insert into `shesg_product` values (255349023847, 'https://www.outerknown.com/products/womens-blanket-shirt-olive-branch-cabin-plaid', 'The Blanket Shirt is our all-time best-selling style, and it just might be the coziest damn shirt ever made.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/2310056_Women_s_Blanket_Shirt_OLP_1_1440x.jpg?v=1674678188', 186.73, 0, now(), now(), 'Outerwear', 'Women\'s Blanket Shirt', 'Crafted from a heavyweight organic cotton twill with buttons made from nuts, it\'s sturdy yet incredibly soft and breathable.
Built for travel. Stands up to wrinkles and the elements.
Designed with an easy fit, ideal for layering on chilly nights or mornings.
Features chest pockets and an organic cotton yoke.', '');
insert into `shesg_product` values (255349023848, 'https://www.outerknown.com/products/womens-blanket-shirt-cloud-halo-plaid', 'Designed for women by women, we believe these are the softest sustainable shirts ever made! Outerknown’s most beloved items for all seasons–heavy enough to keep you warm and light enough to layer over your favorite tees and tanks.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/MicrosoftTeams-image_35_1440x.jpg?v=1662684172', 186.73, 0, now(), now(), 'Outerwear', 'Women\'s Blanket Shirt', 'Cut from soft organic cotton lofty twill.
Designed for ultimate comfort and effortless versatility that keeps up with whatever your day has in store.
Rounded hem, chest pockets and buttons made from nuts.
Available in XS/S, M/L and XL/XXL sizes.', '');
insert into `shesg_product` values (255349023849, 'https://www.outerknown.com/products/windward-linen-shirt-khaki', 'Nothing keeps you cool, comfortable and looking leisurely as hell like linen. The most breathable fabric of the season in a relaxed button-up that\'ll keep you cool in even the hottest months.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/1310187_Windward_Linen_Shirt_KHK__1_1440x.jpg?v=1680029490', 161.55, 0, now(), now(), 'Outerwear', 'Windward Linen Shirt', 'Cut from super soft linen from the renowned Baird McNutt mill in Ireland.
Details include two chest pockets with button flap closure, and logo corozo buttons.
Baird McNutt branded label at internal button placket.', '');
insert into `shesg_product` values (255349023850, 'https://www.outerknown.com/products/atlantic-ss-linen-shirt-linen-leaves', 'Our classic Atlantic button-up in the season’s most breathable linen fabric. Built for life’s everyday adventures so you can beat it up, wash it as much as you want – it only gets better with each wear.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/SU23_Lifestyle_Atlantic_Linen_Chino_Look_28_12250_1440x.jpg?v=1680888402', 161.55, 0, now(), now(), 'Outerwear', 'Atlantic S/S Linen Shirt', 'A closet essential that\'s sharp but not too fussy.
Cut with soft, lightweight linen from the renowned Albiate mill in Italy.
Details include button down collar, single chest pocket with button closure, and fisheye corozo buttons.
Signature OK logo embroidery at bottom internal placket.', '');
insert into `shesg_product` values (255349023851, 'https://www.outerknown.com/products/linen-ss-camp-shirt-shadow-sketch-palms', 'A must-wear fabric for the warmer months, this linen camp collar teeters toward the casual side but cleans up nicely when the occasion calls for it.', 'https://cdn.shopify.com/s/files/1/2445/4975/files/1320015_Linen_SS_Camp_Shirt_SSX_1_1440x.jpg?v=1683650869', 161.55, 0, now(), now(), 'Outerwear', 'Linen S/S Camp Shirt', 'Cut with soft, lightweight linen from the renowned Albiate mill in Italy.
Details include camp collar, single chest pocket, and corozo buttons.', '');
insert into `shesg_product` values (255349023852, 'https://www.outerknown.com/products/linen-ss-camp-shirt-whitewater', 'A must-wear fabric for the warmer months, this linen camp collar teeters toward the casual side but cleans up nicely when the occasion calls for it.', 'https://cdn.shopify.com/s/files/1/2445/4975/files/1320007_Linen_SS_Camp-Shirt_WTW__1_1440x.jpg?v=1684530414', 123.79, 0, now(), now(), 'Outerwear', 'Linen S/S Camp Shirt', 'Cut from super soft linen from the renowned Baird McNutt mill in Ireland.
Details include camp collar, single chest pocket, and corozo buttons.', '');
insert into `shesg_product` values (255349023853, 'https://www.outerknown.com/products/atlantic-oxford-shirt-oxford-pink', 'Tradition born across the pond, this iconic 2-yarn basket weave is now crafted in 100% organic cotton.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/1310181_Atlantic_Oxford_Shirt_OPK_LS_1_1440x.jpg?v=1680029350', 161.55, 0, now(), now(), 'Outerwear', 'Atlantic Oxford Shirt', 'A classic fit Oxford shirt is a closet essential. Ours looks sharp but isn\'t too fussy.
Cut from mid-weight, classic Oxford weave from Portugal. Available in a wearable assortment of solids and patterns.
Details include button down collar, single chest pocket, and logo mother-of-pearl buttons.
Signature OK logo embroidery at bottom internal placket.', '');
insert into `shesg_product` values (255349023854, 'https://www.outerknown.com/products/blanket-shirt-acrylic-blue-andover-plaid', 'Often imitated, never duplicated, this is the coziest shirt ever made. Outerknown’s most beloved item for all seasons – quality that feels so damn good every time you throw it on.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/1310023W_Blanket_Shirt_AYO__1_1440x.jpg?v=1680029005', 186.73, 0, now(), now(), 'Outerwear', 'Blanket Shirt', 'Endlessly versatile and always essential, you\'ll wear this layer for years to come.
Crafted from a soft, lofty organic cotton twill with buttons made from nuts.
Features chest pockets with button flap closure.', '');
insert into `shesg_product` values (255349023855, 'https://www.outerknown.com/products/cloud-weave-shirt-marine-bigbury-island', 'A timelessly classic plaid reimagined in our signature Cloud Weave texture. ', 'https://cdn.shopify.com/s/files/1/2445/4975/products/1310157_Cloud_Weave_Shirt_MBY_LS_1_1440x.jpg?v=1680029120', 249.68, 0, now(), now(), 'Outerwear', 'Cloud Weave Shirt', 'Inspired by our beloved Blanket Shirt but cut in a loftier, looser weave that brings another level of softness.
Heavyweight twill with planet-friendly buttons made from nuts.
Toss on over tees, sweatshirts and sweaters.', '');
insert into `shesg_product` values (255349023856, 'https://www.outerknown.com/products/chroma-blanket-shirt-clay', 'Our best-selling style and the coziest shirt ever made, in garment-dyed solid colors! Because not every day is a plaid day.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/SU23_Lifestyle_Chroma_Look_32_12835_1440x.jpg?v=1678909489', 186.73, 0, now(), now(), 'Outerwear', 'Chroma Blanket Shirt', 'Crafted from lofty organic cotton twill with buttons made from nuts.
Designed with an easy fit, great for layering in cooler weather.
Features chest pockets with button flap pockets and an organic cotton yoke.', '');
insert into `shesg_product` values (255349023857, 'https://www.outerknown.com/products/chroma-blanket-shirt-bay-leaf', 'Our best-selling style and the coziest shirt ever made, in garment-dyed solid colors! Because not every day is a plaid day.', 'https://cdn.shopify.com/s/files/1/2445/4975/products/1310162_Chroma_Blanket_Shirt_BYF_1_1440x.jpg?v=1674601702', 186.73, 0, now(), now(), 'Outerwear', 'Chroma Blanket Shirt', 'Crafted from lofty organic cotton twill with buttons made from nuts.
Designed with an easy fit, great for layering in cooler weather.
Features chest pockets with button flap pockets and an organic cotton yoke.', '');
insert into `shesg_product` values (255349023858, 'https://www.outerknown.com/products/jaspe-transitional-flannel-azure-blue-vista-check', 'Look closely for the visual texture that can only come from a jaspe twisted yarn, in a super plush Portuguese flannel. Easily one of the softest flannels in our arsenal', 'https://cdn.shopify.com/s/files/1/2445/4975/products/1310185_Jaspe_Transitional_Flannel_ABV_LS_1440x.jpg?v=1680029453', 174.14, 0, now(), now(), 'Outerwear', 'Jaspe Transitional Flannel', 'These are so soft, you don\'t even need an undershirt.
A blend of different color yarns woven together create that unique jaspe variagation.
Available in an assortment of solids and patterns.
Single chest pocket.
Mother-of-pearl buttons.
Contrast chambray gusset detail at side seam.
Signature OK logo embroidery at internal button placket.', '');
insert into `shesg_product` values (255349023859, 'https://www.raeburndesign.co.uk/products/dapple-off-cut-shirt-black', 'DAPPLE OFF-CUT SHIRT BLACK', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/142433_Will_Dixon30262_7b4ba28c-b7ec-4300-85d0-d1254d9415a6_1000x.jpg?v=1666012072', 326.42, 0, now(), now(), 'Outerwear', 'DAPPLE OFF-CUT SHIRT BLACK', 'The RÆBURN Women’s Dapple off-cut Shirt features an all-over digital print, inspired by one of this season\'s key Artefacts; A 1950-60s Yugoslavian Dapple Camouflage suit. Of Yugoslav origin, the suit, or coverall, includes leaf motifs that have been RÆIMAGINED on a repeat print. Manufactured at the RÆBURN Lab in East London from 100% certified Organic Cotton cloth.
Features & Benefits
RÆDUCED 100% Organic Cotton Shirt
Dropped shoulder
Storm flap lip inspired by 1949 Blouse pattern
x8 buttons to front
RÆBURN signature 1.5cm grosgrain drawcord detail
Elasticated cuff w. inverted box pleat
x2 pockets w. all over Authentic Dapple print
Curved hem finish
Internal branded RÆBURN label ', '');
insert into `shesg_product` values (255349023860, 'https://www.raeburndesign.co.uk/products/si-hooded-sweat-w-black', 'SI HOODED SWEAT (W) BLACK

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RW47051SI_C000_1__1_f201d0d3-c708-4942-b7f0-7ff0a023593f_1000x.jpg?v=1657908297', 198.69, 0, now(), now(), 'Outerwear', 'SI HOODED SWEAT (W) BLACK

 ', 'STANDARD ISSUE is our non-seasonal, elevated essentials range branded with our parachute emblem – responsibly designed in East London.⁠ The RÆBURN Women\'s Standard Issue Hooded Sweatshirt is realised in a regular women\'s fit, in a midweight double-face jersey ideal for layering and all-year wear. Manufactured in Portugal from 100% GOTS certified organic cotton.
Features & Benefits
370gsm Organic double-face sweat crew
Precision embroidered parachute emblem
Stepped back hem
Premium weight and feel
Easy Care, wash at 30° degrees
Brand colours meet Standard 100 by Oeko-Tex®
Straight hem finish
x2 side pockets
RÆBURN branded drawcord
RÆBURN organic cotton branded tape
RÆBURN recycled PET branded tab
Fabric Details
100% Organic Cotton Bonded Jersey Sweat
Model is 5’8½”/174cm with a 25”/63cm waist and wears a size Small. Contact us for any sizing queries.

 ', '');
insert into `shesg_product` values (255349023861, 'https://www.raeburndesign.co.uk/products/si-hooded-sweat-w-olive', 'SI HOODED SWEAT (W) OLIVE

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/AW21_RW47051SI_RESZIE_211130_b9b03650-ad86-4afe-8625-e31a5b5e30d7_1000x.png?v=1657908469', 198.69, 0, now(), now(), 'Outerwear', 'SI HOODED SWEAT (W) OLIVE

 ', 'STANDARD ISSUE is our non-seasonal, elevated essentials range branded with our parachute emblem – responsibly designed in East London.⁠ The RÆBURN Women\'s Standard Issue Hooded Sweatshirt is realised in a regular women\'s fit, in a midweight double-face jersey ideal for layering and all-year wear. Manufactured in Portugal from 100% GOTS certified organic cotton.
Features & Benefits
370gsm Organic double-face sweat crew
Precision embroidered parachute emblem
Stepped back hem
Premium weight and feel
Easy Care, wash at 30° degrees
Brand colours meet Standard 100 by Oeko-Tex®
Straight hem finish
x2 side pockets
RÆBURN branded drawcord
RÆBURN organic cotton branded tape
RÆBURN recycled PET branded tab
Fabric Details
100% Organic Cotton Bonded Jersey Sweat
Model is 5’8½”/174cm with a 25”/63cm waist and wears a size Small. Contact us for any sizing queries.

 ', '');
insert into `shesg_product` values (255349023862, 'https://www.raeburndesign.co.uk/products/si-crew-sweat-w-grey', 'SI CREW SWEAT (W) GREY

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/1395706809_ecf7a4bf-99a1-44cc-8529-83acb8d9f3d2_1000x.jpg?v=1657908601', 163.21, 0, now(), now(), 'Outerwear', '', 'STANDARD ISSUE is our non-seasonal, elevated essentials range branded with our pilot\'s parachute emblem – responsibly designed in East London.⁠ The RÆBURN Women\'s Standard Issue Crew Neck Sweatshirt is realised in a regular women\'s fit, in a midweight double-face jersey ideal for layering and all-year wear. Manufactured in Portugal from 100% GOTS certified organic cotton.
Features & Benefits
370gsm Organic double-face sweat crew
Precision embroidered parachute emblem
Stepped back hem
Premium weight and feel
Easy Care, wash at 30° degrees
Brand colours meet Standard 100 by Oeko-Tex®
Straight hem finish
RÆBURN organic cotton branded tape
RÆBURN recycled PET branded tab
Fabric Details
100% Organic Cotton Bonded Jersey Sweat
Model is 5’8½”/174cm with a 25”/63cm waist and wears a size Small. Contact us for any sizing queries.', '');
insert into `shesg_product` values (255349023863, 'https://www.raeburndesign.co.uk/products/air-brake-cuff-tee-black', 'AIR BRAKE CUFF TEE BLACK', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RW42014R21S_C000_A_7812b8a9-755b-4078-a48b-8764d4837779_1000x.jpg?v=1672004329', 123.47, 0, now(), now(), 'Outerwear', 'AIR BRAKE CUFF TEE BLACK', 'The RÆBURN Women\'s Air Brake Cuff Tee has been manufactured in Portugal and produced in a 170gsm Global Organic Textile Standard Approved 100% organic cotton interlock which meets the OCS 100 - Organic Content Standard, verifying the presence and amount of organic content in the final raw material. The fabric is piece dyed in in GOTS certified dye house to meet Standard 100 by Oeko-Tex® confirming they have been tested for harmful substances and given carbon brushed finish to give a luxury hand feel. Sleeve cuff\'s have been bordered with off-cut\'s from our Air Brake production where garments have been RÆMADE from Air Brake Parachute\'s are designed for deployment from a rapidly-moving objects to decrease speed which have been over-dyed in the UK and then finished at the RÆBURN Lab in East London to deliver this series of reimagined tees.
Organic interlock short sleeve t-shirt w. carbon brush finish
Signature set in sleeve to front shoulder, extending to raglan seam across back body
Sleeve cuffs bordered with original Air Brake parachute
Appliqué detail at side vent utilising off-cuts of nylon parachute ribbon
RÆBURN branded tab to side seam LHSAW
Fabric Details
100% Organic Cotton Interlock
Model is 5\'9"/177cm with a 24"/61cm waist and wears a size Medium
Note: RÆMADE items have been created by taking existing surplus materials, products and artefacts and reworking them into completely new products. As a result of this upcycling process, no two RÆMADE products are identical and may include some inherent faults and/or characteristics of the original materials, products and artefacts used to make them.', '');
insert into `shesg_product` values (255349023864, 'https://www.raeburndesign.co.uk/products/l-s-relaxed-tee-off-white', 'L/S RELAXED TEE OFF WHITE

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/143846_Will_Dixon1565_ea645db3-cc73-487b-92b1-b25a8910f4ef_1000x.jpg?v=1675468647', 87.99, 0, now(), now(), 'Outerwear', 'L/S RELAXED TEE OFF WHITE

 ', 'The RÆBURN Men\'s L/S Relaxed Tee is constructed from an organic cotton jersey with tonal ripstop accents. This garment has undergone a specialist dyeing treatment which results in an intentionally faded look, boasting distinct highs and lows throughout the fabric. Each piece is wholly unique and any variance in colour and/or shading is intentional and to be celebrated. Manufactured in Portugal from 100% GOTS-certified organic cotton.
Features & Benefits
285gsm Organic Cotton Jersey
Precision graded embroidered emblem
Premium weight and feel
Easy Care, wash at 30° degrees
Faded Garment Dye Treatment meets Standard 100 by Oeko-Tex®
Breathable eyelets to underarm
Performance ribbed side panel
x1 Military Inspired ripstop pocket
x1 zip chest pocket
Straight hem finish
Fabric Details
100% RÆDUCED Organic Cotton Jersey
100% RÆDUCED Organic Cotton Ripstop

 ', '');
insert into `shesg_product` values (255349023865, 'https://www.raeburndesign.co.uk/products/relaxed-crew-sweat-dark-grey', 'RELAXED CREW SWEAT DARK GREY', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/143846_Will_Dixon1580_1000x.jpg?v=1675469458', 113.53, 0, now(), now(), 'Outerwear', 'RELAXED CREW SWEAT DARK GREY', 'The RÆBURN Relaxed Crew has been manufactured in Portugal, realised in a heavy weight 400gsm loop back cotton. This relaxed fit style features a tonal ripstop chest pocket alongside elbow reinforcements for added protection. This garment has undergone a specialist dyeing treatment which results in an intentionally faded look, boasting distinct highs and lows throughout the fabric. Each piece is wholly unique and any variance in colour and/or shading is intentional and to be celebrated. Further details of note include a precision embroidered parachute emblem to the arm and profile seam detailing throughout.

 Features & Benefits
400gsm Organic Loop back fleece Crew
Precision graded embroidered emblem
Premium weight and feel
Easy Care, wash at 30° degrees
Faded garment dye treatment meets Standard 100 by Oeko-Tex®
Breathable eyelets to underarm
Performance ribbed side panel
x1 Military Inspired ripstop pocket
Straight hem finish
Fabric Details
100% RÆDUCED Organic Cotton loop back

 ', '');
insert into `shesg_product` values (255349023866, 'https://www.raeburndesign.co.uk/products/c9-tee-black-1', 'C9 TEE BLACK

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RM42063M-C000-00_79d7282b-39ee-4a8b-8a06-6d855b34598b_1000x.jpg?v=1675479482', 38.31, 0, now(), now(), 'Outerwear', 'C9 TEE BLACK

 ', 'The RÆBURN Men\'s C9 Logo Tee has become an iconic symbol for the brand. Screen printed in London, the logo depicts the aerial view of an original British Military C9 Parachute. Used by air forces globally, the unique colour blocked construction of white, olive and sand hues allow for camouflage, whilst the fluro orange allows for signalling and detection. Manufactured in Portugal and produced in a 170gsm Global Organic Textile Standard Approved 100% organic cotton interlock, which meets the OCS 100 - Organic Content Standard, verifying the presence and amount of organic content in the final raw material and given carbon brushed finish to give a luxurious hand feel.
Features & Benefits
Organic cotton interlock base w. carbon brush finish
Signature C9 logo screen print to font body
Relaxed fit
Organic cotton rib to collar
Signature RÆBURN set-in sleeve to front shoulder, extending to raglan seam at back
Straight hem finish w. vent to side seam
Cover stitch seam construction throughout
RÆBURN recycled PET branded tab to side seam LHSAW
RÆBURN organic cotton branded tape to internal neckline
Fabric Details
100% RÆDUCED Organic Cotton Interlock', '');
insert into `shesg_product` values (255349023867, 'https://www.raeburndesign.co.uk/products/relaxed-hoodie-off-white', 'RELAXED HOODIE OFF WHITE

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/143846_Will_Dixon1695_1000x.jpg?v=1675470571', 149.01, 0, now(), now(), 'Outerwear', 'RELAXED HOODIE OFF WHITE

 ', 'The RÆBURN Relaxed Hoodie has been manufactured in Portugal, realised in a heavy weight 400gsm loop back cotton. This relaxed fit style features a tonal ripstop zipped chest pocket alongside elbow reinforcements for added protection, further two snap-fastening lower pockets. This garment has undergone a specialist dyeing treatment which results in an intentionally faded look, boasting distinct highs and lows throughout the fabric. Each piece is wholly unique and any variance in colour and/or shading is intentional and to be celebrated. Further details of note include a drawcord adjustable hood, precision embroidered parachute emblem to the arm and profile seam detailing throughout.
Features & Benefits
400gsm Organic Loop back fleece Hoodie
Precision graded embroidered emblem
Premium weight and feel
Easy Care, wash at 30° degrees
Faded Garment Dye Treatment  meets Standard 100 by Oeko-Tex®
x3 piece performance funnel hood
RÆCYCLED PET drawcord w. Silicone tip
Breathable eyelets to underarm
Performance ribbed side panel
x2 pocket w. Branded snaps fastenings
x1 YKK zip chest pocket
RÆBURN recycled PET micro puller
Straight hem finish
RÆBURN recycled internal branded size label
Fabric Details
100% RÆDUCED Organic Cotton loop back

 ', '');
insert into `shesg_product` values (255349023868, 'https://www.raeburndesign.co.uk/products/gd-zt-4-pkt-overshirt-safari', 'GD ZT 4 PKT OVERSHIRT SAFARI

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RM32054M_C261_1_54309731-8420-4845-bc1a-c1d829e09462_1000x.jpg?v=1675962987', 227.07, 0, now(), now(), 'Outerwear', 'GD ZT 4 PKT OVERSHIRT SAFARI

 ', 'The RÆBURN Men’s GD ZT 4 Pkt Overshirt is a relaxed style made in an innovative crinkle effect cloth with ripstop panelling to external pockets and elbow reinforcements. Manufactured in Portugal, the main shell is 100% certified RÆCYCLED Nylon developed by renowned Italian mill, Limonta, and has been dyed by certified dye houses. Exaggerated external pockets and style lines have been inspired by study of US Desert ECWCS (Extended Cold Weather Clothing System) uniform. Adopted by the US Armed Forces from the 1980’s, the uniform consisted of multiple different pieces of apparel which were used in various combinations to meet environmental weather requirements
Features & Benefits
RÆCYCLED Nylon Zip Thru Overshirt, garment dyed
RÆBURN Lightweight Layer 4
Set in sleeve w. gusseted cuff and RÆBURN branded snap fastening
Elbow patch feature to rear sleeve in contrast RÆCYCLED ripstop fabric
Lampo open ended two way zip fastening w. RÆBURN branded grosgrain zip extension
x2 oversized patch pockets to chest w. RÆBURN branded snap fastening
x2 concealed vertical pockets to front body
Straight hem finish w. vent to side body
Half lined
Internal concealed security pocket w. zip fastening at chest
Internal patch pocket
Internal branded RÆBURN label
Fabric Details
Shell: 100% RÆCYCLED Nylon
Lining: 100% RÆCYCLED Nylon
Model is 6\'0"/183cm with a 38"/96.5cm chest and wears a size Medium', '');
insert into `shesg_product` values (255349023869, 'https://www.raeburndesign.co.uk/products/filled-puffa-mid-brown', 'FILLED PUFFA MID BROWN

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RM15051M_C220_2_18f84904-fa42-4556-b79b-5dcb01c3a303_1000x.jpg?v=1675460839', 326.42, 0, now(), now(), 'Outerwear', 'FILLED PUFFA MID BROWN

 ', 'The RÆBURN Filled Puffa is a water-repellent, military-inspired outerwear piece. The shell fabric is crafted from 100% recycled nylon which has undergone a wash treatment to create a crinkle texture and is insulated using 725gsm Recycled loose loft fill. This style has design cues inspired by our seasonal military artefact, the Upper Deck Crewman’s Suit. Manufactured by our responsible factories in China.
Features & Benefits
102gsm
Insulated stand collar w/ strap extension & concealed snap fastening
Panelled feature throughout
Internal rib baseball collar to neckline
Water repellent treatment to Shell
Open ended two-way zip fastening
Double storm flap with curved style line
Concealed snap fastening
Set in sleeve w. rib storm cuff
Panelled feature to sleeve
2x angled slip pockets
1x Internal patch pocket
Straight hemline
Silicone RÆBURN emblem
RÆBURN branded tape pullers
Fully lined
Internal shock cord w. double cord lock adjustment to waist & hemline
Fabric Details
Shell: 100% Recycled Nylon
Lining: 100% Recycled Nylon 64gsm
Fill: 100% Recycled loose loft fill, down schedule 725gsm
Rib: Recycled Nylon / Elastane mix ', '');
insert into `shesg_product` values (255349023870, 'https://www.raeburndesign.co.uk/products/ek-by-raeburn-rainwear-jacket-phantom', 'EK BY RÆBURN RAINWEAR JACKET

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/141733_Will_Dixon23329_1a2215e0-bd5d-4c87-a79d-6eef825b457c_1000x.jpg?v=1675971664', 212.76, 0, now(), now(), 'Outerwear', 'EK BY RÆBURN RAINWEAR JACKET

 ', 'The Earthkeepers® by RÆBURN Rainwear Jacket is a unisex and fully packable style, made from Timberland\'s signature ReBOTL fabric. Spun from 100% recycled plastic bottles, the style is shower resistant and has adjustable bungee toggles in the hood and sleeves for extra protection. Other features include a half zip front, a horizontal chest pocket and cargo style pockets on both sleeves.
Unisex
Half zip overhead silhouette
Central zip pocket at chest
Woven brand label on chest and brand patch on sleeve
Adjustable hem, cuffs and hood
Tree embroidery on back neck
Diagonal cutlines inspired from archive
Centre Back Length: 30"/76cm
Fabric Details
100% Recycled Polyester
Model is 6\'1"/186cm with a 37\'\'/94cm chest and wears a size Medium. Contact us for any sizing queries.', '');
insert into `shesg_product` values (255349023871, 'https://www.raeburndesign.co.uk/products/ek-by-raeburn-beanie-grape-leaf', 'EK BY RÆBURN BEANIE

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/430414_1000x.jpg?v=1675972159', 29.78, 0, now(), now(), 'Outerwear', 'EK BY RÆBURN BEANIE

 ', 'The Earthkeepers® by RÆBURN Beanie is a ribbed 100% cotton knit with a woven brand label on the hem, designed to keep you warm whilst traveling light and taking only what you need.
Fabric Details
100% Cotton', '');
insert into `shesg_product` values (255349023872, 'https://www.raeburndesign.co.uk/products/ek-by-raeburn-globe-crew-undyed', 'EK BY RÆBURN GLOBE CREW

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/450535_1000x.jpg?v=1675973292', 97.16, 0, now(), now(), 'Outerwear', 'EK BY RÆBURN GLOBE CREW

 ', 'The Earthkeepers® by RÆBURN Globe Crew is realised in a relaxed fit, made from 100% recycled, dye-free cotton. An Earthkeepers® embroidered logo is weaved into a Timberland archive globe graphic showcased on both the front and back of the crew.
Features & Benefits
Relaxed fit
Earthkeepers® logo
Print and embroidered Timberland archive globe graphic
Centre Back Length: 29"
Weight: 340g
Fabric Details
100% Recycled, dye-free cotton (colour comes from the recycled feedstock)
Model is 6\'1"/186cm with a 36"/91cm chest and wears a size Medium', '');
insert into `shesg_product` values (255349023873, 'https://www.raeburndesign.co.uk/products/gd-6-pkt-short-safari', 'GD 6 PKT SHORT SAFARI

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RM24051M_C261_1_1000x.jpg?v=1675961066', 113.47, 0, now(), now(), 'Outerwear', 'GD 6 PKT SHORT SAFARI

 ', 'The RÆBURN Men’s GD 6 PKT Short has been cut in a straight fit with vertical seam detailing throughout, produced in an innovative crinkle effect cloth with contrast ripstop panelling. Manufactured in Portugal, the main shell is 100% certified RÆCYCLED Nylon developed by renowned Italian mill, Limonta, and has been dyed by certified dye houses. Our military archive remains a constant source of inspiration, finding beauty in that which was originally designed for function. Exaggerated external slash pockets and style lines have been inspired by one of this seasons key Artefacts; US Desert ECWCS (Extended Cold Weather Clothing System) uniform. Adopted by the US Armed Forces from the 1980’s, the uniform consisted of multiple different pieces of apparel which were used in various combinations to meet environmental weather requirements
Features & Benefits
RÆCYCLED Nylon Short, garment dyed
RÆBURN Layer 2
Vertical seam detailing throughout, inspired by US ECWCS uniform
x2 angled hip pockets w. topstitch and bartack reinforcement
x2 cargo slash pockets to side leg w. RÆBURN branded snap fastening
Slash pocket flaps in contrast RÆCYCLED ripstop fabric
x2 angled welt pockets to back body
Asymmetic yoke seam detail to back body
RÆBURN branded 32L Corozo button fastening to waistband w. zip fly front
x6 beltloops to waistband
Straight hem finish
Internal branded RÆBURN label
Fabric Details
Shell: 100% RÆCYCLED Nylon
Model is 6\'0"/183cm with a 29”/73.5cm waist and wears a size 32', '');
insert into `shesg_product` values (255349023874, 'https://www.raeburndesign.co.uk/products/c9-tee-white', 'C9 TEE WHITE

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/RM42063M_C100_1__1_1000x.jpg?v=1680682984', 38.29, 0, now(), now(), 'Outerwear', 'C9 TEE WHITE

 ', 'The RÆBURN Men\'s C9 Logo Tee has become an iconic symbol for the brand. Screen printed in London, the logo depicts the aerial view of an original British Military C9 Parachute. Manufactured in Portugal and from 100% GOTS certified organic cotton interlock
Features & Benefits
170gsm organic cotton interlock
Carbon brush finish
Easy Care, wash at 30° degrees
Signature C9 logo screen print
Straight hem finish
RÆBURN recycled PET branded tab
RÆBURN organic cotton branded tape
Fabric Details
100% RÆDUCED Organic Cotton Interlock

 ', '');
insert into `shesg_product` values (255349023875, 'https://www.raeburndesign.co.uk/products/ek-by-raeburn-globe-crew-chutney', 'EK BY RÆBURN GLOBE CREW

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/450534_1000x.jpg?v=1675973246', 97.16, 0, now(), now(), 'Outerwear', 'EK BY RÆBURN GLOBE CREW

 ', 'The Earthkeepers® by RÆBURN Globe Crew is realised in a relaxed fit, made from 100% recycled, dye-free cotton. An Earthkeepers® embroidered logo is weaved into a Timberland archive globe graphic showcased on both the front and back of the crew.
Features & Benefits
Relaxed fit
Earthkeepers® logo
Print and embroidered Timberland archive globe graphic
Centre Back Length: 29"
Weight: 340g
Fabric Details
100% Recycled, dye-free cotton (colour comes from the recycled feedstock)
Model is 6\'1"/186cm with a 36"/91cm chest and wears a size Medium', '');
insert into `shesg_product` values (255349023876, 'https://www.raeburndesign.co.uk/products/ek-by-raeburn-globe-tee-chutney', 'EK BY RÆBURN GLOBE TEE

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/450539_1000x.jpg?v=1675973402', 35.46, 0, now(), now(), 'Outerwear', 'EK BY RÆBURN GLOBE TEE

 ', 'The Earthkeepers® by RÆBURN Globe Tee is realised in a relaxed fit, made from 100% recycled, dye-free cotton. An Earthkeepers® branded logo adorns the centre front while a Timberland archive globe graphic is showcased on the back.
Features & Benefits
Relaxed fit
Earthkeepers® logo
Print and embroidered Timberland archive globe graphic
Centre Back Length: 29.5"
Weight: 175g
Fabric Details
100% Recycled, dye-free cotton (colour comes from the recycled feedstock)
Model is 6\'1"/186cm with a 36"/91cm chest and wears a size Medium', '');
insert into `shesg_product` values (255349023877, 'https://www.raeburndesign.co.uk/products/ek-by-raeburn-puffa-new-charcoal-pebble', 'EK BY RÆBURN PUFFA

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/141733_Will_Dixon23237_1000x.jpg?v=1675972203', 397.16, 0, now(), now(), 'Outerwear', 'EK BY RÆBURN PUFFA

 ', 'The Earthkeepers® by RÆBURN Pinnacle Oversized Puffer Jacket is a unisex, lightweight and fully packable style, made from Timberland\'s signature ReBOTL fabric. Spun from 100% recycled plastic bottles, the outer is both shower resistant and durable. The fill is Re:Down® insulation, made entirely of recycled down and feathers. Key features include angled pockets inspired by the archives, and a military-reference digi-camo print.
Unisex
Pack away hood in collar
Chest woven label and sleeve patch
Tree embroidery on back neck
Diagonal pocket design inspired from archive
Centre Back Length: 30"/76cm
Fabric Details
Outer: 100% Recycled Polyester
Fill: Re:down insulation
Model is 6\'1"/186cm with a 37\'\'/94cm chest and wears a size Medium. Contact us for any sizing queries.', '');
insert into `shesg_product` values (255349023878, 'https://www.raeburndesign.co.uk/products/1950s-silk-map-anorak-aeronautical-maps', '1950S SILK MAP ANORAK

 ', 'https://cdn.shopify.com/s/files/1/0382/8714/7139/products/322216_1000x.jpg?v=1672003961', 773.04, 0, now(), now(), 'Outerwear', '1950S SILK MAP ANORAK

 ', 'The 1950s Silk Maps are an increasingly rare artefact that has become an iconic part of the brand, forming an evolving range of luxurious womenswear and accessory pieces. Originally given to Royal Air Force crewmen in WW2 and beyond into the Cold War period of the 1950s, they helped individuals find a route out of enemy territory.⁠ Crafted at the RÆBURN Lab in East London, each piece is entirely unique depending on which part of the individual map we use.⁠
Signature RÆBURN 1950s Silk Map Anorak
Straight cuff & hemline finish
x2 front pockets concealed within angled seams
RiRi CF zip fastening
Fabric Details
100% Silk
Model is 5\'9"/177cm with a 31.5"/80cm chest and wears a size Small', '');
insert into `shesg_product` values (255349023879, 'https://www.parkerclay.com/products/sebli-crossbody-bag?variant=41680990240951', 'Sebli Crossbody Phone Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/files/SEBLI_JADE_01_3000x.jpg?v=1683052147', 128.00, 0, now(), now(), 'Accessories', 'Sebli Crossbody Phone Bag', 'Good things come in small packages, and our Sebli Crossbody Bag is no exception! Simple, convenient, and perfectly sized for your essentials. It\'s handcrafted from ultra-soft goat leather and features an ultra-luxe lined interior, giving your "phone-keys-cards" trio the VIP treatment. And with an

• Crossbody bag crafted from premium Ethiopian leather
• Please note that since genuine leather is a natural material, each crossbody bag can have slight color, texture, and grain variations
• Exterior zip pocket with premium natural brass (gold color) exterior zippered closure
• Natural brass snap closure
• High quality interior cotton lining
• Adjustable crossbody strap
• Comes in 2 natural leather colors: Rust brown and black', '');
insert into `shesg_product` values (255349023880, 'https://www.parkerclay.com/products/miramar-mini-backpack?variant=41656935743671', 'Miramar Mini Backpack', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/MIRAMAR_ZIP_RB_1_3000x.jpg?v=1674068835', 228.00, 0, now(), now(), 'Accessories', 'Miramar Mini Backpack', 'One of our best-loved backpacks, now sized down for quick trips, cute looks, and effortless carrying. Shorter and slightly deeper than the original, we preserved the timeless Miramar style; from thin, lightweight straps and an upper handle, to minimalist pockets inside and out.    • All Parker Clay products are crafted from Ethiopian full-grain leather and premium brass materials. Please note that since genuine leather is a natural material, each leather backpack can have slight color, texture, and grain variations (Rust brown color will be lighter at first and darken with use)
• Adjustable straps
• Premium zipper closure + natural brass (gold color) exterior zipper pocket
• Lined Interior
• Interior Slip Pockets
• Available in four natural leather shades: Rust brown, Olive', '');
insert into `shesg_product` values (255349023881, 'https://www.parkerclay.com/products/nyala-foldover-clutch?variant=41316259365047', 'Nyala Foldover Clutch', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/NYALA_JADE_1_3000x.jpg?v=1658789601', 178.00, 0, now(), now(), 'Accessories', 'Nyala Foldover Clutch', 'The Nyala Foldover Clutch bag is a high-fashion clutch with a nod to Ethiopian style. Powered by women and love for Ethiopian culture, the polished handle rings are made from Ethiopian upcycled artillery, which are also used to make traditional Ethiopian jewelry. This piece transitions effortlessly  • Leather foldover clutch available in three colors: Clay Red, Black, and Sand
• Our bags are crafted from premium Ethiopian full grain leather
• Linen and leather lined interior
• Features two upcycled brass artillery handle rings
• Please note that since leather is a natural material, the specific color, texture, and grain of each bag may vary', '');
insert into `shesg_product` values (255349023882, 'https://www.parkerclay.com/products/makeda-crossbody?pr_prod_strat=use_description&pr_rec_id=dc627119c&pr_rec_pid=9400751686&pr_ref_pid=42234806293&pr_seq=uniform&variant=34762974598', 'Makeda Leather Crossbody Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Parker_Clay_Product_Ecomm29313_3000x.jpg?v=1617235382', 198.00, 0, now(), now(), 'Accessories', 'Makeda Leather Crossbody Bag', 'Is there such a thing as a perfect crossbody bag? We think so. From business to play, this stylish and versatile handbag is one accessory you’ll reach for time and again. Wear it crossbody for comfortable travel on the go, or remove the strap to carry it as a foldover clutch for an evening   •Crossbody bag crafted from premium Ethiopian leather
• Please note that since genuine leather is a natural material, each crossbody bag can have slight color, texture, and grain variations
• Premium natural brass (gold color) exterior zippered closure with leather tab
• Foldover top offers expandable size
• Two interior pockets
• High quality interior cotton lining
• Removable and adjustable crossbody strap
• Comes in 3 natural leather colors: Rust brown, black, cognac', '');
insert into `shesg_product` values (255349023883, 'https://www.parkerclay.com/products/desta-belt-bag?pr_prod_strat=use_description&pr_rec_id=71e0fa0f9&pr_rec_pid=2106439729225&pr_ref_pid=9400751686&pr_seq=uniform', 'Desta Belt Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/DESTA-BB-Angle-Belt-CHE_3000x.png?v=1617225302', 218, 0, now(), now(), 'Accessories', 'Desta Belt Bag', 'Experience the joy of versatility and style with our Desta Leather Belt Bag, inspired by the spirit of Ethiopia. Perfect for faraway adventures or your daily commute, it\'s the ultimate accessory for the modern traveler. This hands-free bag is back and more stylish than ever, outfitted in classic brown or black                                                                                                                    • Belt bag crafted from premium Ethiopian full-grain leather
• Can be used as Fanny pack, crossbody or clutch
• Soft goat leather lined interior
• Available in three natural leather colors: Black, Dark Brown, and Rust Brown
• Premium natural brass (gold color) zipper closures
• Features interior and exterior back panel pockets
• Includes removable, adjustable belt and crossbody straps
• Please note that since leather is a natural material, each belt bag can have slight color, texture, and grain variations', '');
insert into `shesg_product` values (255349023884, 'https://www.parkerclay.com/products/merkato-signature-tote?variant=34762953222', 'Merkato Signature Tote', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Parker_Clay_Product_Ecomm29192_3000x.jpg?v=1626901211', 228.00, 0, now(), now(), 'Accessories', 'Merkato Signature Tote Bag | Full-Grain Leather', 'One of the all-time bestsellers in our collection, this classic women’s leather tote is sure to be a staple in your daily wardrobe. Available in all four signature natural leather colors — Rust Brown, Dark Brown, Black, and Sand — and finished with intricate hand stitching and brushed brass hardware, the Merkato is versatile, sleek, and functional with an interior key ring, zipped pocket, and plenty of room for essentials like the mini clutch or your favorite leather wallet.        • What’s inside the Merkato tote?
This tote features a D-ring, interior pocket perfect for cards, and a 15” laptop sleeve with zipper closure.
• What are the details?
This bag is available in our four signature premium leather finishes, detailed with natural brass hardware & zippers, and can be personalized with natural hot pressed or gold foil monograms.
• What are the dimensions?
The Merkato tote measures 14.5" L x 5" W x 13" H with a 10" handle drop. It weighs approximately 2 lbs.
• What can you use the Merkato tote for?
This is the perfect tote for your essentials, an overnight bag, work, or school!', '');
insert into `shesg_product` values (255349023885, 'https://www.parkerclay.com/products/letty-wallet?pr_prod_strat=copurchase&pr_rec_id=110b04cb1&pr_rec_pid=6810745503927&pr_ref_pid=9400748358&pr_seq=uniform&variant=41101157630135', 'Letty Bifold Slim Wallet', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/LETTY_WALLET_JADE_01_3000x.jpg?v=1647033826', 138, 0, now(), now(), 'Accessories', 'Letty Bifold Slim Wallet', 'Thoughtfully-designed for every day, this women\'s bifold wallet features a slim profile so you can travel bulk-free. With 12 slots for cards, a cash slip, and zippered coin pocket for loose change, you\'ll find plenty of room to fit all your essentials while remaining compact enough to slide into a small bag.

If you\'re on the hunt for a small wallet but don\'t want to sacrifice style, you\'ll love the detailed touches that add sophistication to this minimalist wallet, including the leather pull tab and a brass stud closure.
 • Slim bifold wallet for women crafted from premium vegetable-tanned Ethiopian full-grain leather.
• Available in three natural leather colors: Jade, Rust Brown, and Black
• Please note that since leather is a natural material, each wallet can have slight color, texture, and grain variations
• Exterior coin pocket with leather pull tab and premium natural brass (gold color) zipper closure
• Interior includes cash slip and 12 card slots
• Easy-to-open brass stud closure to ensure items are secure', '');
insert into `shesg_product` values (255349023886, 'https://www.parkerclay.com/products/merkato-signature-tote?pr_prod_strat=copurchase&pr_rec_id=601d9c3da&pr_rec_pid=9400748358&pr_ref_pid=6810745503927&pr_seq=uniform&variant=34762953222', 'Merkato Signature Tote', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Parker_Clay_Product_Ecomm29192_3000x.jpg?v=1626901211', 228, 0, now(), now(), 'Accessories', 'Merkato Signature Tote Bag | Full-Grain Leather', 'One of the all-time bestsellers in our collection, this classic women’s leather tote is sure to be a staple in your daily wardrobe. Available in all four signature natural leather colors — Rust Brown, Dark Brown, Black, and Sand — and finished with intricate hand stitching and brushed brass hardware, the Merkato is versatile, sleek, and functional with an interior key ring, zipped pocket, and plenty of room for essentials like the mini clutch or your favorite leather wallet.         • What’s inside the Merkato tote?
This tote features a D-ring, interior pocket perfect for cards, and a 15” laptop sleeve with zipper closure.
• What are the details?
This bag is available in our four signature premium leather finishes, detailed with natural brass hardware & zippers, and can be personalized with natural hot pressed or gold foil monograms.
• What are the dimensions?
The Merkato tote measures 14.5" L x 5" W x 13" H with a 10" handle drop. It weighs approximately 2 lbs.
• What can you use the Merkato tote for?
This is the perfect tote for your essentials, an overnight bag, work, or school!', '');
insert into `shesg_product` values (255349023887, 'https://www.parkerclay.com/products/city-crossbody-bag?pr_prod_strat=copurchase&pr_rec_id=110b04cb1&pr_rec_pid=7106114945207&pr_ref_pid=9400748358&pr_seq=uniform', 'City Crossbody Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/CITY_1_3000x.jpg?v=1678322762', 128, 0, now(), now(), 'Accessories', 'City Crossbody Bag', 'Summer Days, City Nights. Responsibly sourced from just a single piece of Ethiopian leather, it\'s a seamless approach to a mini-messenger style bag. Without pockets, zippers, or unnecessary bulk, it\'s perfectly lightweight and ready for every urban adventure.
• Crafted from premium Ethiopian full grain leather
• Please note that since leather is a natural material, each product can have slight color, texture, and grain variations
• Single piece of leather
• Magnet Closure
• Soft Lined interior
• Fits all phones', '');
insert into `shesg_product` values (255349023888, 'https://www.parkerclay.com/products/rincon-backpack?variant=34762888454', 'Rincon Backpack', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Parker_Clay_Product_Ecomm29409_3000x.jpg?v=1617224945', 228.00, 0, now(), now(), 'Accessories', 'Rincon Leather Backpack', 'The Rincon Backpack is the ultimate travel or beach backpack. Crafted in Ethiopia with heavy duty canvas and premium leather, it features a spacious interior compartment and exterior straps that can fit a blanket or beach towel. We\'re told that the Rincon Backpack also makes a great diaper bag!
• Crafted from heavy-duty canvas and premium Ethiopian full grain leather
• Please note that since leather and canvas are natural materials, each product can have slight color, texture, and grain variations
• Exterior pocket
• Premium interior zipper pocket
• Unlined interior', '');
insert into `shesg_product` values (255349023889, 'https://www.parkerclay.com/products/hana-clutch?pr_prod_strat=copurchase&pr_rec_id=d5d7e4660&pr_rec_pid=7156587856055&pr_ref_pid=9400740614&pr_seq=uniform', 'Hana Clutch', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/HANA_CLUTCH_RB_1_3000x.jpg?v=1657642060', 98, 0, now(), now(), 'Accessories', 'Hana Clutch', 'Hana Clutch
This clutch is the perfect addition to your travel-day lineup. Sized for the essentials, it’s a great way to keep your phone, wallet, and other vitals organized and accessible within your main bag. Stow your carry-on and free up space on long flights by making this clutch your seat-buddy. Once you land, swap in your adventure-essentials for light travel, urban exploration, and a cool, casual look that’s never out of place.

Baja Collection
Discover timeless travel pieces inspired by our sweetest summer escapes. Just like the destinations we love, these goods marry classic, rustic design with a modern touch of luxury – and hidden features for life on the move.
• Women\'s leather clutch in two color options: rust brown and red
• Crafted from premium Ethiopian full-grain leather
• Please note that since leather is a natural material, each tote bag can have slight color, texture, and grain variations (Rust brown color will be lighter at first and darken with use)
• Premium natural brass (gold color) turnlock closure
• Lined Interior', '');
insert into `shesg_product` values (255349023890, 'https://www.parkerclay.com/products/avila-mini-bag?pr_prod_strat=copurchase&pr_rec_id=cc82ed835&pr_rec_pid=7165660299447&pr_ref_pid=7156587856055&pr_seq=uniform&variant=41303658758327', 'Avila Mini Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/AVILA_GREEN_1_3000x.jpg?v=1659124922', 108, 0, now(), now(), 'Accessories', 'Avila Mini Bag', 'Add a splash of color to any look with the Avila Mini Bag. Sized for just the essentials and styled for the lighter side of life, this mini-tote draws inspiration from some of our best-selling styles – shrunk down to a petite, portable bag that packs a punch. Designed with a minimalist interior, featuring unlined leather and a slip pocket, you might just need one in every color.
  • Women\'s mini handbag crafted from premium Ethiopian full grain leather
• Please note that since leather is a natural material, each mini handbag can have slight color, texture, and grain variations
• Available in: Green, Marigold, Fuchsia, Multi
• Leather Loop for (add on) Crossbody
• Features one interior slip pocket', '');
insert into `shesg_product` values (255349023891, 'https://www.parkerclay.com/products/merkato-small-zip-tote?pr_prod_strat=copurchase&pr_rec_id=29844371d&pr_rec_pid=7112910569655&pr_ref_pid=7165660299447&pr_seq=uniform&variant=41124858658999', 'Merkato Small Zip Tote', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/8_0a5cc7ec-4ed7-4c1b-a2d5-25ff2e33aff2_3000x.jpg?v=1646593809', 198, 0, now(), now(), 'Accessories', 'Merkato Small Zip Tote', 'Cool, compact, and oh-so-convenient, this downsized version of our Merkato Zip Tote Bag includes a detachable shoulder strap, sturdy handles, and an interior phone pocket. Sized for a 13" laptop, it\'s a chic, minimal handbag for your everyday routine.
• Women\'s tote bag with zipper available in two color options: rust brown and black
• Crafted from premium Ethiopian full-grain leather
• Please note that since leather is a natural material, each tote bag can have slight color, texture, and grain variations (Rust brown color will be lighter at first and darken with use)
• Premium natural brass (gold color) zipper closure
• Interior slip pockets
• Fits a 13" laptop
• Removable leather shoulder strap included', '');
insert into `shesg_product` values (255349023892, 'https://www.parkerclay.com/products/alisal-leather-wristlet?pr_prod_strat=copurchase&pr_rec_id=d41c4aa1d&pr_rec_pid=7247937863863&pr_ref_pid=7112910569655&pr_seq=uniform', 'Alisal Leather Wristlet', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/ALISAL_SET_5_3000x.jpg?v=1674068001', 108, 0, now(), now(), 'Accessories', 'Alisal Leather Wristlet', 'Compact and colorful, this easy wristlet is always within reach. It\'s perfectly sized for your phone, keys, and cards, along with a premium zip closure and a rounded, low-profile silhouette.

Now for the hard part – choosing just one.
• Crafted from premium Ethiopian full grain leather
• Please note that since leather is a natural material, each product can have slight color, texture, and grain variations
• Premium natural brass (gold color) exterior zipper closure
• Lined interior', '');
insert into `shesg_product` values (255349023893, 'https://www.parkerclay.com/products/figueroa-fold-over-card-wallet?pr_prod_strat=copurchase&pr_rec_id=8bbd7660f&pr_rec_pid=2106440581193&pr_ref_pid=7247937863863&pr_seq=uniform&variant=19122742427721', 'Figueroa Fold Over Card Wallet', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/FIGUEROA-BLK-Angle-1_73c4de08-b1a2-4e3c-a7d1-9adaf1080319_3000x.jpg?v=1617219904', 58, 0, now(), now(), 'Accessories', 'Figueroa Fold Over Card Wallet', 'The Figueroa Fold Over Card Wallet was designed to be sleek and compact while allowing room for all your cards. Handcrafted from premium leather, with a slim construction and four card slots, the Figueroa wallet is ideal for the on-the-go entrepreneur.  Monogramming is available for this product.
• Crafted from premium Ethiopian full grain leather.
• 4 standard card slots.
• Please note that since leather is a natural material, each product can have slight color, texture, and grain variations.', '');
insert into `shesg_product` values (255349023894, 'https://www.parkerclay.com/products/cord-tacos?pr_prod_strat=copurchase&pr_rec_id=52e20780e&pr_rec_pid=2106445037641&pr_ref_pid=7201690779831&pr_seq=uniform', 'Mesa Cord Tacos', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Cord-Tacos-BLK_3000x.jpg?v=1617233566', 24, 0, now(), now(), 'Accessories', 'Mesa Cord Tacos', 'Stay organized with the Mesa Cord Tacos. Made from premium leather and bundled together as a set of three. Designed to hold earbuds, USB cables, and other cords together in a sleek fashion. As a certified B corp we are committed to sustainable practices. Using excess leather from other products, we are able to create the Mesa Cord Taco, a reminder that even the smallest products can create great impact.
• Bundles of 3
• Crafted from premium Ethiopian full grain leather.
• Please note that since leather is a natural material, each product can have slight color, texture, and grain variations.
• Premium button closure.', '');
insert into `shesg_product` values (255349023895, 'https://www.parkerclay.com/products/merkato-shopper?variant=41087214846135', 'Merkato Shopper', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Merkato-Shopper-RST-Front_1_3000x.png?v=1645038099', 198, 0, now(), now(), 'Accessories', 'Merkato Shopper', 'The definition of a grab-and-go basic, our Merkato Shopper is your new BFF for the weekday routine, weekend adventure, and every errand in between. Featuring a no-frills, full-grain leather construction, interior key rings and phone sleeve, and subtle brass detailing, it\'s the finest in maximalist utility and minimalist style.
• Crafted from premium Ethiopian full-grain leather
• Please note that since leather is a natural material, each product can have slight color, texture, and grain variations (Rust brown color will be lighter at first and darken with use)
• Premium natural brass (gold color) interior zipper pocket
• Unlined interior
• Fits a 15" laptop
• Interior D-ring to hooks for add on shoulder strap', '');
insert into `shesg_product` values (255349023896, 'https://www.parkerclay.com/products/circle-shoulder-strap?pr_prod_strat=copurchase&pr_rec_id=9130e5ad4&pr_rec_pid=7101321674935&pr_ref_pid=7103164252343&pr_seq=uniform', 'Circle Shoulder Strap', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Strap-RST-Segmented_3000x.jpg?v=1644451403', 58, 0, now(), now(), 'Accessories', 'Circle Shoulder Strap', 'Mix and Match the shoulder strap to pair with any of your Parker Clay bags!
• Crafted from premium Ethiopian full-grain leather', '');
insert into `shesg_product` values (255349023897, 'https://www.parkerclay.com/products/taytu-weekender?pr_prod_strat=copurchase&pr_rec_id=7ddb3a01f&pr_rec_pid=2197347958857&pr_ref_pid=7101321674935&pr_seq=uniform', 'Taytu Weekender Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Taytu-Orange-Luggage-02_3000x.jpg?v=1637900633', 448, 0, now(), now(), 'Accessories', 'Taytu Weekender Bag', 'Sleek design. Surprisingly spacious. Meet your stylish new travel companion: The Taytu Weekender Bag. This beautiful leather travel bag is designed with a roomy interior that boasts multiple pockets, a laptop sleeve, and plenty of space to pack clothes, accessories, a couple pairs of shoes for long weekend trips.

When you\'re ready to go, carry it any way you like: throw the adjustable crossbody strap over your shoulder, tote by sturdy leather handles, or slide the trolly sleeve on your roller luggage. Zip pockets inside and out offer easy access to travel docs and essentials when you\'re on the move.

Premium full-grain leather makes this weekend bag ultra-durable—guaranteed to be the perfe
• Weekender travel bag crafted from the most durable material: premium Ethiopian full-grain leather
• Lightweight removable shoulder strap, carry handles, and trolley sleeve
• Large inner compartment
• Interior pockets include three 5" slip pockets and one 11" zippered pocket
• 17" interior padded laptop sleeve
• Large exterior front zip compartment
• Zippered top with natural brass (gold color) zipper
• Reinforced bottom with natural brass feet
• Available in two natural leather colors: Rust Brown and', '');
insert into `shesg_product` values (255349023898, 'https://www.parkerclay.com/products/bale-sling-bag?variant=41152192872631', 'Bale Sling Bag', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/BALE_SLINGBAG_BROWN_01_3000x.jpg?v=1668102174', 228.00, 0, now(), now(), 'Accessories', 'Bale Sling Bag', 'A little bit of structure, a whole lot of style – meet the Bale Sling Bag. Named for the Bale Mountains of Ethiopia, home to stunning landscapes and rare wildlife, this sling-style, gender-neutral messenger bag is designed for everyday exploration and all-day comfort. Based on a versatile, shoulder sling construction, the Bale can be worn as a one-strap backpack, slung across your chest, or conveniently at your side for easy access. Handcrafted from full-grain Ethiopian leather, this unique bag features a durable, comfort-focused strap and two zippered pockets sized for your essentials.
• Belt sling bag crafted from premium Ethiopian full-grain leather
• Lined interior
• Available in two natural leather colors: Black and Rust Brown
• Premium natural brass (gold color) or Matte Black zipper closures
• Features exterior back panel pockets
• Includes adjustable crossbody strap
• Please note that since leather is a natural material, each belt bag can have slight color, texture, and grain variations', '');
insert into `shesg_product` values (255349023899, 'https://www.parkerclay.com/products/mulu-catchall-pouch?pr_prod_strat=copurchase&pr_rec_id=9a1bc5b10&pr_rec_pid=6885641715895&pr_ref_pid=2197347958857&pr_seq=uniform', 'Mulu Catchall Pouch', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/Pouch-RSTBRN-LRG-OPEN_3000x.jpg?v=1655399800', 128, 0, now(), now(), 'Accessories', 'Mulu Catchall Pouch', 'The Mulu Catchall is here for all of your bag-organizing needs. Featuring two interior slip pockets, it\'s perfectly sized for keeping your small essentials at an arm\'s reach – from glasses and makeup to that emergency pack of floss. Upgrade your cosmetic bag with a timeless leather piece that will only get better with age. Monogramming is available for this product.
• Crafted from premium Ethiopian full grain leather
• Please note that since leather is a natural material, each product can have slight color, texture, and grain variations
• Premium natural brass (gold color) exterior zipper closure
• Lined interior', '');
insert into `shesg_product` values (255349023900, 'https://www.parkerclay.com/products/atlas-backpack?variant=19867225391177', 'Atlas Backpack', 'https://cdn.shopifycdn.net/s/files/1/1740/3191/products/RD-FRONT_3000x.jpg?v=1617229372', 448.00, 0, now(), now(), 'Accessories', 'Atlas Backpack', 'Our flagship Atlas Backpack was inspired by our travel between the US and Ethiopia, a journey of over 9,000 miles one-way. The Atlas is the ideal backpack that goes with you on every work venture or weekend adventure. Created for optimal functionality, with an exterior foam-padded laptop compartment and five interior pockets to keep your life organized. The sleek design matched with our premium full grain Ethiopian leather makes the Atlas a fundamental piece to your collection and built to last.
• Premium full-grain Ethiopian Leather.
• Natural brass zip closure to two large compartments accommodates a laptop up to 15".
• Separate exterior zippered and padded computer compartment (fits up to a 15" laptop)
• Durable hardware in antique brass or matte black to make for a perfect complement to premium leather
• 2 adjustable padded leather straps for backpack carry with hardware trim
• Interior features full grain leather passport pocket, large slip pocket, and 2 smaller slip pockets (designed to carry a pocket size Moleskine sketchbook, iPad, and business cards)
• Cotton lined interior with leather trim.
• Internal zipper pocket with leather trim for cables and smaller items.
• Exterior front zip compartment.', '');
insert into `shesg_product` values (255349023901, 'https://ecoalf.com/en-int/products/mina-back-t-shirt-man-white', 'MINA BACK T-SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSMINAB0803MS23-00027_990x.jpg?v=1678725671', 54, 0, now(), now(), 'Outerwear', 'T-SHIRTS', 'Recycled Cotton avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process. Includes our claim Because There Is No Planet B® to share the message wherever you go. With the sale of every garment in our Because There Is No Planet B® collection, we make a 10% donation to the ECOALF Foundation to continue its expansion with the Upcycling the Oceans project. The Mina Back T-shirt is an example of sustainability and protecting biodiversity.', '');
insert into `shesg_product` values (255349023902, 'https://ecoalf.com/en-int/products/gunne-t-shirt-girls-off-white?pr_prod_strat=pinned&pr_rec_id=0f01ed205&pr_rec_pid=7444891107503&pr_ref_pid=7444891992239&pr_seq=uniform', 'GUNNE T-SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSGUNNE0803GS23-001_1187_990x.jpg?v=1678712341', 43, 0, now(), now(), 'Outerwear', 'T-SHIRTS', 'The Gunne short sleeve T-shirt includes our claim Because There Is No Planet B® printed across the chest for you to share the message wherever you go. With the sale of every garment in our Because There Is No Planet B® collection, we make a 10% donation to the ECOALF Foundation to continue its expansion with the Upcycling the Oceans project. Made from 50% recycled Cotton and 50% organic Cotton. Recycled Cotton avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process.
Main fabric: 50% Recycled cotton / 50% Organic cotton
Round neck
Short sleeve
Loose or relaxed fit
Vegan', '');
insert into `shesg_product` values (255349023903, 'https://ecoalf.com/en-int/products/sutar-shirt-man-white', 'SUTAR SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GASRSUTAR0725MS23-00022_990x.jpg?v=1681893720', 113, 0, now(), now(), 'Outerwear', 'T-SHIRTS', 'The Sutar shirt is made from 100% Linen. Linen is a high-performance natural fibre with a short growing period. It is also recyclable and biodegradable. Linen is highly durable, and ensures fast heat dissipation, making the wearer feel cooler than the ambient temperature. They represent the range of oceanic coral tones that are disappearing from our seas as a result of high temperatures and pollution. A mono-material garment that promotes the circular economy.Model measurements:', '');
insert into `shesg_product` values (255349023904, 'https://ecoalf.com/en-int/products/vent-t-shirt-man-white', 'VENT T-SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSVENTS0803MS23-00057_990x.jpg?v=1676569248', 51, 0, now(), now(), 'Outerwear', 'T-SHIRTS', 'The Vent T-shirt contains 50% of our innovative recycled Cotton which significantly reduces water consumption without compromising comfort and avoids the generation of additional textile waste, resulting in significant resource savings compared to virgin Cotton, whether conventional or organic. With colours that represent the loss of vibrant colours of the coral beds of our oceans and how they are turning white as a result of high temperatures and pollution. Lost colours that symbolise the last line of defence, a call for help for the restoration of the rainforests of our oceans.
Model measurements:
Height:185cm
Bust:86cm
Waist:70cm', '');
insert into `shesg_product` values (255349023905, 'https://ecoalf.com/en-int/products/stellen-long-sleeve-maillot-woman-brown', 'STELLEN PRO LONG SLEEVE MAILLOT BROWN', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GAJKSTELL0523WW22_12986_990x.jpg?v=1677082847', 188.00, 0, now(), now(), 'Outerwear', 'CYCLING WOMAN', 'Beat the cold this winter with our Stellen Long Sleeve Maillot to keep you warm. The Maillot is made with breathable and quick dry materials that will help you manage your rising temperature while you ride this winter season.
82% Recycled Polyamide / 18% Elastane
Reflective prints
Back pocket
Invisible side pocket
Reduces microplastic pollution
Breathable
Quick Dry
UV Protection
Pilling Resistant
Invisible back pocket with a waterproof layer to protect objects from sweat
Model measurements
Height: 178cm
Bust: 85cm
Waist: 60cm', '');
insert into `shesg_product` values (255349023906, 'https://ecoalf.com/en-int/products/great-b-sweatshirt-man-off-white', 'GREAT B SWEATSHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GASTGREAT0800MS23-00138_990x.jpg?v=1681309624', 108, 0, now(), now(), 'Outerwear', 'MEN\'S SWEATSHIRTS', 'The Great B sweatshirt has a round neck and includes our claim Because There Is No Planet B® printed across the chest for you to share the message wherever you go. With the sale of every garment in our Because There Is No Planet B® collection, we make a 10% donation to the ECOALF Foundation to continue its expansion with the Upcycling the Oceans project. 50% is made from our innovative recycled Cotton which significantly reduces water consumption without compromising comfort and avoids the generation of additional textile waste. Recycled Cotton comes from both used clothing and textile waste in the production process. A thin, soft, top-quality sweatshirt.

Model measurements:
Height:185cm
Bust:86cm
Waist:70cm
Model wears size M', '');
insert into `shesg_product` values (255349023907, 'https://ecoalf.com/en-int/products/penfi-t-shirt-man-grey-melange?pr_prod_strat=pinned&pr_rec_id=8f311f81d&pr_rec_pid=7444893237423&pr_ref_pid=7444895039663&pr_seq=uniform', 'PENFI T-SHIRT GREY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSPENFI0055MS23-30280_990x.jpg?v=1681895214', 53.94, 0, now(), now(), 'Outerwear', 'T-SHIRTS', 'The Penfi T-shirt is made from 50% organic Cotton and 50% recycled Cotton. Recycled Cotton avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process. With the ECOALF label on the sleeve and printed text on the front
.Model measurements:
Height:187cm
Bust:96cm
Waist:76cm', '');
insert into `shesg_product` values (255349023908, 'https://ecoalf.com/en-int/products/marcos-jersey-polo-shirt-man-navy', 'MARCOS JERSEY POLO SHIRT DEEP NAVY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GAPOMARCO0803MS23-16038_990x.jpg?v=1681733649', 91.68, 0, now(), now(), 'Outerwear', 'MEN\'S POLO SHIRTS', 'The Penfi T-shirt is made from 50% organic Cotton and 50% recycled Cotton. Recycled Cotton avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process. With the ECOALF label on the sleeve and printed text on the front.
Main fabric: 50% Recycled cotton / 50% Organic cotton
Round neck
Short sleeve
Vegan
Model measurements:
Height:187cm
Bust:96cm
Waist:76cm
Model wears size M
', '');
insert into `shesg_product` values (255349023909, 'https://ecoalf.com/en-int/products/theo-long-sleeve-polo-shirt-man-white', 'THEO LONG SLEEVE JERSEY POLO SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GAPOTHEAL0803MS23-00078_990x.jpg?v=1681476844', 91.68, 0, now(), now(), 'Outerwear', 'MEN\'S POLO SHIRTS', 'The Theo long sleeve polo shirt has the ECOALF logo embroidered across the chest. Made from 50% organic Cotton and 50% recycled Cotton. Recycled Cotton avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process. A stylish, timeless polo shirt with which we protect biodiversity.
Main fabric: 50% Recycled cotton / 50% Organic cotton
Long sleeve
Button closure
Vegan
Model measurements:
Height:185cm
Bust:96cm
Waist:69cm
Model wears size M', '');
insert into `shesg_product` values (255349023910, 'https://ecoalf.com/en-int/products/cardiff-vest-girls-ash', 'CARDIFF VEST WHITE', 'https://ecoalf.com/en-int/products/cardiff-vest-girls-ash', 111.00, 0, now(), now(), 'Outerwear', ' COATS KIDS AW22', 'The Cardiff vest jacket has a zip fastening and two front pockets. Mono-material, made from 100% recycled Polyester from PET plastic bottles, promotes the circular economy. By transforming used plastic bottles into recycled Polyester, we reduce the steps in the production process and therefore save on CO2 emissions. We also give a second life to materials that would otherwise be considered waste. A sustainable, ultra-lightweight vest.
Main fabric: 100% Recycled polyester
Lining: 100% Recycled polyester
Fill: 100% Recycled polyester (FELLEX®)
This item contains bluesign® APPROVED fabrics
Vislon zip
Two front pockets
Ultralight
Water-repellent
PFC-free
Vegan', '');
insert into `shesg_product` values (255349023911, 'https://ecoalf.com/en-int/products/almendro-knit-sweatshirt-man-light-beige', 'ALMENDRO KNIT SWEATSHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/ECF_GAKNALMEN0647MS23-050_3741_990x.jpg?v=1677839255', 39.42, 0, now(), now(), 'Outerwear', 'ECOALF 1.0 MEN AND WOMAN', 'The Almendro knit sweatshirt has a hood and a front zip fastening. Recycled wool and Cashmere are our alternative to avoid using animal-derived raw materials. At ECOALF, we are concerned about animal welfare and that’s why we are PETA-Approved Vegan certified (People for the Ethical Treatment of Animals). Recycled Wool and Cashmere are the only animal-derived raw materials present in our collections. A sweatshirt with an adjustable drawstring hood and two kangaroo pockets. Designed to escape the cold.
Main fabric: 70% Recycled Wool / 30% Recycled Cashmere
Adjustable drawstring hood
Front zip fastening
Two kangaroo pockets
Vegan
Model measurements:
Height:188cm
Bust:96cm
Waist:79cm
Model wears size M', '');
insert into `shesg_product` values (255349023912, 'https://ecoalf.com/en-int/products/paris-t-shirt-man-urban-grey', 'PARIS PERFORMANCE T-SHIRT GREY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSPARIS0524MW22_38614_990x.jpg?v=1676289304', 81.00, 0, now(), now(), 'Outerwear', ' RUNNING MAN', 'The Paris T-shirt is an all-in-one running garment. Its comfort, breathability and quick-drying fabric make it a must-have for both colder, wetter days and sunny days. Wear it at any time of day, even at night, because its reflective details will keep you visible at all times.
90% Recycled Polyamide / 10% Elastane
Reflective prints
Back perforation for breathability
Reduces microplastic pollution
Breathable
Quick Dry
UV Protection
Soft Touch
Model measurements
Height: 181cm
Bust: 96cm
Waist: 76cm
Model wears size M', '');
insert into `shesg_product` values (255349023913, 'https://ecoalf.com/en-int/products/balbi-jacket-man-mist?pr_prod_strat=pinned&pr_rec_id=7b7be9ed2&pr_rec_pid=7444850278575&pr_ref_pid=7444873052335&pr_seq=uniform', 'BALBI JACKET GREY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GAJKBALBI0326MS23-99617_990x.jpg?v=1681897202', 296.91, 0, now(), now(), 'Outerwear', 'MEN JACKETS', 'The Balbi 3/4 jacket has side zip pockets with hidden buttons. Made from 48% recycled Nylon. Recycled Nylon is the ECOALF alternative to virgin Nylon. By using it, we prevent waste from going to landfills or burning. We also achieve significant savings in resources such as water and energy in the production process. A jacket committed to the Planet.
Main fabric: 52% Organic cotton / 48% Recycled nylon
Lining: 100% Recycled polyester
Inner mesh lining
Two side pockets with zip and hidden buttons.
Adjustable inner drawstring at the waist
3/4 jacket
Water-repellent
PFC-free
Vegan
Model measurements:
Height:187cm
Bust:96cm
Waist:76cm', '');
insert into `shesg_product` values (255349023914, 'https://ecoalf.com/en-int/products/amed-t-shirt-man-urban-grey', 'AMED BALANCE T-SHIRT GREY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSAMEDA0532MW22_38699_990x.jpg?v=1678116321', 64.90, 0, now(), now(), 'Outerwear', ' SPORTS MAN', 'The Amed T-shirt is a lighter option better suited to hot and arid conditions. The breathability together with the stretchability and softness of the material makes it an easy and comfortable wear.
97% Micromodal / 3% Elastane
Reduces microplastic pollution
Breathable
Lightweight
4-Way Stretch
Soft Touch
Model measurements
Height: 181cm
Bust: 96cm
Waist: 76cm
Model wears size S', '');
insert into `shesg_product` values (255349023915, 'https://ecoalf.com/en-int/products/ethica-trousers-man-caviar', 'ETHICA TROUSERS CAVIAR', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GAPAETHIC0227MS23-29940_990x.jpg?v=1681890791', 120, 0, now(), now(), 'Outerwear', 'MEN\'S TROUSERS AND BERMUDA SHORTS', 'The Ethica trousers have an elasticated waist with adjustable drawstring. They contain recycled Cotton which avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process. The colours represent how waste is affecting the coral beds of our oceans, causing them to lose their bright colours and turn white.
Main fabric: 75% Organic cotton / 23% Recycled cotton / 2% Elastane
Elasticated adjustable drawstring waist
Regular fit
Vegan
Model measurements:
Height:187cm
Bust:96cm
Waist:76cm
Model wears size M

', '');
insert into `shesg_product` values (255349023916, 'https://ecoalf.com/en-int/products/berja-sweatshirt-man-smokey-blue?pr_prod_strat=pinned&pr_rec_id=38ea9baa1&pr_rec_pid=7444884521135&pr_ref_pid=7444864499887&pr_seq=uniform', 'BERJA SWEATSHIRT BLUE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GASTBERJA0861MS23-15262_990x.jpg?v=1676626478', 100, 0, now(), now(), 'Outerwear', ' MEN\'S SWEATSHIRTS', 'The Berja sweatshirt is made from our innovative recycled Cotton which drastically reduces water consumption without compromising comfort. This sweatshirt is soft, thin and the range of colours represents the coral beds of our oceans that are lost every day as a result of high temperatures and pollution. Lost colours that symbolise the last line of defence, a call for help for the restoration of the rainforests of our oceans.
Main fabric: 50% Recycled cotton / 50% Organic cotton
Fine quality
Round neck
Vegan
Model measurements:
Height:185cm
Bust:96cm
Waist:69cm
Model wears size M', '');
insert into `shesg_product` values (255349023917, 'https://ecoalf.com/en-int/products/raffi-t-shirt-man-natural', 'RAFFI OVERSIZE T-SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSRAFFI0823MS23-22423_990x.jpg?v=1681894476', 62.00, 0, now(), now(), 'Outerwear', ' MEN\'S T-SHIRTS', 'The Raffi oversize sweatshirt is made from 100% recycled Cotton and is part of the “Made to be Re-Made” collection. Given that it is mono-material, it can be recycled again at the end of its useful life to avoid landfill and therefore promotes the circular economy. Thanks to our partnership with the Loop™ we are working to collect these garments at the end of their life cycle and turn them into new garments.
Main fabric: 100% Recycled cotton
Round neck
Oversize
Ribbed cuffs
Drop shoulders
Vegan

Model measurements:
Height:185cm
Bust:86cm', '');
insert into `shesg_product` values (255349023918, 'https://ecoalf.com/en-int/products/big-size-baku-sports-backpack-unisex-vapour-grey', 'UNISEX BIG SIZE BAKU SPORTS BACKPACK GREY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/MOCHILAgris_1.jpg?v=1678285579', 160.00, 0, now(), now(), 'Outerwear', 'MEN\'S SPORTS ACCESSORIES', 'The Baku sports backpack is perfect to carry your belongings while exercising. Your stuff will be safe no matter if it rains, as it is waterproof.
100% Recycled Polyester
Reduces microplastic pollution
Waterproof
Dimensions:
Lenght: 51cm
Width: 27,5cm
Height: 29cm
Capacity: 41L
Caring Instructions
Do not wash
Do not bleach
Rinse with care
Do not iron
Do not dry clean', '');
insert into `shesg_product` values (255349023919, 'https://ecoalf.com/en-int/products/california-pants-unisex-navy?pr_prod_strat=pinned&pr_rec_id=cb52e2505&pr_rec_pid=7448335876271&pr_ref_pid=7448335188143&pr_seq=uniform', 'CALIFORNIA UNISEX PANTS DEEP NAVY', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GAPACALIF0822UW22_160139_990x.jpg?v=1676284811', 112, 0, now(), now(), 'Outerwear', 'LOUNGEWEAR MAN', 'The California pants will keep you cozy and warm whether you are working out or relaxing at home. Made 100% recycled cotton, you can combine then with the Orlando sweatshirt or Madagascar sweatshirt to get the total 100% comfy look.
100% Recycled Cotton
Unisex
Reduces microplastic pollution
Caring Instructions
Machine Wash. Maximum Temperature 30ºC
Do not bleach
Do not tumble dry
Do not iron
Wash in cold', '');
insert into `shesg_product` values (255349023920, 'https://ecoalf.com/en-int/products/dera-t-shirt-man-white?pr_prod_strat=pinned&pr_rec_id=af7bddb06&pr_rec_pid=7444890484911&pr_ref_pid=7444850278575&pr_seq=uniform', 'DERA T-SHIRT WHITE', 'https://cdn.shopifycdn.net/s/files/1/0553/2804/7279/products/GATSDERAL0803MS23-00032_990x.jpg?v=1676286382', 53, 0, now(), now(), 'Outerwear', 'MEN\'S T-SHIRTS', 'The Dera oversize T-shirt is made from recycled Cotton which avoids the generation of additional textile waste and saves a large amount of resources compared to virgin Cotton, whether conventional or organic. Recycled Cotton comes from both used clothing and textile waste in the production process. A T-shirt that is gentle on you and the Planet, with a range of colours that represents the loss of vibrant colours of the coral beds of our oceans and how they are turning white as a result of high temperatures and pollution. Lost colours that symbolise the last line of defence, a call for help for the restoration of the rainforests of our oceans.
Main fabric: 50% Recycled cotton / 50% Organic cotton
Round neck
Short sleeve
Oversize
Front outside pocket
Vegan
Model measurements:
Height:187cm
Bust:96cm
Waist:76cm
Model wears size M', '');
insert into `shesg_product` values (255349023921, 'https://www.elleevansswimwear.com.au/collections/verge-collection/products/islet-bikini-top-1', 'islet bikini top', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/Isletbikinitop2oat_6b41a885-2ae5-4cc5-a4d4-e7287cb30f9e_2048x.png?v=1671448026', 156, 0, now(), now(), 'Swimwear', 'islet bikini top', '- Made from 78% Recycled ECONYL® Nylon fiber and 22% XTRA LIFE LYCRA®
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia', '');
insert into `shesg_product` values (255349023922, 'https://www.elleevansswimwear.com.au/collections/kids-swim/products/belinda-onepiece-rolling-stone-print', 'Belinda Onepiece', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/Photo-30_2048x.jpg?v=1616579009', 61.00, 0, now(), now(), 'Swimwear', '
KIDS SWIM', 'Made from sun-safe UPF 50+ recycled lycra with cap sleeves that keep shoulders covered or long sleeves to protect little arms, the Belinda knows how to get kids by in an Aussie summer. In our unique prints, with bright white trim, this little swimsuit doesn’t compromise on practicality for its beauty. A scoop back allows easy dressing and undressing, even when wet, so littles can jump in and out of the pool all day.
Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled Nylon 22% XTRA LIFE LYCRA® using Regenerated ECONYL® Nylon fiber
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia

Chiara wears our size 2-3 here and is 4 years old
Leila wears our size 6-7 here and is 7 years old', '');
insert into `shesg_product` values (255349023923, 'https://www.elleevansswimwear.com.au/collections/kids-swim/products/josh-rashie-never-never-print', 'Josh Rashie', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/Photo-14_2048x.jpg?v=1616579004', 58.00, 0, now(), now(), 'Swimwear', 'KIDS SWIM', 'It just isn’t an Aussie summer without slip, slop, slap, and we’ve got the “slip” covered with our UPF 50+ lycra rashie. Envelope neck opening makes it easier for little heads to squeeze through without compromising on coverage, available in our standout Never Never Print or super-cool Rolling Stone Print. Throw on your Josh Rashie with its matching Kyle Swim Shorts, “slop” on your sunscreen and “slap” on a hat and you’re golden.
Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled Nylon 22% XTRA LIFE LYCRA® using Regenerated ECONYL® Nylon fiber
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia

Lenny wears our size 8-9 and is 9 years old', '');
insert into `shesg_product` values (255349023924, 'https://www.elleevansswimwear.com.au/products/stem-bikini-top-never-never-print?pr_prod_strat=use_description&pr_rec_id=b473fbd48&pr_rec_pid=4198910230562&pr_ref_pid=3902372937762&pr_seq=uniform', 'Stem Bikini Top - Never Never Print', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/Stem_Top_RS7_never_never_fc3fa795-1e20-4d34-81ab-a26aa015827f_2048x.jpg?v=1616578948', 68.00, 0, now(), now(), 'Swimwear', 'Stem Bikini Top - Never Never Print', 'Literally the coolest way to stay cool this Summer, the Stem Top can take your teen from beach to yoga to festival and back again. Double lined for support with a high neck and cute cap sleeves.
Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled Nylon 22% XTRA LIFE LYCRA® using Regenerated ECONYL® Nylon fibre
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia

Claudine wears our size 14 and is 14 years old ', '');
insert into `shesg_product` values (255349023925, 'https://www.elleevansswimwear.com.au/products/stem-bikini-top-hot-pink?pr_prod_strat=use_description&pr_rec_id=45f493d08&pr_rec_pid=4198910394402&pr_ref_pid=4198910230562&pr_seq=uniform', 'Stem Bikini Top - Hot Pink', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/Stem_Top_RS7hot_pink_0878cd65-2f66-4cce-8e48-9de82a3bc4c6_2048x.jpg?v=1616578948', 68.00, 0, now(), now(), 'Swimwear', 'Stem Bikini Top - Hot Pink', 'Literally the coolest way to stay cool this Summer, the Stem Top can take your teen from beach to yoga to festival and back again. Double lined for support with a high neck and cute cap sleeves.
Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled Nylon 22% XTRA LIFE LYCRA® using Regenerated ECONYL® Nylon fibre
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia

Claudine wears our size 14 and is 14 years old', '');
insert into `shesg_product` values (255349023926, 'https://www.elleevansswimwear.com.au/collections/new-active/products/slate-short-never-never-print', ' Slate Short', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/SlateShortNNFront_2048x.jpg?v=1616578900', 61.00, 0, now(), now(), 'Swimwear', 'Slate Short', 'Base level comfort, what could be better than shorts that hit the perfect length between bike shorts and hot pants? Fully lined so you can squat til you drop and ft. zero seams around your waist so the waistband simply refuses to dig in or roll.
Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.
Content + Care:
- Made from VITA Xtra Life Nylon LYCRA® using Regenerated ECONYL® Nylon fiber
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia

Dominique wears our size S and is an AUS size 8-10', '');
insert into `shesg_product` values (255349023927, 'https://www.elleevansswimwear.com.au/collections/womans-swim/products/moss-scrunchie', 'Moss Scrunchie', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/MossScrunchieMG_ee76a174-e2d8-4cde-abea-dd66d0ca7a5d_2048x.jpg?v=1616578774', 11.00, 0, now(), now(), 'Swimwear', '
WOMENS SWIM', 'Keep your locks in check both in and out of the water with this quick drying scrunchie. Mix or match to your swimsuit with 5 prints and colours.

Content + Care:
- Made from 78% Recycled Nylon 22% XTRA LIFE LYCRA® using Regenerated ECONYL® Nylon fibre
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia', '');
insert into `shesg_product` values (255349023928, 'https://www.elleevansswimwear.com.au/collections/womans-swim/products/print-tula-onepiece', 'print tula onepiece', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/Tulaprintonepiece1_2048x.png?v=1671451417', 155.00, 0, now(), now(), 'Swimwear', ' WOMENS SWIM', 'A pretty perfect onepiece even if we do say so ourselves. With clean lines and the most classic of cuts; the tula gives you a semi-high cut leg, thick straps, and a low cut back, while delicate shell buttons adorn the front. This onepiece will be the one that you turn to again and again over the years.

Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled ECONYL® Nylon fiber and 22% XTRA LIFE LYCRA®
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia', '');
insert into `shesg_product` values (255349023929, 'https://www.elleevansswimwear.com.au/products/tula-onepiece?pr_prod_strat=use_description&pr_rec_id=15983c37e&pr_rec_pid=6825929080855&pr_ref_pid=6855839252503&pr_seq=uniform', ' tula onepiece', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/TulaOnepieceOakMilk3_2048x.png?v=1671789645', 155.00, 0, now(), now(), 'Swimwear', ' tula onepiece', 'A pretty perfect onepiece even if we do say so ourselves. With clean lines and the most classic of cuts; the tula gives you a semi-high cut leg, thick straps, and a low cut back, while delicate shell buttons adorn the front. This onepiece will be the one that you turn to again and again over the years.

Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled ECONYL® Nylon fiber and 22% XTRA LIFE LYCRA®
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia', '');
insert into `shesg_product` values (255349023930, 'https://www.elleevansswimwear.com.au/collections/womans-swim/products/cindy-onepiece-1?variant=32883982041111', 'Cindy Onepiece', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/CindyOnepieceW1_11024c52-389c-4a29-932a-1f7db0b5fe8c_2048x.jpg?v=1616578821', 141.00, 0, now(), now(), 'Swimwear', ' WOMENS SWIM', 'The new classic. Like its namesake, the Cindy is feminine af. Subtle frills skimming your curves and simple shoestring straps make this onepiece just so darn easy to wear.
Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled Nylon 22% XTRA LIFE LYCRA® using Regenerated ECONYL® Nylon fibre
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia

Annalise wears our size L bottoms and XL top and is an AUS size 12', '');
insert into `shesg_product` values (255349023931, 'https://www.elleevansswimwear.com.au/collections/womans-active/products/oh-three-top-medium-clay?variant=40496586227735', 'OH THREE TOP -Medium/Clay', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/IMG_3855_2048x.jpg?v=1675907511', 31.00, 0, now(), now(), 'Swimwear', '
OUR WAREHOUSE SHOP', 'The ultimate two in one, the Oh Three Top is by far your fav sports bra, it\'s been described as "Super supportive yet feels naked at the same time." and "The best sports bra I\'ve ever owned!" But not only will it keep you in check at the gym or on the yoga mat, but it\'s also been designed to be worn in the waves. So whether you\'re just after some extra support for your DD+\'s or you want the confidence of knowing you\'re not about to fall out of your string bikini while your doing laps, the Oh Three has all your bases covered.', '');
insert into `shesg_product` values (255349023932, 'https://www.elleevansswimwear.com.au/collections/verge-collection/products/atoll-onepiece', 'atoll onepiece', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/AtollOnepiece1_2048x.png?v=1666602752', 172.00, 0, now(), now(), 'Swimwear', '
VERGE COLLECTION ', 'With clean lines and chic one-shoulder cut, the Atoll’s contrasting fabrics flow effortlessly around the body. Featuring a high-cut leg and one-sided shoulder strap this onepiece is fully lined with a little extra through the bust to make sure you’re covered in all the right places. Your statement onepiece for the Summer is here.

Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled ECONYL® Nylon fiber and 22% XTRA LIFE LYCRA®
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia', '');
insert into `shesg_product` values (255349023933, 'https://www.elleevansswimwear.com.au/collections/verge-collection/products/mesa-bikini-bottom-1', 'mesa bikini bottom', 'https://cdn.shopifycdn.net/s/files/1/0248/4361/6290/products/mesabikinibottomoatmilk3_2048x.png?v=1667300370', 64.00, 0, now(), now(), 'Swimwear', ' VERGE COLLECTION ', 'The mesa takes the basic bikini bottom to greater heights, cut to sit high on your hip and give you that loooong leg, the gathered waistband with a soft elastic, and fully lined (double in the front) means the mesa has you covered in the comfort department.
Like your bottoms high-waisted but just as cute? The delta is your go-to high bikini bottom.

Part of our efforts to be sustainable means we make everything to order. Our processing time is typically around four to six days from when we receive your order to when we ship your order.

Content + Care:
- Made from 78% Recycled ECONYL® Nylon fiber and 22% XTRA LIFE LYCRA®
- Hand wash (or gentle machine wash) in cold water.
- Designed, Printed and Made to Order in Melbourne, Australia', '');
insert into `shesg_product` values (255349023934, 'https://article22.com/collections/on-sale/products/cosmos-ring-yellow-gold', 'COSMOS RING 14K YELLOW GOLD - SALE 35% OFF

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/COSMOS_STAR_RING_YG-_created_1024x1024@2x.jpg?v=1596126085', 98.00, 0, now(), now(), 'Accessories', 'SALE', 'The Star. The Moon. The Sapphire Eye of Protection.
These universal symbols tell the story of the Laotian villagers, who farmed their rice fields by the light of the stars and moon during wartime, so they could not be seen by soaring planes by day.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
$150 Star clears 5m2 of Laotian landscape
$150 Moon clears 5m2 of Laotian landscape
$185 Sapphire Eye Of Protection clears 5m2 of Laotian landscape', '');
insert into `shesg_product` values (255349023935, 'https://article22.com/collections/on-sale/products/cosmos-ring-rose-gold', 'COSMOS RING 14K ROSE GOLD - SALE 35% OFF

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/COSMOS_RING_EYE_RG_1024x1024@2x.jpg?v=1596125303', 98.00, 0, now(), now(), 'Accessories', 'SALE', 'The Star. The Moon. The Sapphire Eye of Protection.
These universal symbols tell the story of the Laotian villagers, who farmed their rice fields by the light of the stars and moon during wartime, so they could not be seen by soaring planes by day.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
$150 Star clears 9m2 of Laotian landscape
$150 Moon clears 9m2 of Laotian landscape
$185 Sapphire Eye of Protection clears 12m2 of Laotian landscape ', '');
insert into `shesg_product` values (255349023936, 'https://article22.com/collections/on-sale/products/laos-dome-earrings-worn-by-emma-watson-ear-cuff-set', 'SET - LAOS DOME EARRINGS + VIRTUOUS CIRCLE EAR CUFF (SAVE $35)

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/emma_cuff_set_b0d99ed5-e168-4f69-a30a-f1e78c309c75_1024x1024@2x.png?v=1587516422', 165.00, 0, now(), now(), 'Accessories', 'SALE', 'These earrings are the definition of sustainable: environmentally, they are upcycled from shrapnel and debris, culturally, they are made by fair trade Laotian artisans who developed this craft technique in the 1970s, and socially, men and women work side by side at homemade earthen kilns in their gardens.
Emma Watson wore these earrings and told the story of our jewelry on The Ellen Show as part of her Beauty and the Beast The Press Tour, promoting sustainable and ethical fashion brands.
If you\'re curious to know how it almost didn\'t happen READ THE FULL STORY.
Made from our signature transformed metal and finished with sterling silver, these earrings are effortlessly chic, super lightweight and comfortable to wear.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts contributing directly to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023937, 'https://article22.com/collections/on-sale/products/resolution-wrap-x10-bundle', 'BUNDLE - RESOLUTION WRAPS (SAVE $10-40)

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/Resolution_black_Bundle_1024x1024@2x.jpg?v=1670022793', 100.00, 0, now(), now(), 'Accessories', 'SALE', 'Like that string around your finger, the Resolution Wrap is a reminder to make and keep your resolutions all year long, or until it falls off... If you find the PEACEBOMB Al Bead once the thread breaks it is meant to be. String it onto your favorite necklace to continue the tradition and keep your resolutions in once place - close to your heart.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023938, 'https://article22.com/collections/on-sale/products/little-but-fierce-diamond-bangle-necklace', 'SET - LITTLE, BUT FIERCE DIAMOND BANGLE + NECKLACE (SAVE$50)

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/SET-LBF-_150_150_1024x1024@2x.png?v=1636654027', 250.00, 0, now(), now(), 'Accessories', 'SALE', 'FOR THE FEARLESS
"though she be but little, she is fierce" A Midsummer Nights Dream - William Shakespeare.

1.7mm White Diamond embedded in the authentic Peacbomb Aluminum Skinny Bangle. Available in SML and STD sizes.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023939, 'https://article22.com/collections/on-sale/products/peace-all-around-bangle-x10-bundle-save-40-reg-700', 'BUNDLE - PEACE ALL AROUND BANGLE X10 BUNDLE (SAVE $225 UP TO 30%)

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/Peace_all_around_Bangle_Bundle_1024x1024@2x.jpg?v=1574459737', 525.00, 0, now(), now(), 'Accessories', 'SALE', 'Peace all around is our wish for the world in 22 languages.
A message inspired by our namesake, ARTICLE22, which we named after the Universal Declaration of Human Rights: Everyone, as a member of society, has the right to social security and is entitled to realization, through national effort and international co-operation and in accordance with the organization and resources of each State, of the economic, social and cultural rights indispensable for his dignity and the free development of his personality. Eleanor Roosevelt was the driving force behind the 1948 charter of liberties. The 17 Sustainable Development Goals, which entered into force in 2016, practically extend the UDHR. The SDGs are universally recognized goals to reduce poverty, inequalities, and climate change by 2030. Lives safe from UXO is the special 18th goal for Laos.
Each ARTICLE22 piece is a modern heirloom – an actual piece of history redesigned with intention – that inspires action toward our future, individually and collectively.

Discover which languages are engraved : Mandarin  和平, Spanish  PAZ, English  Peace, Tibetan, Arabic, Hebrew, Russian  мир, Japanese  平和, German  FRIEDEN, Malya/Indonesian  KEDAMAIAN, Vietnamese  HÒA BÌNH, Korean  평화, French  PAIX, Greek, Turkish  BARI, Italian  PACE, Thai, Polish  POKÓJ, Swedish/Norwigan  VREDE, Lao, Gaelic/Irish  Síocháin, Hmong  KEV TIAJ TUS







Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts directly contributing to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023940, 'https://article22.com/collections/on-sale/products/set-fruit-of-life-necklace-14k', 'SET - FRUIT OF LIFE NECKLACE 14K + I AM LOVE I AM LIGHT I AM PEACE BANGLE (SAVE $65)', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/Fruit_Gold_pose_1_Sized_for_web_1024x1024_c301310b-af63-41df-979a-d11607198813_1024x1024@2x.png?v=1636652323', 560.00, 0, now(), now(), 'Accessories', 'SALE', 'THE PEACE BEGINS IN ME COLLECTION by ANGELA LINDVALL
Comprising  of sacred geometry mathematical patterns that recur in nature, art, design, and religions across cultures. These shapes underpin our very existence and unite us all. Each talisman is cast in precious sterling silver or 14K gold and finished with an engraved charm in our signature peacebomb metal.

The Fruit of Life is a hidden pattern within the Flower of Life that represents a dimensional portal to higher consciousness. The pattern is composed of 13 circles, a number that is  considered the key for unity and transition between worlds and dimensions. In music, the Chromatic scale of the 12 notes is followed by a 13th note that repeats the first note but on a higher frequency. Attaining a higher octave is attaining a higher dimension and potentially state of being.
Angela’s mantra, I am love, I am light, I am peace reminds us that peace first begins within each of us.
 ', '');
insert into `shesg_product` values (255349023941, 'https://article22.com/collections/on-sale/products/set-gold-tone-snake-earrings-in-your-body-14k-bangle-save-70', 'SET - SNAKE EARRINGS + IN YOUR BODY DIAMOND BANGLE (SAVE $30)', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/SET-BeatrixBundle-GoldAnodizeSnakeEarringandIYBBanglenobezel_1024x1024@2x.png?v=1644242929', 315.00, 0, now(), now(), 'Accessories', 'SALE', '"The snake, the symbol of good as well as evil, of medicine as well as poison, reminds us to be aware of our powers - choose them well." - Beatrix Ost
Snakes are the ultimate symbols of transformation, shedding their skin annually, replacing the old beautiful layer with a fresh, beautiful one. Designed by all around Renaissance woman, Beatrix Ost. The snakes are a statement pieces that  pair well with the  Ear Cuff for a contemporary and stylish look.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts contributing directly to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023942, 'https://article22.com/collections/on-sale/products/set-virtuous-circle-lariat-choker-ear-cuff-save-35', 'SET - VIRTUOUS CIRCLE LARIAT CHOKER + EAR CUFF (SAVE $35)

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/SET-VC_1024x1024@2x.png?v=1636663953', 200.00, 0, now(), now(), 'Accessories', 'SALE', 'FOR THE AGENTS OF CHANGE
A virtuous circle is infinite positivity.
It is the ideal embodiment of the notion, what goes around comes around.

This is a fresh take on our best selling Virtuous Full Circle Necklace finished with a traditional style Spike talisman charm. Stone polished PEACEBOMB Al circle and talisman accent this luxury choker. Double length sterling silver diamond-cut wrap around a 35" chain. Twirl twice around the neck and then thread the spike through the hole to drop secure. Adjustable to fit all.

This universal symbol is also ARTICLE22’s model : the more Peacebomb Jewelry that is worn and shared, the more awareness and funds are raised for MAG (Mines Advisory Group) to clear the 80 million unexploded bombs contaminating land in Laos, the more shrapnel for Laotian artisans to transform into designs that develop their craft and enterprise.
Each part of this sustainable supply chain is powered by agents of change, from artisans to deminers to fashion buyers. It is a movement of reconciliation, transformation, and hope that is expressed through ARTICLE22 jewelry, worn and shared across the globe.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts, contributing directly to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023943, 'https://article22.com/collections/on-sale/products/halo-circle-cufflinks-x10-bundle-878-reg-1-500', 'BUNDLE - HALO CIRCLE CUFFLINKS (SAVE 45%)

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/Halo_Cufflinks_Bundle_1024x1024@2x.jpg?v=1574460213', 825.00, 0, now(), now(), 'Accessories', 'SALE', 'Between 1964 and 1973 during the Vietnam War more than 2 million tons of bombs were dropped on the land of Laos, the most bombed country in the history of mankind. In the 1970s, artisans in Laos recycle these bombs into spoons by recovering the metal from the shells.
Elizabeth and Camille, founders of the ARTICLE22 brand, are inspired by this unique skill and decided to turn these remains of bombs into jewelry in order to raise funds with the NGO MAG (Mines Advisory Group) which launches de-mining operations. The craftsmen, from one of the provinces most affected by the bombings in Laos, are working closely with Article22 to create these unique jewels.
Recycled Aluminum Bomb Charms created in Xiangkhouang. Sterling Silver created in Vientiane
The jewels become objects of happiness, courage, peace, reparation and reconciliation and support the work of an organization and craftsmen who too often see their impact as limited.
The packaging also to its history. Made from cotton and hand screen printed, these are made directly in Laos by a women\'s collective to help a greater number of artisans, in total, ARTICLE22 employs more than 40 in Laos .
This positive approach based on sustainable development & respect for culture is key to this newly updated cufflink collection.

Since the creation of the brand, the equivalent of 40 football fields have already been cleared.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.', '');
insert into `shesg_product` values (255349023944, 'https://article22.com/collections/on-sale/products/ripple-hoops-shine-your-light-laura-sophie-cox-collab-cyber-week-offer', 'RIPPLE HOOPS - "SHINE YOUR LIGHT" LAURA SOPHIE COX COLLAB - SUBSCRIBERS ONLY OFFER', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/ARTICLE22_NOV_20216352_62225a6b-451e-4001-bd4c-9add23d2430c_1024x1024@2x.png?v=1670175919', 165.00, 0, now(), now(), 'Accessories', 'SALE', 'Shine Your Light Collection - a collaboration with celebrity stylist, Laura Sophie Cox
A new day in fashion is dawning thanks in part to the creative energy of Laura Sophie Cox, celebrity and fashion stylist. Based between LA and London, her vision transfers to her clients, which have included Emma Watson and Olivia Rodrigo, who shine their light on the beauty and necessity of sustainable slow fashion. Laura’s Shine Your Light Collection illuminates her collaborative approach to transformation within the fashion industry toward eternal equilibrium.
As her clients grace the stage and screen, what they wear is seen by millions. As energy transfers from one to another to another, good radiates good, transforming the negative, gaining ground toward new norms. Collaboration is essential to change. Like the transformational metal forming our jewelry, Laura is a conductor — a transference of a vision of a sustainable world and a humble creator of it. Together, we shine our light toward this emerging new day.
Weapons transformed into symbols of love, upcycled Vietnam War shrapnel and other scrap form the base of our ethically produced Shine Your Light Collection. Each ARTICLE22 piece is a modern heirloom – an actual piece of history redesigned with intention – that inspires action toward our future, individually and collectively.
 Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-miniing efforts. Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
 ', '');
insert into `shesg_product` values (255349023945, 'https://article22.com/collections/bracelets/products/love-all-around-bangle', 'NEW LOVE ALL AROUND BANGLE

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/lovebangle02_1024x1024@2x.png?v=1638868687', 75.00, 0, now(), now(), 'Accessories', 'bracelets', 'LOVE ALL AROUND is our wish for the world in 22 languages.

Each ARTICLE22 piece is a modern heirloom – an actual piece of history redesigned with intention – that inspires action toward our future, individually and collectively.

Discover which languages are engraved : Mandarin, Spanish , English,  Tibetan, Arabic, Hebrew, Russian, Japanese, German, Malya/Indonesian , Vietnamese, Korean, French, Greek, Turkish, Italian, Thai, Polish, Swedish/Norwigan, Lao, Gaelic/Irish, Hmong

 Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
$75 silver tone - clears 4m2 of Laotian landscape
$85 gold tone - clears 4m2 of Laotian landscape
 ', '');
insert into `shesg_product` values (255349023946, 'https://article22.com/collections/bracelets/products/arrow-tag-wrap-1', 'ARROW TAG WRAP', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/ARROW_TAG_WRAP_FRONT_-_BLACK_c6a07e19-9f56-4af4-a381-e290b1d11f54_1024x1024@2x.jpg?v=1627026249', 55.00, 0, now(), now(), 'Accessories', 'bracelets', 'FOR THE OPTIMIST
The arrow is the past, present, and future in one -pointing forward without forgetting the past. The arrow bangle and tag wraps have been with us almost as long as we started working with our artisan partners in Laos.
All Wrap Bracelets are presented on the  Leather Cord Color with OXIDIZED Sterling Silver Clasp attached.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.

$55 clears 3m2 of Laotian landscape', '');
insert into `shesg_product` values (255349023947, 'https://article22.com/collections/bracelets/products/skinny-gold-anodized-bangle-limited-edition', 'NEW VIRTUOUS CIRCLE GOLD TONE SKINNY BANGLE', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/virtuouscircle_skinnybangle_goldanodarkgold_caramel_2021-11-2218-45-13_1024x1024@2x.jpg?v=1668532288', 80.00, 0, now(), now(), 'Accessories', 'bracelets', 'Meet our new Virtuous Circle Gold Tone Bangle. Our skinny bangle is now high polished and tinted with a gold hue in Pennsylvania. As with our silver original bangles, the metal will become more luminous the more you wear it thanks to the natural oils of your skin.
OUR VIRTUOUS CIRCLE - The more jewelry worn and shared, the more  funds raised for MAG to clear the80 million unexploded bombs in Laos, the more creative work for Lao artisans to make more jewelry that clears more of their land.


How do we get the Gold Tone? Gold anodization of aluminum bangle - Anodising is an electrochemical process which converts the metal surface into a decorative, durable, corrosion-resistant, wear-resistant oxide layer. It cannot chip or peel. We do not use pigments, but metals to obtain the gold colour. Gold anodizing is therefore extremely UV resistant and will remain sparkling for a long time. COLOR/PATINA MAY VARY DUE TO THE HAND MADE NATURE OF THE PIECE

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.

$80 Virtuous Circle Gold Tone Skinny Bangle clears 10m2 of Laotian landscape
$180 SET OF 3 clears 20m2 of Laotian landscape', '');
insert into `shesg_product` values (255349023948, 'https://article22.com/collections/bracelets/products/story-coin-wrap', 'STORY COIN WRAP - NEW COLORS', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/STORY-COIN-WRAP-CordinaRed_1024x1024_2x_2a41d1e7-161d-46b5-965a-f63dcf2b72f9_1024x1024@2x.png?v=1605647981', 70.00, 0, now(), now(), 'Accessories', 'bracelets', 'A conversation starter, this piece tells our story of transformation from bombs into modern artifacts, dropped + made in Laos.

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
$70 clears 4m2 of Laotian landscape (Clasp NOT PICTURED - will be a Tri-Hole IN/OUT style clasp)', '');
insert into `shesg_product` values (255349023949, 'https://article22.com/collections/bracelets/products/peace-is-all-around-bangle', 'PEACE ALL AROUND BANGLE

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/Peacelanguage_bangle_1024x1024@2x.jpg?v=1587516168', 75.00, 0, now(), now(), 'Accessories', 'bracelets', 'FOR THE HISTORY BUFF

Peace all around is our wish for the world in 22 languages.
A message inspired by our namesake, ARTICLE22, which we named after the Universal Declaration of Human Rights: Everyone, as a member of society, has the right to social security and is entitled to realization, through national effort and international co-operation and in accordance with the organization and resources of each State, of the economic, social and cultural rights indispensable for his dignity and the free development of his personality.
Eleanor Roosevelt was the driving force behind the 1948 charter of liberties. The 17 Sustainable Development Goals, which entered into force in 2016, practically extend the UDHR. The SDGs are universally recognized goals to reduce poverty, inequalities, and climate change by 2030. Lives safe from UXO is the special 18th goal for Laos.
Each ARTICLE22 piece is a modern heirloom – an actual piece of history redesigned with intention – that inspires action toward our future, individually and collectively.

Discover which languages are engraved : Mandarin  和平, Spanish  PAZ, English  Peace, Tibetan, Arabic, Hebrew, Russian  мир, Japanese  平和, German  FRIEDEN, Malya/Indonesian  KEDAMAIAN, Vietnamese  HÒA BÌNH, Korean  평화, French  PAIX, Greek, Turkish  BARI, Italian  PACE, Thai, Polish  POKÓJ, Dutch  FRED, Lao, Gaelic/Irish  Síocháin, Hmong  KEV TIAJ TUS

Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
$75 silver tone - clears 4m2 of Laotian landscape
$85 gold tone - clears 4m2 of Laotian landscape', '');
insert into `shesg_product` values (255349023950, 'https://article22.com/collections/bracelets/products/22-white-diamond-bangle', 'LOVE IS THE BOMB 22 WHITE DIAMOND BANGLE

 ', 'https://cdn.shopifycdn.net/s/files/1/1228/2066/products/22_diamond_978300dc-966e-411c-8409-359b1ebabef8_1024x1024@2x.png?v=1579544958', 1290.00, 0, now(), now(), 'Accessories', 'bracelets', 'Inspired by so many requests, we married our special metal with the most traditional symbol of love - the diamond.

In fact, 22 diamonds finish the bracelet in celebration of the 22nd article of the Universal Declaration of Human Rights after which we are named which is about love of humanity.
Each diamond is Kimberley Process Certified.
Each piece gives back to support traditional Laotian artisan livelihoods, village development, community endeavors and further de-mining efforts.
Your purchase contributes to MAG (Mines Advisory Group) to safely & expertly clear some of the 80 million unexploded bombs contaminating land in Laos.
 ', '');
insert into `shesg_product` values (255349023951, 'https://www.futurajewelry.com/collections/earrings-1/products/sustainable-gold-stud-earrings', 'Studs


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Studs-P2_540x.jpg?v=1622231343', 2500.00, 0, now(), now(), 'Accessories', 'sustainable', 'The perfect pair of 9mm gold earring studs with lustrous detail.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023952, 'https://www.futurajewelry.com/collections/earrings-1/products/sustainable-jewelry-uptown-earrings', 'Uptown Earrings


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Uptown-Earrings-P1_a7bf0473-b528-49de-a6eb-36a8360aefea_540x.jpg?v=1622231719', 3500.00, 0, now(), now(), 'Accessories', 'sustainable', 'Effortless huggie gold hoops, wear on the lobe or style it up top for an edgy feel.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023953, 'https://www.futurajewelry.com/collections/earrings-1/products/sustainable-gold-reflective-hoops', 'Reflective Hoops


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Reflective_Hoops_P1_540x.jpg?v=1622230916', 4100.00, 0, now(), now(), 'Accessories', 'sustainable', 'Voluminous Reflective gold hoops with a stunning grille detail. You’ll never want to take these off.

Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.

Please allow 3-4 weeks from your order date to be manufactured and ready to ship.Worldwide shipping. Free shipping within USA.

Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023954, 'https://www.futurajewelry.com/collections/earrings-1/products/40mm-hoops', '40mm Hoops', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/40mm_Hoop_YG_P2_540x.jpg?v=1620700166', 4500.00, 0, now(), now(), 'Accessories', 'sustainable', 'Pair your favorite outfits with our timeless 40mm Classic Hoops. Handcrafted from 18kt Fairmined Ecological solid gold, this truly timeless design harkens back to 2500BC in the Ancient city of Sumer.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA. We take extra special care of your purchase. FUTURA insures all packages to give you peace of mind while order is en-route.

Embrace newness. Purity is the new luxury.
Each piece of FUTURA Jewelry sold bring us closer to a mercury-free world, and a cleaner, safer planet. Through your gold jewelry choices you can make a positive difference.', '');
insert into `shesg_product` values (255349023955, 'https://www.futurajewelry.com/collections/earrings-1/products/ethical-gold-lampshade-earrings', 'Lampshade Earrings


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Lampshade_fbcbe6d4-4377-4ad6-9bea-45df3a6a7919_540x.jpg?v=1621621475', 5700.00, 0, now(), now(), 'Accessories', 'sustainable', 'Artist Man Ray originally designed this lampshade motif back in the 1930s, but it wasn\'t until the 1970s that he re-designed them as earrings, a truly stunning work of art.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.
© Man Ray 2022 Trust/Artists Rights Society (ARS), NY / ADAGP
Lampshade Earrings on view in the permanent collection of the Museum of Fine Arts Boston.', '');
insert into `shesg_product` values (255349023956, 'https://www.futurajewelry.com/collections/earrings-1/products/ancient-power-hoops', 'Ancient Power Hoops


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Ancient_Power_Hoops_d51f03d0-3431-4eb3-8ff1-9c71535fe7ef_540x.jpg?v=1620700339', 4900.00, 0, now(), now(), 'Accessories', 'sustainable', 'Quietly powerful, these elegant gold hoops were designed in the 1st century AD and crafted by an Ancient Greek artisan. So highly regarded were the Greek artisans that they fashioned many similar looking earrings also found in the Roman culture.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Width 4.25 mm.
Each piece is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.
Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023957, 'https://www.futurajewelry.com/collections/earrings-1/products/ethical-gold-deity-earrings', 'Deity Earrings', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Deity_Earrings_540x.jpg?v=1630606245', 5700.00, 0, now(), now(), 'Accessories', 'sustainable', 'As part of their religious and social beliefs, Nabatean people pierced their ears to wear jewelry. Jewelry was not only worn for beauty but also to protect them in their daily lives from negative energy.
These 2nd century AD Nabatean gold earrings were created by an artist to emulate the jewelry worn by deities and in so doing created this immortal look and style.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023958, 'https://www.futurajewelry.com/collections/rings/products/sri-hexagonal-siget-ring', 'Sri Hexagonal Signet Ring', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/sri_ring_YG_200_540x.jpg?v=1677083034', 2900.00, 0, now(), now(), 'Accessories', 'rings', 'A hexagonal shaped signet ring hailing in design from the 8-11th centuries in Java, Indonesia. Rings of this style were often engraved with symbols such as the lotus, earthen pots, and conch shells in honor of Sri, the goddess of good fortune and prosperity.  With its timeless design, this unique signet ring feels like it could have been designed today. We pay homage to the creative minds of Java by handcrafting this ring in NYC with our 18kt Fairmined Ecological gold.
Today, you can engrave it with your initials, a birthday, or those of a loved one.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 4 to 12, download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023959, 'https://www.futurajewelry.com/collections/rings/products/sole-double-twisted-stacking-ring', 'Sole Double Twisted Stacking Ring


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/sole_p1_YG_540x.jpg?v=1635270627', 895.00, 0, now(), now(), 'Accessories', 'rings', 'Sole, of the sun. Life-giving energy that manifests clarity, confidence, and positivity. Harness the power of the sun with the Sole gold stacking ring.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Width 2 mm.
Each ring is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 3 to 13; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023960, 'https://www.futurajewelry.com/collections/rings/products/luna-round-stacking-ring', 'Luna Round Stacking Ring', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Luna_P1_YG_540x.jpg?v=1635270059', 895.00, 0, now(), now(), 'Accessories', 'rings', 'Luna, of the heavens. Embodying the sky and universe above which symbolizes eternity, enlightenment, and the rhythm of time.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Width 2 mm.
Each gold stacking ring is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 3 to 13; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023961, 'https://www.futurajewelry.com/collections/rings/products/mare-twisted-stacking-ring-1', 'Mare Twisted Stacking Ring


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Mare_P1_YG_540x.jpg?v=1635268466', 995.00, 0, now(), now(), 'Accessories', 'rings', 'Mare, of the sea. Encapsulating the element of water which symbolizes intuition and emotion. A twisted gold stacking band that captures the movement of the ocean.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Width 2 mm.
Each ring is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 3 to 13; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023962, 'https://www.futurajewelry.com/collections/rings/products/terra-laurel-stacking-ring', 'Terra Laurel Stacking Ring', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Terra_P1_YG_540x.jpg?v=1635270721', 895.00, 0, now(), now(), 'Accessories', 'rings', 'Terra, of the earth. A reflection of our connection to Mother Nature, symbolizing stability, potential, and being grounded.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Width 2.5 mm.
Each gold stacking ring is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 3 to 13; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023963, 'https://www.futurajewelry.com/collections/rings/products/vaulted-ring', 'Vaulted Ring', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/VAULTED-RING-YG_540x.png?v=1620701141', 2900.00, 0, now(), now(), 'Accessories', 'rings', 'Vaulted Gold Ring with smooth dome form. Great for stacking or worn on its own.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Each gold ring is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 3 to 9; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023964, 'https://www.futurajewelry.com/collections/rings/products/le-trou-ring', 'Le Trou Ring


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Le_Trou_P1_360x.jpg?v=1648500279', 5700.00, 0, now(), now(), 'Accessories', 'rings', 'Le Trou translates to The Hole from French, and is an iconic ring originally designed by Artist Man Ray. The wearer of this ring would look through the hole which is meant to alter the viewer\'s perception of reality, making this a true Surrealist work of art.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 4 to 9; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023965, 'https://www.futurajewelry.com/collections/rings/products/amore-ridge-gold-wedding-ring', 'Amore Ridge Wedding Ring', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Amore_YG_540x.png?v=1632175488', 1700.00, 0, now(), now(), 'Accessories', 'rings', 'For other sizes place your order below as normal.
Subtle ridge detail for those who love simplicity with an edge.
This wedding band is handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Width 4.25 mm.
Each of our wedding rings is custom made to order, so please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.

Available in sizes 3 to 13; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us.', '');
insert into `shesg_product` values (255349023966, 'https://www.futurajewelry.com/collections/rings/products/800-bc-ring', '800 BC Ring


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/800BC-RING-YG2_540x.png?v=1620700250', 3900.00, 0, now(), now(), 'Accessories', 'rings', 'Originally hailing from its namesake, the 800BC ring is a true unique work of unparalleled artistry and design. Ancient Greeks would wear gold spirals in their hair, the original mode de port of this style ring. Today we have modernized it by crafting it as a unique sustainable gold ring that you can wear and treasure forever.
Handcrafted with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.
Worldwide shipping. Free shipping within USA. We take extra special care of your purchase. FUTURA insures all packages to give you peace of mind while order is en-route.

Embrace newness. Purity is the new luxury.

Available in sizes 3 to 13; download ring sizing guide and conversion chart Here. If you do not see your size in the drop-down menu, please Contact Us', '');
insert into `shesg_product` values (255349023967, 'https://www.futurajewelry.com/collections/necklaces/products/celeste-link-necklace', 'Celeste Link Necklace


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/Celeste_Necklace_P2_1400_540x.jpg?v=1677083120', 11500.00, 0, now(), now(), 'Accessories', 'Necklace', 'This remarkable oval link necklace was a popular style back in the Victorian era, yet translates perfectly for today’s modern jewelry wearer. Handcrafted link-by-link in our NYC workshop with 18kt Fairmined Ecological gold. A timeless piece for anyone in need of an unforgettable necklace. Originally designed in 1860.

This necklace is 17” in length.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023968, 'https://www.futurajewelry.com/collections/necklaces/products/aquarius-zodiac-pendant', 'Aquarius Zodiac Pendant Necklace


 ', 'https://cdn.shopify.com/s/files/1/0508/6448/8643/products/064111-Aquarius-Neckalce-Small-sq_540x.jpg?v=1669048547', 1750.00, 0, now(), now(), 'Accessories', 'Necklace', 'The eleventh sign of the zodiac, Aquarians are eccentric, independent visionaries triumphing in their pursuit for equality and advocating for universal freedom. Informally known as the geniuses of the zodiac, these social butterflies march to the beat of their own drum, blessing everyone in their wake with the influence of a hopeful future as they advocate and help create a better tomorrow.
With the historical reference of a full set of zodiac coins minted by an Ancient Mughal Emperor in 1619, the authenticity and design details of the pendants make them a special addition to your jewelry box. Large pendant is 24mm in diameter, small pendant is 18mm in diameter.
Handcrafted in NYC with 18kt certified Fairmined Ecological gold that is toxic chemical free, sustainable, ethical and clean. Chain is 16", 18kt Fairmined gold.
Please allow 3-4 weeks from your order date to be manufactured and ready to ship.

Worldwide shipping. Free shipping within USA.
Embrace newness. Purity is the new luxury.', '');
insert into `shesg_product` values (255349023969, 'https://www.lanius.com/de/123-13435-330-rooibos-34-tanktop-mit-v-ausschnitt', 'TANKTOP MIT V-AUSSCHNITT
', 'https://www.lanius.com/media/image/6d/dc/38/LANIUS_SS23_13435-00_Tanktop-mit-V-Ausschnitt_rooibos_01_700x1050.webp', 75.28, 0, now(), now(), 'Outerwear', 't-shirts', 'Ein nachhaltiges Basic aus natürlichem Bio-Leinen: Das sommerliche Tanktop mit breiten Trägern, V-Ausschnitt vorne und hinten fällt fließend und schmeichelt der Figur. Leinen ist hautfreundlich, temperaturausgleichend und hat eine natürliche Struktur. Solo oder als Unterzieher, ist das ärmellose Top ein Must-have für Ihre nachhaltige Garderobe.
leicht tailliert, ärmellos, V-Ausschnitt
100% Leinen, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023970, 'https://www.lanius.com/de/123-13573-199-black-34-strick-top', 'aus Bio-Baumwolle
', 'https://www.lanius.com/media/image/bb/de/76/LANIUS_SS23_13573-00_Strick-Top_black_01_700x1050.webp', 96.82, 0, now(), now(), 'Outerwear', 't-shirts', 'NEW IN: Cropped Top in Feinstrick aus feiner und weicher Pima-Baumwolle in Bio-Qualität. Das verkürzte Top mit leichtem Rundhalsausschnitt besticht durch seine Schlichtheit und lässt sich dadurch besonders vielseitig kombinieren. Egal ob zu High-Waist Jeans, weiter Marlenehose oder Sommerrock,- solo, unter einem edlen Blazer oder Oversize Strickjacke - das ärmellose Top ist ein Style-Talent.
verkürzt, Rundhalsausschnitt, Feinstrick
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023971, 'https://www.lanius.com/de/123-13432-330-rooibos-34-top-mit-spitze', 'aus Bio-Baumwolle
', 'https://www.lanius.com/media/image/33/7c/78/LANIUS_SS23_13432-00_Top-mit-Spitze_rooibos_01_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Verführerischer Hingucker: Lingerie-Top in edlem Mix aus Bio-Baumwolle und feiner, femininer Spitze,- vegan und fair produziert. Das Top funktioniert als wunderschöner Kontrast als Unterzieher zu ausgeschnittenen Strickpullovern, unter lockeren Blazern, oder solo als edles Anlassoberteil. In 3 verschiedenen sommerlichen Farben ein absolutes Must-have für Ihre Sommer-Capsule!
leicht ausgestellt, dünne Träger, feine Spitze
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023972, 'https://www.lanius.com/de/123-13462-655-bright-jade-34-kurzarmshirt', 'Farbe — bright jade', 'https://www.lanius.com/media/image/ed/ec/75/LANIUS_SS23_13462-00_Kurzarmshirt_bright-jade_01_700x1050.webp', 42.97, 0, now(), now(), 'Outerwear', 't-shirts', 'Basic Must-have aus feinstem Baumwoll-Jersey in sommerlichen Farben für vielfältige Kombinationsmöglichkeiten. Der leicht taillierte Schnitt, die kurzen Arme und der etwas tiefere Rundhalsausschnitt machen das vegane, GOTS-zertifizierte T-Shirt, made in Europe, zum unverzichtbaren Bestandteil Ihrer nachhaltigen Frühlings/Sommer-Capsule. Der feine Baumwollstoff aus kontrolliert biologischem Anbau ist besonders hautfreundlich, formbeständig, leicht dehnbar und knittert kaum.
körpernah, Rundhalsausschnitt, kurzer Arm
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023973, 'https://www.lanius.com/de/123-13513-947-dove-blue-sandstorm-34-streifenshirt', 'Farbe — dove blue/sandstorm', 'https://www.lanius.com/media/image/ff/fe/6b/LANIUS_SS23_13513-00_Streifenshirt_dove-blue-sandstorm_02aNMP0MvwaxUv2_700x1050.webp', 107.59, 0, now(), now(), 'Outerwear', 't-shirts', 'Ein nachhaltiges Basic aus natürlichem Bio-Leinen: Das gestreifte Kurzarmshirt mit sommerlich verkürzten Ärmeln und locker überschnittener Schulter sorgt für einen legeren Look. Leinen ist hautfreundlich, temperaturausgleichend und hat eine natürliche Struktur. Solo oder als Unterzieher, ist das Shirt mit feinen Streifen ein Must-have für Ihre nachhaltige Garderobe.
locker, überschnittene Schulter, Rundhalsauschnitt
100% Leinen, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023974, 'https://www.lanius.com/de/122-13220-white-mango-34-statement-shirt-liberte', 'Farbe — white/mango


', 'https://www.lanius.com/media/image/a0/37/aa/LANIUS_SS22_13220-00_Statementshirt-Print-Liberte_white-mango_01_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Statement Shirt Liberté: Setzen Sie mit uns ein Zeichen - die Zukunft liegt in unserer Hand! Weiche Baumwolle aus kontrolliert biologischem Anbau mit Elasthan und die lockere Passform sorgen für ein luftig-leichtes, angenehmes Tragegefühl. Hoher Rundhalsausschnitt, kurzer Arm und der Statement-Print machen das Shirt zu Ihrem Lieblingsbegleiter mit Aussage und gutem Gewissen.
locker, blickdicht, überschnittene Schulter
92% Baumwolle, aus kontrolliert biologischem Anbau | 8% Elasthan', '');
insert into `shesg_product` values (255349023975, 'https://www.lanius.com/de/123-13228-212-citrus-34-shirt-mit-ueberschnittener-schulter', 'Farbe — citrus', 'https://www.lanius.com/media/image/85/d3/7e/LANIUS_SS23_13228-00_Shirt-mit-berschnittener-Schulter_citrus_01_700x1050.webp', 53.74, 0, now(), now(), 'Outerwear', 't-shirts', 'Als nachhaltige Ergänzung zum klassischen T-Shirt kommt das Kurzarmshirt mit sommerlich verkürzten Ärmeln und locker überschnittener Schulter für einen legeren Look. Der feine Baumwollstoff aus kontrolliert biologischem Anbau ist weich, hautfreundlich und temperaturausgleichend. Ein Must-have jeder nachhaltigen Capsule,- auch über Saisons hinweg!
locker, verkürzter Arm, Rundhalsauschnitt
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023976, 'https://www.lanius.com/de/123-13432-424-blush-rose-34-top-mit-spitze', 'Farbe — blush rose


', 'https://www.lanius.com/media/image/82/33/23/LANIUS_SS23_13432-00_Top-mit-Spitze_blush-rose_01_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Verführerischer Hingucker: Lingerie-Top in edlem Mix aus Bio-Baumwolle und feiner, femininer Spitze,- vegan und fair produziert. Das Top funktioniert als wunderschöner Kontrast als Unterzieher zu ausgeschnittenen Strickpullovern, unter lockeren Blazern, oder solo als edles Anlassoberteil. In 3 verschiedenen sommerlichen Farben ein absolutes Must-have für Ihre Sommer-Capsule!
leicht ausgestellt, dünne Träger, feine Spitze
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023977, 'https://www.lanius.com/de/123-13135-442-raspberry-34-halbarmshirt-v-ausschnitt', 'Farbe — raspberry


', 'https://www.lanius.com/media/image/60/05/2e/LANIUS_SS23_13135-00_Halbarmshirt_raspberry_01_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Halbarmshirt mit körpernaher Passform. Der tiefe, leicht abgerundete V-Ausschnitt und die halblangen Arme machen das vegane, GOTS-zertifizierte Shirt zum unverzichtbaren Bestandteil Ihrer Capsule Wardrobe. Ein langlebiges Basic - modern interpretiert und nachhaltig produziert aus weicher Baumwolle aus kontrolliert biologischem Anbau. Übrigens: Baumwollstoffe mit Elasthananteil sind formbeständig, leicht dehnbar, blickdicht und knittern kaum.
körpernah, tailliert, blickdicht
92% Baumwolle, aus kontrolliert biologischem Anbau | 8% Elasthan', '');
insert into `shesg_product` values (255349023978, 'https://www.lanius.com/de/123-13530-595-night-blue-34-shirt-mit-v-ausschnitt', 'Farbe — night blue


', 'https://www.lanius.com/media/image/a8/80/35/LANIUS_SS23_13530-00_Shirt-mit-V-Ausschnitt_night-blue_01_700x1050.webp', 107.59, 0, now(), now(), 'Outerwear', 't-shirts', 'Lässiges, veganes Shirt mit kleinem V-Ausschnitt vorne und angedeutetem V-Ausschnitt im Rücken. Die leicht ausgestellten, kurzen Ärmel und die mittige Naht im Vorderteil sind modische Details. Das Material aus Lyocell Tencel und Elasthan ist angenehm weich, knitterfrei und passformbeständig. Ein besonders legerer und stylischer Look entsteht in Kombination mit der dazu passenden Hose aus TENCEL™.
leicht ausgestellte Passform, kurzer Arm, V-Ausschnitt
96% Lyocell (TENCEL™) | 4% Elasthan', '');
insert into `shesg_product` values (255349023979, 'https://www.lanius.com/de/123-13432-562-blue-sea-34-top-mit-spitze', 'Farbe — blue sea


', 'https://www.lanius.com/media/image/6e/c1/ae/LANIUS_SS23_13432-00_Top-mit-Spitze_blue-sea_08_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Verführerischer Hingucker: Lingerie-Top in edlem Mix aus Bio-Baumwolle und feiner, femininer Spitze,- vegan und fair produziert. Das Top funktioniert als wunderschöner Kontrast als Unterzieher zu ausgeschnittenen Strickpullovern, unter lockeren Blazern, oder solo als edles Anlassoberteil. In 3 verschiedenen sommerlichen Farben ein absolutes Must-have für Ihre Sommer-Capsule!
leicht ausgestellt, dünne Träger, feine Spitze
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023980, 'https://www.lanius.com/de/123-13577-100-white-bright-blue-34-statementshirt-plage', 'Farbe — white/bright blue', 'https://www.lanius.com/media/image/92/ec/06/LANIUS_SS23_13577-00_Statementshirt-LA-PLAGE_white-bright-blue_01_700x1050.webp', 53.74, 0, now(), now(), 'Outerwear', 't-shirts', 'Statementshirt aus feiner Bio-Baumwolle: durch den minimaltischen Print auf der Vorderseite, wirkt das T-Shirt schlicht und lässig und bietet vielfältige Kombinationsmöglichkeiten. Der leicht taillierte Schnitt und der Rundhalsausschnitt machen das vegane, GOTS-zertifizierte T-Shirt zum unverzichtbaren Bestandteil Ihrer nachhaltigen Capsule. Der feine Baumwollstoff aus kontrolliert biologischem Anbau ist besonders hautfreundlich und langlebig.
körpernah, Rundhalsausschnitt, kurzer Arm
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023981, 'https://www.lanius.com/de/123-12419-562-blue-sea-34-u-boot-shirt-3/4-arm', 'Farbe — blue sea


', 'https://www.lanius.com/media/image/89/90/83/LANIUS_SS23_12419-00_U-Boot-Shirt-mit-3-4-Arm_blue-sea_01_700x1050.webp', 75.28, 0, now(), now(), 'Outerwear', 't-shirts', 'Beliebtes Basic in natürlicher Hanf-Jersey-Qualität: Feminines U-Boot-Shirt mit verkürztem Arm, hochgeschlossenem U-Boot-Ausschnitt und leicht taillierter Passform. Baumwolle aus kontrolliert biologischem Anbau und natürlicher Hanf wirken temperaturausgleichend und sorgen für den leichten Fall und die natürliche Struktur der Ware.
leicht tailliert, U-Boot-Ausschnitt, verkürzter Arm
55% Hanf | 45% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023982, 'https://www.lanius.com/de/123-13218-450-lilac-34-miditop', 'Farbe — lilac


', 'https://www.lanius.com/media/image/d0/40/05/LANIUS_SS23_13218-00_Miditopp_lilac_02_700x1050.webp', 96.82, 0, now(), now(), 'Outerwear', 't-shirts', 'Sportliches Miditop aus ECONYL® - anschmiegsam, flexibel und langlebig macht das Material jede Bewegung mit. Das Top ist doppelt gearbeitet, der Schnitt ist körpernah, mit tiefem Armausschnitt und hohem Rundhalsausschnitt für Bewegungsfreiheit und Halt. Mit der passenden Leggings sind Sie funktionell und modisch gekleidet. Dank des minimalistischen Designs ist das Top auch im Alltag oder als Unterhemd einsetzbar.
körpernah, Teilungsnaht, blickdicht
78% Polyamid (recycelt) | 22% Elasthan', '');
insert into `shesg_product` values (255349023983, 'https://www.lanius.com/de/123-13541-771-night-blue-papaya-34-streifen-raglanshirt', 'Farbe — night blue/papaya


', 'https://www.lanius.com/media/image/1d/d3/d4/LANIUS_SS23_13541-00_Streifen-Raglanshirt_night-blue-papaya_01_700x1050.webp', 86.05, 0, now(), now(), 'Outerwear', 't-shirts', 'Spring-Stripes: Das gestreifte Raglanshirt mit Halbarm aus Bio-Baumwolle und Hanf bietet ein besonders angenehmes Tragegefühl! Die Haptik und Optik der sommerlichen Materialmischung machen das vegane Shirt schnell zu einem Lieblingsteil. Der tiefe Rundhalsausschnitt bietet die Möglichkeit ein Top oder Spitzentop zu kombinieren. Sportlich kombiniert zu Jeans oder chic zu Midirock und Pantolette.
tailliert, halbarm, tief ausgeschnitten
70% Baumwolle, aus kontrolliert biologischem Anbau | 30% Hanf', '');
insert into `shesg_product` values (255349023984, 'https://www.lanius.com/de/123-13516-305-sandstorm-34-shirt', 'Farbe — sandstorm


', 'https://www.lanius.com/media/image/3b/9b/66/LANIUS_SS23_13516-00_Shirt_sandstorm_04_700x1050.webp', 129.13, 0, now(), now(), 'Outerwear', 't-shirts', 'Chices Basic: das Shirt mit Rundhalsausschnitt aus TENCEL™ und recyceltem Polyester - eine angenehm leichte Materialmischung für den Sommer! Der gerade Schnitt und die halblangen Ärmel verleihen dem veganen Shirt eine entspannte Lässigkeit. Vielseitig zu kombinieren,- egal ob sportich-leger zu Jeans und Sneaker, oder edel-elegant zu passender Hose und Blazer. Das fließend fallende Shirt ist ein Must-have Basic Ihrer nachhaltigen Garderobe.
leicht kastige Passform, halblanger Arm, Rundhalsausschnitt
93% Lyocell (TENCEL™) | 7% Polyamid (recycelt)', '');
insert into `shesg_product` values (255349023985, 'https://www.lanius.com/de/123-13535-102-sand-34-shirt', 'Farbe — sand', 'https://www.lanius.com/media/image/13/75/bb/LANIUS_SS23_13535-00_Shirt_sand_01_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Locker & Casual! Das leicht fließende Shirt aus Bio-Baumwolle bietet einen angenehmen Tragekomfort. Durch seine lockere Passform, den weiten Rundhalsausschnitt, die kurzen, weiten Ärmeln und den Schlitzen an den Seiten wirkt das Shirt besonders lässig. Vegan produziert und GOTS-zertifiziert ist das Kurzarmshirt in neutralen Tönen ein echtes Lieblingsshirt. Eine Leichtigkeit, die begeistert!', '');
insert into `shesg_product` values (255349023986, 'https://www.lanius.com/de/123-13573-595-night-blue-34-strick-top', 'Farbe — night blue


', 'https://www.lanius.com/media/image/71/7a/26/LANIUS_SS23_13573-00_Strick-Top_night-blue_01_700x1050.webp', 96.82, 0, now(), now(), 'Outerwear', 't-shirts', 'NEW IN: Cropped Top in Feinstrick aus feiner und weicher Pima-Baumwolle in Bio-Qualität. Das verkürzte Top mit leichtem Rundhalsausschnitt besticht durch seine Schlichtheit und lässt sich dadurch besonders vielseitig kombinieren. Egal ob zu High-Waist Jeans, weiter Marlenehose oder Sommerrock,- solo, unter einem edlen Blazer oder Oversize Strickjacke - das ärmellose Top ist ein Style-Talent.
verkürzt, Rundhalsausschnitt, Feinstrick
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023987, 'https://www.lanius.com/de/123-13434-118-oat-milk-34-traegertop', 'Farbe — oat milk', 'https://www.lanius.com/media/image/d8/04/a1/LANIUS_SS23_13434-00_Tr-gertop_oat-milk_01_700x1050.webp', 42.97, 0, now(), now(), 'Outerwear', 't-shirts', 'Ein wahres Kombinationstalent: Das Trägertop aus seidigem, leicht transparentem TENCEL™. Das Material ist angenehm weich und besonders hautfreundlich. Das fließende Top, in neutralen Farben, kann Solo, aber auch unter Pullovern, Blusen, Blazern und Cardigans getragen werden. Unser veganes Trägertop ist ein echtes Must-have für Ihre Sommer-Capsule!
tailliert, dünne Träger, leicht transparent
100% Lyocell (TENCEL™)', '');
insert into `shesg_product` values (255349023988, 'https://www.lanius.com/de/123-12256-102-sand-34-top-mit-spitze', 'Farbe — sand


', 'https://www.lanius.com/media/image/6c/d7/d2/LANIUS_SS23_12256-00_Top-mit-Spitze_sand_01_700x1050.webp', 64.51, 0, now(), now(), 'Outerwear', 't-shirts', 'Verführerischer Hingucker: Lingerie-Top in edlem Mix aus Bio-Baumwolle und feiner, femininer Spitze,- vegan und fair produziert. Das Top funktioniert als wunderschöner Kontrast als Unterzieher zu ausgeschnittenen Strickpullovern, unter lockeren Blazern, oder solo als edles Anlassoberteil. Ein absolutes Must-have für Ihre Sommer-Capsule!
leicht ausgestellt, dünne Träger, feine Spitze
100% Baumwolle, aus kontrolliert biologischem Anbau', '');
insert into `shesg_product` values (255349023989, 'https://www.lanius.com/de/123-13228-655-bright-jade-34-shirt-mit-ueberschnittener-schulter', 'Farbe — bright jade', 'https://www.lanius.com/media/image/f6/c1/32/LANIUS_SS23_13228-00_Shirt-mit-berschnittener-Schulter_bright-jade_03_700x1050.webp', 53.74, 0, now(), now(), 'Outerwear', 't-shirts', 'Als nachhaltige Ergänzung zum klassischen T-Shirt kommt das Kurzarmshirt mit sommerlich verkürzten Ärmeln und locker überschnittener Schulter für einen legeren Look. Der feine Baumwollstoff aus kontrolliert biologischem Anbau ist weich, hautfreundlich und temperaturausgleichend. Ein Must-have jeder nachhaltigen Capsule,- auch über Saisons hinweg!', '');
insert into `shesg_product` values (255349023990, '', 'Rye Hemp Frill Vest Top - White', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST7161-Rye-Hemp-Frill-Vest-Top-Campaign_1080x.jpg?v=1684421833', 30.29, 0, now(), now(), 'Womenswear', 't-shirts', '55% hemp 45% organic cotton jersey
A great fabric mix: hemp keeps you cool in summer, warm in winter and lasts a lifetime
Organic cotton jersey for a supersoft feel
Vest top
Relaxed fit
Pretty frill sleeves
A neutral-toned top you can pair easily with anything.
Code: WST7161', '');
insert into `shesg_product` values (255349023991, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/caileigh-lenzing%E2%84%A2-ecovero%E2%84%A2-jersey-top-multi', 'Caileigh Lenzing™ EcoVero™ Jersey Top - Multi', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST7504-Caileigh-Lenzing-Ecovero-Jersey-Top-WSB7502-Caileigh-Lenzing-Ecovero-Jersey-Short-Campaign_33baad62-46fd-4e33-8a42-7ecf31c5e7b8_1080x.jpg?v=1684421968', 31.45, 0, now(), now(), 'Womenswear', 't-shirts', '
- 67% Lenzing™ EcoVero™ 28% organic cotton* 5% elastane jersey
- a soft and silky sustainable alternative to viscose, Lenzing™ Ecovero™ is derived from renewable wood
- neck tie
- pretty frill sleeves
- relaxed fit
- exclusive Thought pattern created by our in-house designers
- floral print
- flattering “yoke” (panelled) top
- pair with jeans for a laid-back look.', '');
insert into `shesg_product` values (255349023992, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/giai-organic-cotton-jersey-tee-maple-pink', 'Giai Organic Cotton Jersey Tee - Maple Pink', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7500-Giai-Organic-Cotton-Jersey-Tee-Maple-Pink-1_1080x.jpg?v=1682002596', 34.62, 0, now(), now(), 'Womenswear', 't-shirts', '100% organic cotton jersey
Cotton uses 91% less water than regular cotton, so is very earth-kind
Pretty broderie details at sleeves to add interest
Relaxed fit
Supersoft feel on the skin
Round neck with a deep V at the front
Block colour makes it easy to accessorize and pair with your favourite jeans
Code: WST7500', '');
insert into `shesg_product` values (255349023993, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/the-spotty-organic-cotton-frill-sleeve-blouse-black', 'The Spotty Organic Cotton Frill Sleeve Blouse - Black', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST7633-The-Spotty-Organic-Cotton-Poplin-Frill-Sleeve-Blouse-Campaign_1080x.jpg?v=1684421537', 60.64, 0, now(), now(), 'Womenswear', 't-shirts', '100% organic cotton
Organic cotton uses 91% less water than regular cotton, so is very earth-kind
A dress-up blouse with luxe details
High frill and tie neck
Pretty frilled statement sleeves
Black and white spot print
Unique, limited-run Thought pattern, created by our designers in-house
Pair with our Denimkind jeans for an understated yet put-together look
Code: WST7633', '');
insert into `shesg_product` values (255349023994, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/giai-organic-cotton-jersey-tee-navy', 'Giai Organic Cotton Jersey Tee - Navy', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7500-Giai-Organic-Cotton-Jersey-Tee-Navy-1_1080x.jpg?v=1682002648', 34.62, 0, now(), now(), 'Womenswear', 't-shirts', '100% organic cotton jersey
Cotton uses 91% less water than regular cotton, so is very earth-kind
Pretty broderie details at sleeves to add interest
Relaxed fit
Supersoft feel on the skin
Round neck with a deep V at the front
Block colour makes it easy to accessorize and pair with your favourite jeans.
Code: WST7500', '');
insert into `shesg_product` values (255349023995, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/thackery-organic-cotton-crepe-blouse-navy', 'Thackery Organic Cotton Crepe Blouse - Navy', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7634-Thackery-Organic-Cotton-Crepe-Blouse-Navy-4_1080x.jpg?v=1682352680', 51.97, 0, now(), now(), 'Womenswear', 't-shirts', '100% organic cotton
Organic cotton is natural, breathable, and made using up to 91% less water than regular cotton
Round neck, collarless shirt
Full length sleeves
Flattering gathers at the front for a relaxed fit
Panelled top so it sits nice and flat pretty leaf pattern on a cream background
A nature-inspired and limited-run exclusive Thought print.
Code: WST7634', '');
insert into `shesg_product` values (255349023996, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/melinoe-lenzing%E2%84%A2-ecovero%E2%84%A2-striped-top-multi', 'Melinoe Lenzing™ Ecovero™ Striped Top - Multi', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7184_Melinoe-Top-Multi-4_1080x.jpg?v=1678204772', 61.88, 0, now(), now(), 'Womenswear', 't-shirts', '100% LENZING™ ECOVERO™
This fabric is produced using renewable wood. It generates up to 50% less emissions and uses 50% less water than generic Viscose.
Floaty and fresh, perfect for summer days and evenings. Fresh fruit cocktail, optional.
Slightly relaxed fit, true to size.
This beautiful abstract palm pattern is based on an archive design. Hand-painted in watercolour to give it a soft, flowing feel.
WST7184', '');
insert into `shesg_product` values (255349023997, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/adella-hemp-tropical-top-multi', 'Adella Hemp Tropical Top - Multi


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7525-Adella-Hemp-Top-in-Multi-1_1080x.jpg?v=1678205153', 60.64, 0, now(), now(), 'Womenswear', 't-shirts', '55% hemp, 45% organic cotton
Hemp is a carbon capture phenomenon: for every tonne produced, 1.63 tonnes of carbon is removed from the air. More good news - it gets better with every wash and lasts a lifetime.
A summer essential, great for dress-down days when the going is (deliberately) slow.
An easy-wear top in a boxy style with 3/4 length sleeves, gathered at the neck for fuller volume.
Summer layering will be easy with this timeless top. Wear over a swimming costume on pool days or with a pair of our jeans for a chilled out evening vibe.
WST7525', '');
insert into `shesg_product` values (255349023998, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/arabella-organic-cotton-scallop-sleeve-blouse-dusky-lilac', 'Arabella Organic Cotton Scallop Sleeve Blouse - Dusky Lilac


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST7630-Arabella-Organic-Cotton-Scallop-Sleeve-Blouse-Campaign-2_1080x.jpg?v=1684421988', 60.64, 0, now(), now(), 'Womenswear', 't-shirts', '100% organic cotton
Organic cotton is natural, breathable, and made using up to 91% less water - crafted with care for people and the planet.
A dusky lilac dream, this beautiful piece will see you through summer parties, weddings and more in thoughtful and standout style.
Featuring a dobby (spot) texture, statement broderie collar and deep V neck at the front, this sunny lilac blouse will be one you reach for again and again for its standout look and ease of wear.
This beautiful separate is a dream in sunny lilac. Pair with jeans or wide-leg culottes for cool, classic style and wait for the compliments to roll in.
WST7630', '');
insert into `shesg_product` values (255349023999, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/meadow-tencel%E2%84%A2-frill-sleeve-floral-shell-top-lavender-blue', 'Meadow Tencel™ Frill Sleeve Floral Shell Top - Lavender Blue


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7009_Meadow-Sleeve-Shell-Top-Denim-Blue-4_1080x.jpg?v=1678206031', 74.26, 0, now(), now(), 'Womenswear', 't-shirts', '50% TENCEL™ 23% ORGANIC COTTON* 27% VISCOSE
Mostly made from two plant derived sources. Tencel fibres are made from sustainably sourced natural wood. Almost 100% of the chemicals used in this process are recovered and reused in a closed loop process, and organic cotton is chemical free.
The perfect pretty summer blouse. The delicate grosgrain bow just grazes the neck, and we love the double frilled cap sleeve. Heavenly.
Relaxed fit, true to size.
An optimistic meadow floral that feels like springtime. Fresh colours and delicate brushstrokes. Wear with the matching trousers.
WST7009', '');
insert into `shesg_product` values (255349024000, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/laurel-hemp-cami-top-multi', 'Laurel Hemp Cami Top - Multi


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7526-Laurel-Hemp-Cami-Vest-Top-in-Multi-1_1080x.jpg?v=1678206489', 51.97, 0, now(), now(), 'Womenswear', 't-shirts', '55% hemp, 45% organic cotton
Hemp is a carbon capture phenomenon: for every tonne produced, 1.63 tonnes of carbon is removed from the air. More good news - it gets better with every wash and lasts a lifetime.
A summer essential in a soft palm pattern, great for dress-down days when the sun\'s shining.
A relaxed fit, soft and breathable and great for everyday wear in the warmer months.
A characterful print on a laid-back top you\'ll reach for time and again. Pair with denim or one of our tiered skirts and you\'re ready to go wherever the mood takes you.
WST7526', '');
insert into `shesg_product` values (255349024001, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/neoma-bamboo-jersey-blouse-dark-green', 'Neoma Bamboo Jersey Blouse - Dark Green


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7190-Neoma-Bamboo-Jersey-Blouse-in-Dark-Green-1_1080x.jpg?v=1676555989', 38.96, 0, now(), now(), 'Womenswear', 't-shirts', '67% VISCOSE DERIVED FROM BAMBOO 28% ORGANIC COTTON* 5% ELASTANE JERSEY
Organic cotton is natural, breathable, and made using up to 91% less water. Bamboo is one of the fastest growing and most renewable crops.
A pretty and feminine top to elevate your every day. The thoughtful details make this a special addition to your wardrobe.
Relaxed fit, true to size. Model is 5\'9.5 and wears a size 10.
Wear with jeans for pared back perfection or smart chinos for work.
WST7190', '');
insert into `shesg_product` values (255349024002, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/acate-lenzing%E2%84%A2-ecovero%E2%84%A2-printed-dobby-tunic-dress-multi', 'Acate Lenzing™ Ecovero™ Printed Dobby Tunic Dress - Multi


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7089-Acate-Lenzing-Ecovero-Dobby-Tunic-in-Multi-1_1080x.jpg?v=1676558483', 60.64, 0, now(), now(), 'Womenswear', 't-shirts', '100% LENZING™ ECOVERO™
This fabric is produced using renewable wood. It generates up to 50% less emissions and uses 50% less water than generic Viscose.
Summer holiday ready? Floaty, breathable and fresh. We love the ditsy pattern, peplum tier and our signature secret pockets!
Loose, easy fit. True to size. Model is 5\'10 and wears a size 10.
A straw bag and sandals are all you need.
WST7089', '');
insert into `shesg_product` values (255349024003, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/skye-lenzing%E2%84%A2-ecovero%E2%84%A2-geometric-print-cami-top-dusky-blue', 'Skye Lenzing™ Ecovero™ Geometric Print Cami Top - Dusky Blue


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7628-Skye-Lenzing-Ecovero-Cami-Top-in-White-5_1080x.jpg?v=1676556899', 43.29, 0, now(), now(), 'Womenswear', 't-shirts', '100% LENZING™ ECOVERO™
This fabric is produced using renewable wood. It generates up to 50% less emissions and uses 50% less water than generic Viscose.
Sleeveless, loose and airy. The perfect summer top for beachy days and hot city afternoons.
Relaxed fit, true to size. Model is 5\'10 and wears a size 10.
The abstract tile pattern is inpired by seaside towns and European escapes. Hand-painted in house, it is exclusive to Thought.
WST7628', '');
insert into `shesg_product` values (255349024004, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/the-perfect-hemp-short-sleeve-shell-top-dusky-blue', 'The Perfect Hemp Short Sleeve Shell Top - Dusky Blue


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST5513-The-Perfect-Hemp-Short-Sleeve-Shell-Top-Dusky-Blue-2_1080x.jpg?v=1682074963', 74.26, 0, now(), now(), 'Womenswear', 't-shirts', '100% HEMP
Hemp is a carbon capture phenomenon - for every tonne produced, 1.63 tonnes of carbon is removed from the air. Plus it gets better with age.
An effortless everyday top, that gets better and better with wear.
Loose, relaxed fit. Model is 5\'11 and is wearing a size 10.
the more you love and wash this piece the softer it will get.
Gentle machine wash at 30 degrees. Wash with similar colours. Wash inside out. Do not bleach. Do not tumble dry. Warm iron on reverse. Do not dry clean
WST5513', '');
insert into `shesg_product` values (255349024005, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/fairtrade-organic-cotton-notch-neck-t-shirt-orchid-pink', 'Fairtrade Organic Cotton Notch Neck T-Shirt - Orchid Pink


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7189-The-Fairtrade-and-GOTS-Organic-Cotton-Notch-Tee-in-Orchid-Pink-5_1080x.jpg?v=1677594166', 28.43, 0, now(), now(), 'Womenswear', 't-shirts', '100% ORGANIC COTTON SLUB JERSEY
Fairtrade organic cotton is made with up to 91% less water, free from chemicals, and crafted with care for people and planet.
A relaxed boxy jersey T-shirt. Subtle details include a notched neck and a rolled over sleeve.
Loose fitting, size down for a more snug look. Model is 5\'10.5 and wears size 10.
Wear with loungewear or jeans for an off-duty look.
Wash with similar colours. Gentle machine wash at 30 degrees. Do not bleach. Do not tumble dry. Warm iron on reverse. Do not dry clean.
WST7189', '');
insert into `shesg_product` values (255349024006, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/peyton-pom-pom-trim-top-navy', 'Peyton Pom Pom Trim Top - Navy


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST6266-Peyton-Hemp-Pom-Pom-Trim-Top-Navy-Campaign_1080x.jpg?v=1684421747', 49.49, 0, now(), now(), 'Womenswear', 't-shirts', '55% hemp 45% organic cotton jersey
Produced using a teeny amount of energy and water, fully biodegradable and anti-static. feels good, looks great, does better.
Playful meets practical in this breathable top. cool and comfy, perfect for summer.
A relaxed fit, size down if you prefer yours snug. Model is 5\'11 and wears a size 10.
Shake it! pair with jeans to inject a bit of joy into your everyday.
Wash with similar colours. Gentle machine wash at 30 degrees. Do not bleach. Do not tumble dry. Warm iron on reverse. Do not dry clean.
WST6266', '');
insert into `shesg_product` values (255349024007, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/skye-lenzing%E2%84%A2-ecovero%E2%84%A2-geometric-print-ruffle-top-dusky-blue', 'Skye Lenzing™ Ecovero™ Geometric Print Ruffle Top - Dusky Blue


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7084-Skye-Lenzing-Ecovero-Ruffle-Sleeve-Top-in-Dusky-Blue-1_1080x.jpg?v=1676558848', 68.07, 0, now(), now(), 'Womenswear', 't-shirts', '100% LENZING™ ECOVERO™
This fabric is produced using renewable wood. It generates up to 50% less emissions and uses 50% less water than generic Viscose.
We think you\'ll love this one just as much as us. a little frill goes a long way.
Floaty, relaxed fit. Model is 5\'9.5 and wears a size 10.
This geometric print is inspired by authentic tiles in European villages. Wear with the matching skirt.
WST7084', '');
insert into `shesg_product` values (255349024008, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/yara-organic-cotton-dobby-blouse-white', 'Yara Organic Cotton Dobby Blouse - White


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST7496-Yara-Organic-Cotton-Shirt-White-WSB7013-Meadow-Tencel-Trouser-Campaign_1080x.jpg?v=1684421283', 56.30, 0, now(), now(), 'Womenswear', 't-shirts', '100% ORGANIC COTTON*
Organic cotton is natural, breathable, and made using up to 91% less water. Bamboo is one of the fastest growing and most renewable crops.
A short sleeved blouse in the purest of white. Super pretty weekend wear with lots of feminine details that make it extra special.
Relaxed fit, true to size. Model is 5\'10.5 and wears size 10.
Looks great with our DenimKind collection.
WST7496', '');
insert into `shesg_product` values (255349024009, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/fairtrade-organic-cotton-tie-dyed-t-shirt-denim-blue', 'Fairtrade Organic Cotton Tie Dyed T-Shirt - Denim Blue


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/files/WST7095-Fairtrade-Organic-Cotton-Tie-Dyed-T-Shirt-Blue-WSB7019-Ullima-Organic-Cotton-Chambray-Skirt-Campaign_b56e5dd0-de0c-4cd6-8f89-91515674e7aa_1080x.jpg?v=1684421808', 47.01, 0, now(), now(), 'Womenswear', 't-shirts', '100% ORGANIC COTTON SLUB JERSEY
Natural, chemical free, and made with up to 91% less water.
an easy breezy summer t to keep you cool and comfy. no judgement if you wear yours every day.
Relaxed fit, true to size. Model is 5\'9 and wears a size 10.
Hand-dyed so each one is unique.
Wash with similar colours. Gentle machine wash at 30 degrees. Do not bleach. Do not tumble dry. Warm iron on reverse. Do not dry clean.
WST7095', '');
insert into `shesg_product` values (255349024010, 'https://www.wearethought.com/collections/womens-sustainable-t-shirts/products/fairtrade-organic-cotton-tie-dyed-t-shirt-orchid-pink', 'Fairtrade Organic Cotton Tie Dyed T-Shirt - Orchid Pink


 ', 'https://cdn.shopify.com/s/files/1/0598/9852/7927/products/WST7095-Fairtrade-Organic-Cotton-Tie-Dyed-T-Shirt-Orchid-Pink-2_1080x.jpg?v=1675099960', 47.01, 0, now(), now(), 'Womenswear', 't-shirts', '100% ORGANIC COTTON SLUB JERSEY
Natural, chemical free, and made with up to 91% less water.
an easy breezy summer t to keep you cool and comfy. no judgement if you wear yours every day.
Relaxed fit, true to size. Model is 5\'11 and wears a size 10.
Hand-dyed so each one is unique.
Wash with similar colours. Gentle machine wash at 30 degrees. Do not bleach. Do not tumble dry. Warm iron on reverse. Do not dry clean.
WST7095', '');
