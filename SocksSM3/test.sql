CREATE TABLE s_member(
	userId VARCHAR2(50) NOT NULL,
	userPw VARCHAR2(100) NOT NULL,
	userName VARCHAR2(50) NOT NULL,
	userPhone VARCHAR2(50) NOT NULL,
	userAdd1 VARCHAR2(50) NULL,
	userAdd2 VARCHAR2(50) NULL,
	userAdd3 VARCHAR2(50) NULL,
	regiDate date DEFAULT SYSDATE,
	verify number DEFAULT 0,
	PRIMARY KEY(userId)
);

CREATE TABLE s_socks(
	socksNum NUMBER NOT NULL,
	socksName VARCHAR2(50) NOT NULL,
	cateCode VARCHAR2(30) NOT NULL,
	socksPrice NUMBER NOT NULL,
	socksStock NUMBER NULL,
	socksDes VARCHAR(500) NULL,
	socksImg VARCHAR(200) NULL,
	socksDate date DEFAULT SYSDATE,
	PRIMARY KEY(socksNum)
);

CREATE TABLE socks_category(
	cateName VARCHAR2(20) NOT NULL,
	cateCode VARCHAR2(30) NOT NULL,
	cateCodeRef VARCHAR2(30) NULL,
	PRIMARY KEY(cateCode),
	FOREIGN KEY(cateCodeRef) REFERENCES socks_category(cateCode)
);

ALTER TABLE s_socks add
CONSTRAINT fk_socks_category
FOREIGN KEY(cateCode)
REFERENCES socks_category(cateCode);

CREATE SEQUENCE s_socks_seq;

INSERT INTO s_member(userId, userPw, userName, userPhone)
VALUES('아이디', '패스워드', '이름', '전화번호');

INSERT INTO socks_category (cateName, cateCode) VALUES ('man', '100');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('man1', '101', '100');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('man2', '102', '100');

INSERT INTO socks_category (cateName, cateCode) VALUES ('woman', '200');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('woman1', '201', '200');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('woman2', '202', '200');

INSERT INTO socks_category (cateName, cateCode) VALUES ('fakesocks', '300');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('fakesocks1', '301', '300');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('fakesocks2', '302', '300');

INSERT INTO socks_category (cateName, cateCode) VALUES ('babykids', '400');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('babykids1', '401', '400');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('babykids2', '402', '400');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('babykids3', '403', '400');

INSERT INTO socks_category (cateName, cateCode) VALUES ('kneestocking', '500');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('kneestocking1', '501', '500');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('kneestocking2', '502', '500');

INSERT INTO socks_category (cateName, cateCode) VALUES ('acc', '600');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('acc1', '601', '600');
INSERT INTO socks_category (cateName, cateCode, cateCodeRef) VALUES ('acc2', '602', '600');

SELECT * FROM socks_category;
COMMIT

SELECT level, cateName, cateCode, cateCodeRef
FROM socks_category
START WITH cateCodeRef is NULL CONNECT BY PRIOR cateCode = cateCodeRef;

INSERT INTO s_socks (socksNum, socksName, cateCode, socksPrice, socksStock, socksDes)
VALUES (s_socks_seq.nextval, '상품 이름', 100, 1000, 30, '상품 설명');

SELECT socksNum, socksName, cateCode, socksPrice, socksStock, socksDes, socksImg, socksDate
FROM s_socks ORDER BY socksNum DESC;

UPDATE s_member SET verify = 9 WHERE userId = 'ksh146@naver.com';

SELECT * FROM s_socks;

UPDATE s_socks SET socksName = '남성양말1', cateCode = '101', socksPrice = '2000',
socksStock = '400', socksDes = '남성용', socksImg = ''
WHERE socksNum = 1;

COMMIT

SELECT s.socksNum, s.socksName, s.cateCode, c.cateCodeRef, c.cateName,
socksPrice, socksStock, socksDes, socksImg, socksDate
FROM s_socks s inner join socks_category c on s.cateCode = c.cateCode
WHERE s.socksNum = 2;

ALTER TABLE s_socks ADD (socksThumbImg VARCHAR(200));

SELECT * FROM s_socks;

SELECT socksImg, socksThumbImg FROM s_socks;

SELECT s.socksNum, s.socksName, s.cateCode, c.cateCodeRef, c.cateName,
socksPrice, socksStock, socksDes, socksImg, socksDate, s.socksImg, s.socksThumbImg
FROM s_socks s inner join socks_category c on s.cateCode = c.cateCode
WHERE s.cateCode = 100 or c.cateCodeRef = 100;

CREATE TABLE s_reply(
	socksNum NUMBER NOT NULL,
	userId VARCHAR2(50) NOT NULL,
	replyNum NUMBER NOT NULL,
	replyCon VARCHAR2(2000) NOT NULL,
	replyDate DATE DEFAULT SYSDATE,
	PRIMARY KEY(socksNum, replyNum)
);

CREATE SEQUENCE s_reply_seq;

ALTER TABLE s_reply
ADD CONSTRAINT s_reply_socksNum FOREIGN KEY(socksNum)
REFERENCES s_socks(socksNum);

ALTER TABLE s_reply
ADD CONSTRAINT s_reply_userId FOREIGN KEY(userId)
REFERENCES s_member(userId);

COMMIT

// pw: ezen3
INSERT INTO s_reply (socksNum, userId, replyNum, replyCon)
VALUES (21, 'ksh146@naver.com', s_reply_seq.nextval, '페이크삭스');

SELECT * FROM s_reply;

SELECT socksNum, userId, replyNum, replyCon, replyDate
FROM s_reply WHERE socksNum = 2;

SELECT r.socksNum, r.userId, r.replyNum, r.replyCon, r.replyDate, m.userName
FROM s_reply r inner join s_member m on r.userId = m.userId
WHERE socksNum = 2;

DELETE s_reply WHERE replyNum = 23 AND userId = 'ksh146@naver.com';

SELECT userId FROM s_reply WHERE replyNum = 1;

UPDATE s_reply SET replyCon = '수정 내용'
WHERE replyNum = 26 AND userId = 'ksh146@naver.com';

CREATE TABLE s_cart(
	cartNum NUMBER NOT NULL,
	userId VARCHAR2(50) NOT NULL,
	socksNum NUMBER NOT NULL,
	cartStock NUMBER NOT NULL,
	addDate DATE DEFAULT SYSDATE,
	PRIMARY KEY(cartNum, userId)
);

CREATE SEQUENCE s_cart_seq;

ALTER TABLE s_cart ADD CONSTRAINT s_cart_userId 
FOREIGN KEY(userId) REFERENCES s_member(userId);

ALTER TABLE s_cart ADD CONSTRAINT s_cart_socksNum 
FOREIGN KEY(socksNum) REFERENCES s_socks(socksNum);

INSERT INTO s_cart (cartNum, userId, socksNum, cartStock)
VALUES (s_cart_seq.nextval, 'ksh146@naver.com', 2, 99);

SELECT * FROM s_cart;

SELECT row_number() OVER(ORDER BY c.cartNum DESC) AS NUM,
c.cartNum, c.userId, c.socksNum, c.cartStock, c.addDate, s.socksName, s.socksPrice, s.socksThumbImg
FROM s_cart c INNER JOIN s_socks s ON c.socksNum = s.socksNum
WHERE c.userId = 'ksh146@naver.com';

DELETE s_cart WHERE cartNum = 1 AND userId = 'ksh146@naver.com';

CREATE TABLE s_order(
	orderId VARCHAR2(50) NOT NULL,
	userId VARCHAR2(50) NOT NULL,
	orderRec VARCHAR2(50) NOT NULL,
	userAdd1 VARCHAR2(100) NOT NULL,
	userAdd2 VARCHAR2(100) NOT NULL,
	userAdd3 VARCHAR2(100) NOT NULL,
	orderPhone VARCHAR2(30) NOT NULL,
	amount NUMBER NOT NULL,
	orderDate DATE DEFAULT SYSDATE,
	PRIMARY KEY(orderId)
);

ALTER TABLE s_order
ADD CONSTRAINT s_order_userId FOREIGN KEY(userId)
REFERENCES s_member(userId);

CREATE TABLE s_order_details(
	orderDetailsNum NUMBER NOT NULL,
	orderId VARCHAR2(50) NOT NULL,
	socksNum NUMBER NOT NULL,
	cartStock NUMBER NOT NULL,
	PRIMARY KEY(orderDetailsNum)
);

CREATE SEQUENCE s_order_details_seq;

ALTER TABLE s_order_details
ADD CONSTRAINT s_order_details_orderId FOREIGN KEY(orderId)
REFERENCES s_order(orderId);

SELECT o.orderId, o.userId, o.orderRec, o.userAdd1, o.userAdd2, o.userAdd3, o.orderPhone, o.amount, o.orderDate
FROM s_order o 
INNER JOIN s_order_details d ON o.orderId = d.orderId
WHERE userId = 'ksh146@naver.com';

SELECT * FROM s_cart;

SELECT orderId, userId, orderRec, userAdd1, userAdd2, userAdd3, orderPhone, amount, orderDate
FROM s_order WHERE userId = 'ksh146@naver.com';

SELECT o.orderId, o.userId, o.orderRec, o.userAdd1, o.userAdd2, o.userAdd3, o.orderPhone, o.amount, o.orderDate,
d.orderDetailsNum, d.socksNum, d.cartStock, s.socksName, s.socksThumbImg, s.socksPrice
FROM s_order o INNER JOIN s_order_details d ON o.orderId = d.orderId
INNER JOIN s_socks s ON d.socksNum = s.socksNum
WHERE o.orderId = '20210318_592935';

SELECT orderId, userId, orderRec, userAdd1, userAdd2, userAdd3, orderPhone, amount, orderDate
FROM s_order;

ALTER TABLE s_order ADD(
	delivery VARCHAR2(20) DEFAULT '배송 준비'
);

SELECT orderId, userId, orderRec, userAdd1, userAdd2, userAdd3, orderPhone, amount, orderDate, delivery
FROM s_order WHERE userId = 'ksh146@naver.com';

UPDATE s_order SET delivery = '배송중'
WHERE orderId = '20210319_470652';

UPDATE s_socks SET socksStock = socksStock - 5
WHERE socksNum = 46;

SELECT * FROM s_order_details WHERE orderId = '20210319_470652';

SELECT orderId, socksNum, cartStock FROM s_order_details
WHERE orderId = '20210319_470652';

SELECT r.socksNum, r.userId, r.replyNum, r.replyCon, r.replyDate, m.userName
FROM s_reply r INNER JOIN s_member m ON r.userId = m.userId;

ALTER TABLE s_order MODIFY(userAdd1 VARCHAR2(100));
ALTER TABLE s_order MODIFY(userAdd2 VARCHAR2(100));
ALTER TABLE s_order MODIFY(userAdd3 VARCHAR2(100));

DELETE FROM s_order WHERE orderId = '20210318_309113';