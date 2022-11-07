----계정 생성 및 권한 부여
--CREATE USER semipro IDENTIFIED BY 1234;
--GRANT RESOURCE, CONNECT TO semipro;

--제약조건 상관없이 삭제할 수 있는 구문
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE PLANT_LIKE CASCADE CONSTRAINTS;
DROP TABLE MYPLANT CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE PLANT_INFO CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE NEWS CASCADE CONSTRAINTS;
DROP TABLE TODAY_FLOWER CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_LIKE CASCADE CONSTRAINTS;
DROP TABLE WEATHER CASCADE CONSTRAINTS;

--테이블 생성 및 PK 설정
CREATE TABLE USERS  (
    uNo        NUMBER           NOT NULL,
     uIds        VARCHAR2(100)   UNIQUE NOT NULL,
    uPw        VARCHAR2(100)   NOT NULL,
    uRole        VARCHAR2(30)   DEFAULT '일반 유저' NOT NULL,
     uName        VARCHAR2(50)   NOT NULL,
    uNickname    VARCHAR2(50)   NULL,
    uPhone    VARCHAR2(50)   NULL,
    uAddr        VARCHAR2(100)   NULL,
    uBirth    VARCHAR2(50)           NULL,
    uImgUrl      VARCHAR2(500)  NULL,
    uStatus    VARCHAR2(1)       DEFAULT 'Y' CHECK (uStatus IN('Y', 'N')) NOT NULL,
    uSignIn    DATE           DEFAULT SYSDATE NOT NULL,
    uUpDate    DATE           DEFAULT SYSDATE NOT NULL,
     CONSTRAINT PK_uNO PRIMARY KEY (uNo),
     CONSTRAINT CK_uRole CHECK (uRole IN('일반 유저', '관리자'))
);

DROP SEQUENCE SEQ_uNO;
CREATE SEQUENCE SEQ_uNO;

DROP SEQUENCE SEQ_boNO;
CREATE SEQUENCE SEQ_boNO;

DROP SEQUENCE SEQ_mpNo;
CREATE SEQUENCE SEQ_mpNo start with 1;




DROP SEQUENCE SEQ_prLikeNO;
CREATE SEQUENCE SEQ_prLikeNO;

CREATE TABLE  MYPLANT  (
     mpNo            NUMBER           NOT NULL,
    uNo            NUMBER           NOT NULL,
     mpSctNm        VARCHAR2(50)    NOT NULL,
     mpName        VARCHAR2(50)   NOT NULL,
     mpWatering     VARCHAR2(50)   NULL,
    mpStatus        VARCHAR2(1)       DEFAULT 'Y' CHECK (mpStatus IN('Y', 'N')) NOT NULL,
    mpCreateDate    VARCHAR2(50)   NULL,
     mpFileName     VARCHAR2(200)   NULL,
     re_mpFileName  VARCHAR2(200)   NULL,
     CONSTRAINT PK_mpNO PRIMARY KEY (mpNo)
);

CREATE TABLE  NEWS  (
    colNo            NUMBER           NOT NULL,
    uNo            NUMBER           NOT NULL,
    nTitle        VARCHAR(50)       NOT NULL,
    nContent        VARCHAR(1000)   NOT NULL,
    nFile            VARCHAR2(255)   NULL,
    nView            NUMBER           DEFAULT 0 NOT NULL,
    nStatus        VARCHAR2(1)       DEFAULT 'Y' CHECK (nStatus IN ('Y', 'N')) NOT NULL,
    nCreateDate    DATE           DEFAULT SYSDATE NOT NULL,
    nModifyDate    DATE           DEFAULT SYSDATE NOT NULL,
     CONSTRAINT PK_colNO PRIMARY KEY (colNo)
);

CREATE TABLE  BOARD  (
    boNo    NUMBER   NOT NULL,
    uNo    NUMBER NOT NULL,
    uName VARCHAR2(70)    NULL,
--    uIds  VARCHAR2(70)   NOT NULL,
    
    boTitle    VARCHAR2(70)   NOT NULL,
    boCont    VARCHAR2(2000)   NOT NULL,
    boType    VARCHAR2(100)   NOT NULL,
    boFileName    VARCHAR2(255)   NULL,
    re_boFileName VARCHAR2(255)   NULL, 
    boView    NUMBER   DEFAULT 0 NOT NULL,
    boStatus    VARCHAR2(1)   DEFAULT 'Y' CHECK (boSTATUS IN('Y', 'N')) NOT NULL,
    boCreateDate    DATE   DEFAULT SYSDATE NOT NULL,
    boModifyDate    DATE   DEFAULT SYSDATE NOT NULL,
    boImgUrl    VARCHAR2(700)   NULL,
    
     CONSTRAINT PK_boNO PRIMARY KEY (boNo)
);


CREATE TABLE  REPLY  (
    coNo    NUMBER   NOT NULL,
    boNo    NUMBER   NOT NULL,
    uNo    NUMBER   NOT NULL,
    coId    VARCHAR2(100)   NOT NULL,
    uName     VARCHAR2(100)   NOT NULL,
    coContent    VARCHAR2(400)   NOT NULL,
    coStatus    VARCHAR2(1)   DEFAULT 'Y' CHECK (coSTATUS IN ('Y', 'N')) NULL,
    coCreateDate    DATE   DEFAULT SYSDATE NULL,
    coModifyDate    DATE   DEFAULT SYSDATE NULL,
     CONSTRAINT PK_coNO PRIMARY KEY (coNo)
);

CREATE TABLE  PLANT_INFO  (
    pNo    NUMBER   NOT NULL,
    PKORNAME    VARCHAR2(500)   NOT NULL,
    PENGNAME    VARCHAR2(500)   NOT NULL,
    PSCTNAME    VARCHAR2(500)   NOT NULL,
    pLang    VARCHAR2(500)   NULL,
    pContent    VARCHAR2(1000)   NULL,
    pUse    VARCHAR2(1000)   NULL,
    pGrow    VARCHAR2(1000)   NULL,
    pType    VARCHAR2(1000)   NULL,
    pImgUrl1    VARCHAR2(500)   NULL,
    pImgUrl2    VARCHAR2(500)   NULL,
    pImgUrl3    VARCHAR2(500)   NULL,
    pTemperature    VARCHAR2(500)   NULL,
    pHumidity    VARCHAR2(500)   NULL,
    pSunshine    VARCHAR2(500)   NULL,
    pWaterCycle    VARCHAR2(500)   NULL,
    pFloweringTime    VARCHAR2(500)   NULL,
    pView    NUMBER   NULL,
    pTag    VARCHAR2(500)   NULL,
     CONSTRAINT PK_pNO PRIMARY KEY (pNo)
);

CREATE TABLE  PLANT_LIKE  (
    plLikeNo    NUMBER  NOT NULL,
    pNo    NUMBER   NOT NULL,
    uNo    NUMBER   NOT NULL,
     CONSTRAINT PK_plLikeNo PRIMARY KEY (plLikeNo)
);

CREATE TABLE  PRODUCT  (
    prNo    NUMBER   NOT NULL,
    prName    VARCHAR(50)   NOT NULL,
    prType    VARCHAR(50)   NOT NULL,
    prPrice    VARCHAR(50)   NOT NULL,
    prImage    VARCHAR(500)   NOT NULL,
    prUrl       VARCHAR(500) NOT NULL,
    
     CONSTRAINT PK_prNO PRIMARY KEY (prNo)
);
DROP SEQUENCE SEQ_prNO;
CREATE SEQUENCE SEQ_prNO start with 1;

DROP SEQUENCE SEQ_coNO;
CREATE SEQUENCE SEQ_coNO start with 1;

DROP SEQUENCE SEQ_pNO;
CREATE SEQUENCE SEQ_pNO start with 1;


CREATE TABLE  PRODUCT_LIKE  (
    prLikeNo    NUMBER   NOT NULL,
    prNo    NUMBER   NOT NULL,
    uNo    NUMBER   NOT NULL,
     CONSTRAINT PK_prLikeNo PRIMARY KEY (prLikeNo)
);

CREATE TABLE  TODAY_FLOWER  (
    fNo    NUMBER   NOT NULL,
    fKrName    VARCHAR2(50)   NULL,
    fEnName    VARCHAR2(50)   NULL,
    fLang    VARCHAR2(50)   NULL,
    fContent    VARCHAR2(200)   NULL,
    fUse    VARCHAR2(200)   NULL,
    fGrow    VARCHAR2(200)   NULL,
    fType    VARCHAR2(200)   NULL,
    fImgUrl    VARCHAR2(255)   NULL,
     CONSTRAINT PK_fNO PRIMARY KEY (fNo)
);

CREATE TABLE  WEATHER  (
    wNo    NUMBER   NOT NULL,
    wImg    VARCHAR2(255)   NULL,
    temperature    VARCHAR2(10)   NULL,
    region    VARCHAR2(10)   NULL,
     CONSTRAINT PK_wNO PRIMARY KEY (wNO)
);

--제약조건 설정
ALTER TABLE  MYPLANT  ADD CONSTRAINT  FK_USERS_TO_MYPLANT
FOREIGN KEY(uNo)REFERENCES USERS(uNo);

ALTER TABLE  BOARD  ADD CONSTRAINT  FK_USERS_TO_BOARD
FOREIGN KEY(uNo) REFERENCES USERS (uNo);

ALTER TABLE  NEWS  ADD CONSTRAINT  FK_USERS_TO_NEWS
FOREIGN KEY (uNo) REFERENCES  USERS (uNo);

ALTER TABLE  PLANT_LIKE  ADD CONSTRAINT  FK_USERS_TO_PLANT_LIKE
FOREIGN KEY (uNo) REFERENCES  USERS(uNo);

ALTER TABLE  PRODUCT_LIKE  ADD CONSTRAINT  FK_USERS_TO_PRODUCT_LIKE
FOREIGN KEY (uNo) REFERENCES  USERS (uNo);

ALTER TABLE  REPLY  ADD CONSTRAINT  FK_BOARD_TO_REPLY
FOREIGN KEY (boNo)REFERENCES BOARD (boNo);

ALTER TABLE  PLANT_LIKE  ADD CONSTRAINT  FK_PLANT_INFO_TO_PLANT_LIKE
FOREIGN KEY (pNo) REFERENCES  PLANT_INFO (pNo);

ALTER TABLE  PRODUCT_LIKE  ADD CONSTRAINT  FK_PRODUCT_TO_PRODUCT_LIKE
FOREIGN KEY (prNo) REFERENCES PRODUCT (prNo);

--임시 데이터 삽입

--  prNo    NUMBER   NOT NULL,
--    prName    VARCHAR(30)   NOT NULL,
--    prType    VARCHAR(30)   NOT NULL,
--    prPrice    VARCHAR(30)   NOT NULL,
--    prImage    VARCHAR(100)   NOT NULL,
--     CONSTRAINT PK_prNO PRIMARY KEY (prNo)
SET DEFINE OFF;
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '식물식재용 토양비료 10L', '토양', '\5,030', 'https://shop-phinf.pstatic.net/20220225_153/1645773887257OlDCY_JPEG/53238412085710152_1598236425.jpg?type=m510', 'https://smartstore.naver.com/selectstore1/products/6748329760');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '인테리어화분 바소(5cm)', '화분', '\1,770', 'https://shopping-phinf.pstatic.net/main_2401458/24014587182.20210312152002.jpg?type=f640', 'https://smartstore.naver.com/gooddaiso/products/5626573962');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '덩굴 장미 묘목', '꽃', '\21,010', 'https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/2428297753/B.jpg?724000000', 'https://www.11st.co.kr/products/2428297753?trTypeCd=21&trCtgrNo=585021');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '식물영양제 앰플 35ml x 21P', '영양제', '\4,100', 'https://shop-phinf.pstatic.net/20201116_268/1605500530716ok1Yu_JPEG/100156_1.jpg?type=m510', 'https://smartstore.naver.com/walledgardening/products/5214750071');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '관엽식물영양제 앰플 35ml x 21P', '영양제' , '\4,300', 'https://shop-phinf.pstatic.net/20211222_268/16401522475919K9ph_JPEG/104000_1.jpg?type=m510', 'https://smartstore.naver.com/eogksxhrl/products/6117064338');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '다용도 배양토 5L 분갈이흙', '토양', '\4,300', 'https://shop-phinf.pstatic.net/20190919_42/15688713338485kSiD_JPEG/103149_1.jpg?type=m510', 'https://smartstore.naver.com/eogksxhrl/products/4673886921');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '유칼립투스 중형 독일토분', '식물', '\35,800', 'https://shop-phinf.pstatic.net/20201126_154/1606377398815xewo8_JPEG/7513244172700239_343746584.jpg?type=m510', 'https://smartstore.naver.com/soonsil/products/5240621511');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '공기정화식물 스파티필름' , '식물', '\4,250', 'https://shop-phinf.pstatic.net/20220803_216/1659484828873w1sn8_JPEG/60620671461004946_30196375.jpg?type=m510', 'https://smartstore.naver.com/soonsil/products/4826842584');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '유포르비아 선인장', '식물', '\41,000', 'https://shop-phinf.pstatic.net/20210423_231/1619169481854QYUuc_JPEG/20305315610752248_316284851.jpg?type=m510', 'https://smartstore.naver.com/soonsil/products/5543905419');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '블랙 마사토 2L 분갈이 배양토', '토양', '\5,700', 'https://shop-phinf.pstatic.net/20220804_216/1659603759514vf7O8_JPEG/60739594316279823_1049766112.jpg?type=m510', 'https://smartstore.naver.com/eogksxhrl/products/602967625');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '국화(폼폰타입)8cm분', '꽃' , '\3,300','https://shop-phinf.pstatic.net/20210728_60/1627399854899uw2JQ_JPEG/28535743608173764_1999662120.jpg?type=m510', 'https://smartstore.naver.com/flowerseedmall/products/5748432530');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '민들레 씨앗 (1000립)', '꽃', '\1,900', 'https://shop-phinf.pstatic.net/20200211_35/1581399160731rrOgj_JPEG/103321_1.jpg?type=m510', 'https://smartstore.naver.com/eogksxhrl/products/4817600577');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '제라늄(리갈)-아리스토 라일락퍼플', '꽃', '\4,500', 'https://shop-phinf.pstatic.net/20220510_283/1652192477824KNP9X_JPEG/53328373313676062_1223937789.jpg?type=m510', 'https://smartstore.naver.com/flowerseedmall/products/6657182909');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '피터스500g 수용성 비료 식물 영양제', '영양제', '\8,300', 'https://shop-phinf.pstatic.net/20201227_239/1609050419250SCQpJ_JPEG/10186198935225008_581283221.jpg?type=m510', 'https://smartstore.naver.com/soonsil/products/5295964373');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '행잉 포트볼 플라스틱화분', '화분', '\3,000', 'https://shop-phinf.pstatic.net/20220305_108/1646470484292WwxYp_JPEG/47606311802616318_1625016099.jpg?type=m510', 'https://smartstore.naver.com/soonsil/products/6372284052');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '스투키 산세베리아 실내공기정화식물', '식물', '\94,900', 'https://shop-phinf.pstatic.net/20180827_112/cortezclub_15353331657397Vs2p_JPEG/58640325357943057_1434236850.jpg?type=m510', 'https://smartstore.naver.com/soonsil/products/3465932087');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '옥잠화 씨앗 (20립)', '꽃', '\3,900', 'https://shop-phinf.pstatic.net/20190117_216/eogksxhrl_154769991373598Qx3_JPEG/102697_1.jpg?type=m510', 'https://smartstore.naver.com/eogksxhrl/products/4084072460');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '수선화-제주겹수선', '꽃', '\1,900', 'https://shop-phinf.pstatic.net/20220718_127/16581136601408eASp_JPEG/59249505857097991_1861079571.jpg?type=m510', 'https://smartstore.naver.com/flowerseedmall/products/6929618348');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '분갈이 몸살 발근제 뿌리용', '영양제', '\4,200' , 'https://shop-phinf.pstatic.net/20211209_179/1639038934659AxV0o_JPEG/103951_1.jpg?type=m510', 'https://smartstore.naver.com/eogksxhrl/products/6080135824');
INSERT INTO PRODUCT VALUES (SEQ_prNO.NEXTVAL, '테라조 시멘트 대리석 화분', '화분', '\9,000', 'https://shop-phinf.pstatic.net/20200303_160/1583206313264oIT5n_JPEG/20567855847835852_806267700.jpeg?type=m510', 'https://smartstore.naver.com/soonsil/products/4840638341');
SELECT * FROM DUAL;

--행 1
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (1,'향나무','Chinense juniper','Juniperus chinensis','영원한 향기','향나무는 상록침엽수로 우리나라에서 가장 오래 사는 나무 중의 하나이다. 예로부터 마음을 담아 기원을 하는 나무로 소중히 여겨왔으며 관상, 약용, 향료, 조각재 등으로 널리 이용되어 왔다. 목질도 단단하려니와 목재의 향과 색이 일품인 이유로 보인다. 울릉도 도동에 사는 향나무는 2,500년생으로 세계에서 가장 오래된 것으로 전해지고 있다.','향나무는 입지조건을 크게 구애받지 않아 건물주변의 녹지조성이나 가로수로 이용하고 있으며 가지가 곧게 또는 구부러지는 모양새를 하고 있어 정원수나 생울타리로 애용되고 있고 분재용으로도 쓰이고 있다. 특히 공해와 추위에 강해 전국에서 월동할 수 있어 생활주변에서 가장 널리 쓰이는 상록교목 중의 하나이다.','어릴 때 성장은 더디며 뾰족한 침엽을 보이지만 10년 이상 지나면 침엽이 비늘잎형태로 변하면서 성장도 빨라진다. 열매는 땅에 떨어져 스스로 발아되는 경우는 드물고 새 먹이가 되어 배설물에 섞여 나오면 과육에 있는 발아억제물질이 제거되어 싹이 나게 된다. 대부분은 꺾꽂이로 증식하는데, 봄에 본격적으로 나오는 새순을 잘라 꽂으면 뿌리가 잘 내린다.','측백나무과 향나무속에 속하며 전국에 자생 또는 식재되어 있다. 종류는 자생하거나 흔히 심겨져 있는 향나무, 줄기가 누운 형태로 자라는 눈향나무, 고산지대에서만 자라는 곱향나무, 가지가 수평으로 퍼지는 뚝향나무, 북아메리카원산인 연필향나무 그리고 가지가 나선모양으로 돌아가는 가이쓰가향나무가 있으며 주로 이용되는 것은 가이쓰가향나무와 연필향나무다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0101-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0101-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0101-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'나무 공기정화 향이 좋은');
--행 2
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (2,'나도풍란','Orchid','Aerides japonicum','인내','남부지역의 바위나 나무에 붙어사는 난이다. 보통 풍란 하면 소엽풍란을 말한다. 나도풍란은 잎이 넓은 대엽풍란이다. 자연 상태에서는 6년 정도가 지나야 꽃을 피우는데, 그 향기가 진하여 취할 정도로 좋다. 꽃말은 바닷가의 바위에 붙어 모진 풍파를 이겨내며 자라기 때문에 붙여진 듯 하다.','건강하게 보이는 넓고 두꺼운 잎과 연녹색으로 피는 꽃의 단아함과 더불어 뿌리의 관상가치까지 더해져 예로부터 선비들에게 사랑받아온 난이다. 주로 관상용으로 목부작, 석부작에 이용한다.','조직배양 기술의 발달로 일반인도 쉽게 접할 수 있게 되었다. 현재 유통되고 있는 것들은 거의 전량 조직배양묘로 볼 수 있다. 가정에서는 풍란의 자생지 상태 즉 항상 습기가 있고 통풍이 잘 되는 곳을 좋아한다. 나도풍란도 풍란처럼 공기뿌리를 가지고 있어서 공기 중의 습도가 높아야 잘 자란다.','난과의 상록다년초이다. 히말라야, 말레이시아, 스리랑카, 일본, 중국 등에서 자생한다. 우리나라에서는 제주와 전남, 남해안의 따뜻한 섬지방에서 자생하나 지금은 멸종위기에 놓여있다. 원예연구기관에서 조직배양묘를 생산하여 자생지 복원사업을 추진하여 성공단계에 와 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0102-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0102-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0102-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 초보자용 어두운 곳에서도 자라는');
--행 3
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (3,'군자란','Bush lily','Clivia spp.','고귀','君子蘭(군자란)은 이름 끝에 ‘란’이라고 되어있어서 난 종류일거라 생각하기도 하지만 난과는 전혀 관계없는 식물이다. 이름은 동양적지만 고향은 남아프리카이다. 잎을 주로 관상하는 관엽식물이지만 긴 꽃대 끝에 여러 송이가 함께 피는 꽃 모양이 매우 아름답다. 겨울철 꽃이 참 귀할 때인데 비록 실내이긴 하지만 꽃을 보여주니 참 고귀하다는 생각이 든다.','쭉 뻗은 가죽질의 크고 싱싱한 잎이나 화려한 꽃을 감상하는 분화용으로 주로 이용된다. 최근 원예용으로 꽃 색이나 모양이 다른 것, 잎에 무늬가 들어 있거나 잎 모양이 다른 것 등 품종들이 많이 개발되어 있다.','군자란은 수명이 30년 이상 장수하는 식물이다. 어린 묘로부터 시작하면 3년은 지나야 꽃이 피지만 일단 꽃을 피운 것은 이듬해부터는 매년 꽃을 피운다. 씨앗으로 번식해도 되지만 꽃이 피기까지 5년 정도 걸리기 때문에 보통은 포기나누기(분주) 방식으로 증식한다. 씨앗은 11월경에 충분히 성숙된 것을 따서 뿌리면 되는데 다소 저온인 16-21℃에서 발아가 잘된다. 포기나누기는 늦은 겨울이나 이른 봄에 한다.','수선화과에 속하는 상록성의 다년생 식물로써, 강변이나 숲 속의 물기가 충분히 있는 곳에 자생하며 세계적으로 4종이 분포한다. 우리나라에는 주로 미니아타종이 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0103-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0103-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0103-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 향이 좋은');
--행 4
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (4,'삼나무','Japanese cedar','Cryptomeria japonica','견고, 자신감','상록성 교목으로 원래 우리 땅에 나던 것은 아니다. 일본이 고향인데 우리나라에서는 남부지역에서 많이 재배된다. 어떠한 세찬 바람에도 넘어지지 않고 하늘을 찌를 듯이 우뚝 서 있는 그 모습이 견고해 보이고 자신감이 충만해 보인다.','키가 40m까지 자라는 데다 비교적 빨리 자라며 성목이 되면 지름도 1~2m에 달해 어지간한 바람에도 잘 쓰러지지 않는다. 제주도나 남부 해안가에서 논이나 밭 주변에 심어 바닷바람을 막는 방풍림으로 활용하고 있다. 중부지방에서도 월동이 가능하여 산림녹화용 울타리용으로도 폭넓게 이용되며 목재가 부드럽고 견고하여 건축재로도 쓰인다.','암꽃과 수꽃이 한 나무에 있는 일가화(一家花)인데 모양이 서로 다르며 가지 끝에 달려 핀다. 나무 종류에서는 꽃이 비교적 빠른 것으로 3월에 피어 10월에 열매가 익는다. 10월에 씨앗을 채취하여 밀봉 저장했다가 파종해도 되며 삽목으로도 번식한다.','낙우송과 삼나무속이며 원산지는 중국, 일본으로 지구상에 딱 한 종이 분포하며, 몇 가지 품종이 개발되어 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0104-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0104-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0104-1_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'나무 공기정화');
--행 5
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (5,'수선화','Daffodil','Narcissus spp. ','자만심, 자존심, 자신만을 사랑하다','수선화의 유래를 보면 그리스신화에 나오는 미소년 나르시스(나르키소스)가 제 모습에 반하여 죽어 꽃이 되었다하니 그 정도의 자존심이면 꽃이 고개를 들만도 한데 꽃은 늘 땅을 바라보고 있다. 꽃 모양은 은 접시에 금잔이 놓여있는 듯 아름답고 향기도 강하다. 아름답고 똑똑한 것도 좋지만 너무 지나치면 결국 자기도취에 빠져 헤어날 수 없음을 가르쳐 주는 듯 하다.','추위엔 강한 편으로 전국에서 월동이 가능하지만 꽃은 정원에서 서울 등 중부지역은 4월 이후에 피며, 제주(제주수선)에서는 2월이면 핀다. 음지나 여름철의 더위에는 약하다. 암석정원이나 일반 가정의 이른 봄 화단용으로 잘 어울리며, 꽃이 없을 때 잎 모양도 정연하여 보기가 좋다.','수 천 개의 원예품종이 개발되어 있으며, 꽃은 노란 색인 것들이 많고 흰색인 것도 있다. 꽃은 자연 상태에서 4월 이전에 피는 것들이 대부분이다. 번식은 열매가 맺히지 않기 때문에 엄마알뿌리에서 이듬해 자연적으로 나온 아가알뿌리를 떼어 증식한다. 가을에 햇볕이 잘 드는 화단에 심으면 이른 봄에 꽃을 관상할 수 있다. 봄에 꽃이 피고나면 잎이 시들면서 말라 없어지고 알뿌리만 남아 여름, 가을을 난 다음 초겨울에 잠이 깨 이른 봄에 다시 잎이 자라고 꽃이 핀다.','수선화과에 속하며 세계적으로 약 50종이 분포하는데 알뿌리류가 대부분이지만 숙근성인 것들도 있다. 적응범위가 넓어 해안가로부터 산 중턱에 이르기까지 널리 분포하지만 주로 초원지대에 자생한다. 유럽과 북아프리카가 주요 원산지이며, 우리나라에도 제주에서 자생한다. 수선화는 종에 따라 화형이 다른 것들이 많아 꽃의 모양을 기준으로 Trumpet, Large-cupped, Small-cupped, Double, Triandrus, Cyclamineus 등 총 12개의 형으로 구분한다. 수선화의 영명은 ''Daffodil''이다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0105-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0105-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0105-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 향이 좋은 초보자용');
--행 6
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (6,'파키라','Guiana chestnut, Water chesnut','Pachira aquatica','행운','공기정화식물도 잘 알려져 있다. 손가락같이 갈라진 잎과 뿌리 윗부분의 줄기가 통통한 모양새가 특이한 이국적인 식물이다. 자생지인 멕시코에서는 교목성으로 자라지만 우리나라에서는 화분에 심어 잎을 관상하는 관엽식물로 자리잡고 있다.','잎은 시원하고 줄기는 매끈하며 특히 줄기 아랫부분은 항아리모양으로 불룩하게 비대되어 모양이 특이하며 보기가 좋아 집안의 거실이나 건물의 실내식물로 잘 어울린다. 현재 이용되는 것은 대형종이 많지만 키가 작은 소형종도 있다.','전형적인 남방계식물로 추위에 약해 겨울에도 최저 10℃ 이상은 되어야 별탈없이 월동할 수 있다. 보통은 16-30℃정도가 알맞다. 실내라 하더라도 햇볕이 잘 드는 곳이 좋으며 환기만 잘 된다면 습도가 높을수록 잘 자란다.','물밤나무과에 속하며 원산지인 남미에서는 열매를 식용으로 쓰기도 한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0106-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0106-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0106-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'나무 물을 자주 주지 않아도 되는');
--행 7
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (7,'스토크','Stoke','Matthiola incana','영원한 아름다움, 사랑의 굴레','생화로도 향이 좋으나 드라이플라워로 만들어도 향기가 나는 방향성식물이다. 꽃말처럼 이젠 아름다움은 눈에 보이는 것만으로는 부족한 듯 하다. 향기까지 생각한다면 오래 기억되는 아름다움이다.','일년생 초화류로 원예품종이 많이 개발되어 있다. 우리나라에서는 꽃꽂이용으로 상당량 재배되고 있으며 재배품종은 일본에서 육성한 품종이 주류를 이루고 있다. 꽃은 품종에 따라 여러 가지 색이 있지만 국내에서 재배되는 것은 대부분 흰색계통이다. 일반 가정에서 화단이나 분화용으로 기르는 경우는 거의 없고 대부분 꽃꽂이용으로 활용되고 있다.

','스토크는 원래 저온성 식물이기 때문에 추위에 강한 편으로 생육적온은 주간 15-20℃, 야간 8-10℃이며, 낮에 25℃이상의 온도가 계속되면 꽃의 간격이 벌어지면서 상품성이 크게 떨어진다. 현재 재배작형이 충분히 세분화되어 있어서, 수요만 있다면 연중 생산이 가능한 품목이다.','십자화과에 속하며 세계적으로 약 55종이 분포한다. 일년생, 다년생인 것들이 대부분이지만 덩굴성인 것도 있다. 주요 분포지는 서유럽(지중해연안), 남아프리카, 아시아 지역의 평원이다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0107-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0107-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0107-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 ');
--행 8
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (8,'아나나스','Variegated pineapple ','Ananas spp.','미래를 즐긴다, 만족','보통 관엽식물 중 꽃이 피는 것이 드문데, 이 식물은 꽃이 여름에 피는 관엽으로 꽃이나 잎 모양이 모두 좋아 인기를 끈다. 아나나스는 원주민의 말로 파인애플이라고 한다.','자생지에서는 상당히 큰 식물이며 많은 원예종들이 개량되고 있다. 우리나라에서는 중형 분화용으로서 온실 등 실내 관엽식물로 애용되고 있다. 꽃이 장기간 피어 있을 뿐만 아니라 혁질의 광택 잎이 보기가 좋아 거실이나 사무실 주변의 장식용으로도 좋다.','아나나스는 종류가 많고 좋아하는 환경도 다양하지만 대부분 약간 반그늘에서 잘 자란다. 하지만 잎이 단단한 종류는 광선을 충분히 쪼여줘야 고유의 잎색이 나온다. 겨울동안에는 물을 적게 주는 것이 좋으며, 온도는 최저 5∼6℃에서도 버틸 수 있다. 아나나스류는 한번 꽃이 핀 포기에서는 다시 꽃을 피우지 않는다. 뿌리부근에서 나오는 새 포기를 길러야하며 새 포기는 일 년 정도 지나면 다시 꽃을 피우기 시작한다.','파인애플과에 속하며 남미가 고향인 열대식물로써 상록성이다. 자생지에는 5∼6종의 원종이 분포하는데 해발 1,000m 이상의 고지대에서 자란다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0108-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0108-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0108-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'초보자용');
--행 9
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (9,'아마릴리스','Amaryllis','Amaryllis spp.','수다쟁이, 눈부신 아름다움','본래의 아마릴리스는 Belladonna Lily를 말하며 오늘의 꽃은 여러 종을 교배하여 만들어낸 품종이다. 꽃이 크고 화려해서 아름다운 귀부인을 보는 듯한 느낌이 든다.','꽃과 잎을 모두 관상하는 분화용으로 인기 있는 품목이며, 최근에는 꽃이 매우 화려하기 때문에 절화용으로도 인기가 좋다. 현재 많은 원예품종들이 개발되어 꽃색도 다양하다.','글라디올러스처럼 봄에 심는 알뿌리 종류다. 개화에 필요한 특별한 환경조건은 없고 생육온도만 맞으면 연중 쉽게 개화되기 때문에 재배가 용이하다. 우리나라에서 노지에서는 제주도에서만 월동이 가능하며 알뿌리도 주로 제주도에서 생산되고 있다.','수선화과에 속하며 세계적으로 약 70여종이 분포하는데 브라질, 페루 등 남미와 멕시코에 많이 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0109-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0109-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0109-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 향이 좋은 화려한');
--행 10
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (10,'우묵사스레피','Eurya','Eurya emarginata','기억 속에 새기다.','남해의 세찬 바닷바람에도 잘 견디는 늘 푸른 나무이다. 뒤로 약간 말려들어간 동그랗고 작은 잎도 귀엽지만 열매가 쥐똥같이 생겼다 하여 섬 지방에서는 섬쥐똥나무라고도 부른다.','전체적인 수형도 아름답고 생장이 빠르며 공해에도 강하지만 음지나 추위에 약한 편이다. 남부의 공단이나 도로변에 조경용으로 이용이 가능하며 남부지역에서는 정원이나 생울타리용으로도 좋은 식물이다. 사스레피나무의 절지는 전국적으로 화환 제작에 이용된다. 우리나라에서는 화환을 만들 때 사스레피나무와 함께 녹색배경으로 가장 많이 쓰이는 소재 중의 하나이다.','씨앗은 가을에 익은 다음 따서 열매의 과육을 제거 후 바로 뿌리거나 땅에 묻었다가 이듬해 뿌린다. 삽목은 4월 하순경에 새로 나온 가지를 꺾꽂이하여 번식한다.','차나무과에 속하는 상록성 관목이다. 세계적으로 아시아 동남부 및 태평양 열도를 중심으로 약 70종이 자생한다. 우리나라에서는 주로 제주지역이나 남부해안가에 자생하며, 유사종으로 사스레피나무, 거제도에 나는 섬사스레피나무, 잎이 넓고 두꺼운 떡사스레피나무 등이 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0110-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0110-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0110-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'공기정화');
--행 11
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (11,'앵초','Primrose','Primula sieboldii','번영','물결치는 듯이 곱슬거리는 잎이 인상적인 앵초는 전형적인 한국의 자생화다. 물론 우리와 자연환경이 비슷한 중국이나 일본지역에서도 자생한다. <br><br>
<br><br>
','자연 상태에서 꽃이 3-4월에 피는데, 핑크 빛으로 피는 꽃의 자태는 정말 아름답다. 키는 10cm이내이면서 잎 모양이 좋고 특히 꽃의 관상가치가 높아 고급 화단용으로 좋다. 추위에는 매우 강하지만 여름 고온에는 약하다.','앵초는 봄에 꽃이 핀 후 6월경에 씨앗이 익는데, 씨앗은 성숙하자마자 깊은 휴면에 들어가 이듬해 봄에나 깨어난다. 식물체도 물론 숙근초로써 여름 더위에 지상부는 마르고 지하부 뿌리만 살아서 여름을 보낸 다음 가을부터 다시 생육을 재개하여 겨울을 나면서 몸에 저온을 받아 봄에 꽃이 피게 된다. 씨앗으로도 증식이 잘되지만 초여름 꽃이 다 진 뒤 포기나누기를 해도 쉽게 증식할 수 있다.','앵초과의 다년생 초본이며 지구상에 500종이상 분포하는 전형적인 온대성식물이다. 우리나라에는 앵초, 키가 큰 큰앵초, 작은 설앵초, 좀앵초 등이 습기가 좀 있는 반그늘진 곳에 자생하고 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0111-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0111-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0111-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 초보자용');
--행 12
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (12,'브리세아','Painted feather','Vriesea spp.','만족','브리세아 중 소형종이며 꽃가게에서 흔히 볼 수 있는 관엽식물이다. 새 꼬리의 깃털처럼 생긴 빨간 꽃이 예쁘고 오래 가지만 잎의 앞부분 양편으로 흰 띠가 들어 있는 것이 특징이다.','꽃을 보기 힘든 추운 계절에 실내 분위기를 싱그럽게 해주니 겨울동안의 관상용으로 매우 우수한 식물이다. 실내에서 반 그늘진 곳에도 잘 어울리는 식물이다.','브리세아는 특히 광을 좋아하기 때문에 하루 4시간 이상은 햇볕을 쪼여줘야 한다. 광이 부족하면 웃자라고 잎의 무늬가 약해지며 꽃이 잘 안 피기도 한다. 아열대 원산이라 12℃이상은 되어야 하며 19-27℃정도가 생육적온이다. 꽃이 지면서 모주가 죽을 때 옆에서 흡지들이 나오는데 이걸 떼어 번식한다. 습기가 많은 것을 싫어하므로 약간 건조한 듯 하게 관리하는 것이 좋다.','세계적으로 약 5~6종 정도가 남아메리카 고원지대에 분포하고 있는 종으로, 다른 식물들에 비해 비교적 소가족이다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0112-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0112-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0112-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'초보자용 물을 자주 주지 않아도 되는');
--행 13
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (13,'치자나무','Common gardenia','Gardenia jasminoides var. grandiflora','청결','꽃의 모양과 색, 향기가 모두 일품이며, 특히 꽃향기가 진하다. 늦은 가을에 빨갛게 익는 열매는 대표적인 우리 전통 염료이다.','추위에 약해 주로 남부지방의 울타리나 정원용으로 이용되고 있으나 요즘은 분화용으로도 시판되고 있다. 봄에 어린잎이 나올 때 보면 연한 녹색으로 먼지 같은 작은 솜털이 있는데, 점차 자라면서 없어지고 어른 잎이 되면서 표면에서 반짝반짝 광택이 난다. 열매는 약용으로도 쓰이고 염색할 때 쓰는 염료로도 쓰이는데, 풍류를 아는 옛 사람들은 술잔에 이 치자의 꽃잎을 띄워 마시거나 아예 꽃잎으로 술을 담가 먹기도 했다.','남부지역이 고향으로 0℃ 이하에서는 월동하기 힘들며 자라기에 적합한 온도는 16-30℃범위이다. 가정에서 기를 때는 햇볕이 잘 드는 곳이 좋으며 자주 환기시며 주는 것이 좋다. 열매가 빨갛게 물들면 따서 말린 뒤 과육을 제거하고 씨앗을 잘 골라 바로 파종하거나 노천에 매장해 두었다가 이듬에 뿌린다. 이른 봄이나 여름에 삽목으로 번식하기도 한다.','꼭두서니과 치자나무속 식물로 내한성이 약해 중부지역에서는 노지에서 자라지 못한다. 치자나무는 우리나라에서 자연 상태에서 자라기는 하지만 원래부터 우리나라에 있던 식물은 아니다. 무궁화와 마찬가지로 외국에서 들어와 이 땅에 적응한 귀화식물의 하나이며 원산지는 중국 · 대만 · 일본이다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0113-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0113-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0113-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'나무 꽃 향이 좋은');
--행 14
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (14,'카틀레야','Cattleya','Cattleya spp.','당신은 미인입니다.','국내에서는 기호도가 그리 높지 않지만 서양에서는 많이 이용되며 고급 란으로 취급되고 있다. 꽃말에서처럼 꽃 중의 여왕이라고 불릴 정도로 매우 화려하며 꽃이 크다. 품종에 따라 진한 향기가 있는 것들도 있다.','꽃색이 흰, 노랑, 자주, 밤색 등 다양하며 향기나는 것도 있다. ‘코사지의 난’이라 불릴 정도로 외국에서는 무도회 때 가슴이나 어깨를 장식하는 용도로 인기가 있다. 꽃 수명이 길어 분화용 또는 절화용으로 이용되는 것이 보통이며, 실내정원 같은 곳에서 걸이용으로도 이용되기도 한다.','뿌리가 호기성이라 화분에 심지 않고 나무껍질 같은 곳에 붙여 벽에 걸고 늘 습기를 유지해 주며 기르는 것이 보통이다. 가정에서 기를 때 특히 중요한 것은 물을 자주 스프레이 해 줌으로서 습도 유지가 잘 되도록 하는 것과 환기에 유의해야 하며 여름철에는 고온과 강한 직사광선을 피할 수 있도록 적절히 차광해 주는 것도 필요하다. 전문적인 생산은 포기나누기도 또는 조직배양에 의해 이뤄진다.','고향이 열대아메리카 지역으로 세계적으로 약 40종의 원종이 분포한다. 다소 건조한 해안가를 중심으로 해발 2,000m정도의 고지대에 자생하지만 종종 산악지대 작은 계곡을 따라 분포하기도 한다. 모두 상록성으로 많은 품종들이 개량되어 있으며 지금은 전 세계적으로 재배되고 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0114-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0114-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0114-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 화려한');
--행 15
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (15,'온시디움','Dancing girl','Oncidium spp.','순박한 마음','온시디움은 꽃이 발랄한 소녀들을 연상시키기도 하고 나비를 보는 듯한 착각도 들어서 보는 이의 마음을 한결 밝고 즐겁게 해주는 착생란의 일종이다. 개체의 크기와 꽃의 색이나 모양이 상당히 다양하며, 특히 초코렛색 계통은 진한 향기가 난다.','꽃 모양이 좋고 개화기가 여름철로 대부분 난들이 출하되는 시기와 달라 키가 작고 향기가 나는 것들은 분화용으로 키가 크고 꽃이 많이 달리는 것들은 절화용으로 길러볼만한 식물이다.','씨앗으로 번식할 수도 있으나 실생묘들은 균일도가 낮기 때문에 조직배양묘를 이용하는 것이 보통이다. 햇빛을 좋아하지만 원산지에서는 큰 나무그늘에서 자라는 식물이니 만큼 한여름의 직사광선은 피하고 통풍이 잘되어야 한다.','난초과에 속하며 아메리카 대륙 전체에 분포하지만 중남미의 해발 1500-1700m 고지대에서 집중적으로 자생한다. 세계적으로 약 750종이 분포하는데 수천종의 교배종도 있다. 나무에 착생하여 뿌리로 공기호흡을 한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0115-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0115-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0115-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 화려한');
--행 16
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (16,'크로커스 ','Crocus','Crocus spp. ','믿는 기쁨, 청춘의 기쁨','겨울이 지나 나무의 새잎이 나오기도 전에 피어나는 꽃 중의 하나로 키는 아주 작다. 꽃대의 모양이 실처럼 생겼다 해서 그리이스어인 Krokos(실)에서 나온 이름이다. 정원에 심어두면 이른 봄에 살며시 꽃대를 내밀며 바로 탐스러운 꽃들이 핀다. 가을에 심어 봄에 꽃을 보는 대표적인 가을에 심는알뿌리류이다.','이른 봄에 화사한 꽃을 피워주기 때문에 화단 또는 분화용으로 흔히 이용된다. 꽃은 컵처럼 생겼으며 꽃색은 백, 크림, 노랑, 황금, 라벤다, 자주색 등 다양하며 봄에 피는 것과 가을에 피는 것이 있다. 자연 상태에서는 봄에 피는 것이 많으며 매우 이른 봄에 피는데 우리 자생화인 복수초처럼 눈 덮인 땅 위에서 꽃이 눈을 뚫고 나오는 종도 있다. 꽃 모양이 예쁘고 꽃이 지고 난 뒤 나오는 잎들도 정연하여 인기가 높아 현재는 무수히 많은 원예품종들이 개발되어 있다.','크로커스는 섬유질로 덮인 알뿌리로 번식한다. 꽃이 지고 나면 잎이 나오고 본격적으로 알뿌리가 비대되는데, 가을에 알뿌리를 나눠 심는다. 노지에서 월동할 수 있으며 자라기 적합한 온도는 16-25℃로 햇볕이 잘 드는 곳이 좋으며 여름 고온기에는 그늘을 지어줘 시원하게 해 줘야 한다.','크로커스는 붓꽃과에 속하는 알뿌리식물이다. 거의 모든 색깔의 꽃이 있으며, 꽃 모양이 매우 우수하다. 전 세계적으로 약 80종이 분포한다. 유럽 중남부, 북아프리카, 중동, 아시아 중부 및 중국 서부 등이 자생지이다. 숲이나 덤불 초원 등 해안가로부터 고산에 이르기까지 널리 서식한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0116-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0116-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0116-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'꽃 화려한');
--행 17
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (17,'벤자민고무나무','Benjamine tree, Weeping fig','Ficus benjamina ','변덕쟁이','벤자민고무나무는 집들이나 사무실 개업에 빠지지 않고 들어가는 선물이다. 그만큼 우리나라에서 많이 쓰는 관엽류 중의 하나로 실내관상용으로 인기가 좋다. 잎이 풍성하고 늘어지는 모양의 가지가 이채롭다.','잎의 질감이 좋아 실내식물로 주로 이용되는 품목 중의 하나이다. 원예종으로 잎에 무늬가 있는 것도 많다. 햇볕에 조금 민감하여 조금만 햇볕이 강하면 잎이 황변하며 너무 약하면 도장하거나 약해진다. 잎의 질감이 좋아 가지를 잘라 꽃꽂이용으로 쓰기도 한다.','자생지에서는 20m 이상까지 크게 자라는 나무이나 분화용으로는 2m정도면 좋다. 겨울에도 12℃이상은 되어야 월동할 수 있다. 반 그늘진 곳을 좋아하는데, 여름에는 괜찮지만 봄, 가을에는 햇볕이 지나치면 잎이 타기도 한다.','뽕나무과에 속하는 상록성 관목으로 인도, 동남아시아 등 열대나 아열대의 습기가 많은 곳이 고향이다. 전 세계적으로 800종이 분포하며 품종도 많이 개발되어 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0117-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0117-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0117-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 18
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (18,'팔손이','Japanese aralia','Fatsia japonica','분별, 비밀','손이 여덟 개가 아니고 넓은 잎이 여덟 갈래로 갈라져 있는 것처럼 보여서 팔손이나무라 불린다. 언뜻 보면 외국의 관엽식물로 착각하기 쉬우나 우리 자생식물 중의 하나로 거제도나 남해 등 남부 해안가 주변이 고향이다. 잎 모양이 넓어 시원한 느낌을 주며 상록성이기 때문에 연중 관상이 가능하다. 음이온 발생도 많아 실내식물로 우수하다.','남부지역에서는 노지월동이 가능하여 고급 정원수로 쓰인다. 중부나 중부 이부에서는 실내 관엽식물로 자리잡아가고 있다. 팔손이나무는 생장속도가 빠르고 음지나 추위에도 어느 정도 강하며, 공해에 매우 강하기 때문에 잘 개발하면 쓰임새가 아주 많은 식물이다. 잎은 한방에서 거담제로 쓰이기도 한다.','씨앗이나 삽목번식 모두 가능하다. 씨앗은 4-5월에 따자마자 뿌린다. 삽목은 봄이나 여름 장마철에 하면 쉽게 뿌리가 내린다. 분화용으로 가정에서 기를 때 분화용토는 물빠짐이 좋아야 한다.','두릅나무과에 속하는 상록성관목이다. 세계적으로 아시아 동부지역에 단 2-3종이 분포하는 희귀종이지만 아열대의 온화한 기후조건에서 생육이 왕성하기 때문에 널리 자생한다. 우리나라의 남부지역이나 제주도에 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0118-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0118-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0118-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 19
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (19,'아프리칸 바이올렛','African violet','Saintpaulia ionantha','작은사랑','흔히 바이올렛이라고 줄여 부르는데, 아프리칸바이올렛이 정식명칭이다. 환경만 맞으면 일년 내내 꽃이 피기 때문에 꽃이 없는 한 겨울에도 사랑받는 식물이다. 실내 원예식물 중 가장 많은 사랑을 받고 있다 해도 과언이 아니다. 꽃 색상이 매우 다양하고 꽃모양도 갖가지다.','식물이 작아 아래 작은 공간에서도 얼마든지 기르기 쉽다. 다양한 종류를 모둠으로 모아 심어도 좋고, 집안 어디에나 잘 어울리는데 특히 거실창가나 부엌 및 사무실 창틀에 놓으면 보기 좋다.','잎에 물기가 닿지 않도록 하는 것이 중요하고 노지에서는 무더운 여름과 추운 겨울을 피해야 한다. 잎, 줄기, 뿌리가 매우 부드러우니 옮겨 심을 때는 주의해야 한다. 씨앗번식도 가능하며 잎꽂이로 간단하고 쉽게 번식할 수 있다.','제스나리아과에 속하는 영년생 상록성 초본류이다. 세계적으로 약 20종이 있는데, 주로 아프리카 동부의 바위틈이나 강가 등에 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0119-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0119-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0119-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 20
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (20,'우단일엽 ','Felt fern','Pyrrosia linearifolia','작은 평화','잎에 갈색의 폭신한 털이 나 있어서 바위에 펼쳐진 모습을 보면 마치 비로드를 깔아놓은 듯하다. 우단일엽이란 우단같은 일엽초라는 뜻이다. 이런 저런 야생화들을 찾아 골짜기를 헤매다 보면 어느 정도 습기가 유지되는 바위나 고목의 겉에 일엽초들이 붙어있는 모습을 아직은 흔히 볼 수 있다.','양치식물 중의 하나로 착생란처럼 바위나 나무줄기 겉에 붙어서 자라기 때문에 석부작이나 목부작 같은 분경용으로 적합하다. 실내조경용으로 베란다 화단의 바위틈 같은 곳에 붙여도 관상가치가 뛰어나다.','일정한 습도유지가 중요하다. 추위에는 강한 편으로 가온이 잘 안되는 베란다에서도 월동이 가능하다. 잎 이면에 붙어있는 포자를 떼어 번식한다. 별도로 대량번식을 위해서는 조직배양실에서 포자를 체계적으로 배양(포자낭→전엽체→포자체→식물체)하여야 한다.','고사리과의 상록성 양치식물이다. 세계적으로 약 100종이 분포하는데 아메리카 대륙과 아시아 동부의 온대지역에 주로 자생한다. 우리나라에는 한 종이 자생하는데 전국의 바위나 나무에 붙어 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0120-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0120-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0120-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 21
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (21,'파초','Japanese fiber banana ','Musa basjoo','기다림','뿌리줄기 끝에서 나오는 잎이 사방으로 점점 퍼지면서 길게 자란다. 잎은 밝은 녹색을 띠며 그물무늬가 평행을 이룬다. 언뜻 보면 바나나 잎을 닮아 여름동안 청량감을 더해주며 밝은 연초록의 잎은 이국적인 느낌을 주는 관엽식물이다.','제주와 남부지역에서는 정원이나 화단에서, 그 밖의 지역에서는 실내정원에 심거나 화분에 심어 관엽으로 이용한다. 정원에 심어 놓으면 한여름에 무척 보기 좋다.','파초류는 야자처럼 흡지(根莖)로 번식하는 것이 보통이며 남부지역에서는 노지월동이 가능하다. 꽃은 여름에 피는데 잎속에서 꽃대가 자라나오며 잎처럼 생긴 포안에 15개정도의 꽃이 바나나처럼 두 줄로 달리며 꽃이 핀 뒤 이 포는 떨어진다. 온실에서 분화용으로 기를 때는 분화용토가 좋아야 하며, 충분한 광선이 필요하지만 한 여름에는 어느 정도 차광이 필요하다. 봄부터 여름까지는 물을 자주 줘야 하며 한 달에 한번씩 액비를 공급한다. 겨울동안에도 습기를 충분히 있어야한다.','파초과에 속하는 여러해살이 풀이다. 지구상에 약 40종이 분포하는 상록성으로 인도 북동부, 방글라데시, 아시아 남동부, 일본, 호주 북부지역에 이르기까지 다양하게 분포한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0121-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0121-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0121-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 22
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (22,'호랑가시나무','Holley tree','Ilex spp.','보호',' 크리스마스카드를 보면 빨간 열매를 달고 잎 끝이 가시 같은 잎으로 장식된 그림이 빠지지 않고 나온다. 바로 서양호랑가시나무인데, 오늘의 꽃은 우리나라에 자생하는 호랑가시나무이다. 잎 끝이 뾰족한 것이 호랑이의 발톱을 닮아서 붙여진 것으로 보이며, 꽃말도 가시가 침입자로부터 자신을 지킨다는 뜻에서 붙여진 듯 하다.','자생 호랑가시나무는 추위에 약한 편이지만 개량된 원예종들은 전국에서 월동이 가능하다. 연중 늘 푸르게 빛나는 잎도 좋지만 특히 가을철 이후 달리는 빨간 열매가 일품이다. 봄에 짧게 피는 하얀 꽃도 향기가 좋다. 정원수, 가로수, 생울타리용으로 보편화 되어 있다. 실내용으로 가시때문에 가정에서는 제한적이만 사무실 같은 공공건물 같은 곳에서는 이용할 수 있다. 잎, 열매, 줄기, 뿌리 모두 약재로 쓰이기도 한다.','가을에 씨앗을 따서 과육을 잘 씻어낸 다음 땅속에 묻어두었다가 이듬해 봄에 뿌린다. 삽목은 3-4월에 전년도에 나온 가지를 이용하거나 6-7월 장마철에 당년에 나온 가지를 10-15cm로 잘라 삽목하면 된다. 정원에서 기를 때는 햇볕이 잘 들고 물빠짐이 좋아야 한다.','감탕나무과의 상록성 관목이다. 세계적으로 약 400종이 있으며 상록성은 물론 낙엽성인 것들도 많다. 우리나라에 나는 것으로 유사종은 주로 제주에 자생하는 먼나무, 꽝꽝나무, 좀꽝꽝나무 등이 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0122-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0122-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0122-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 23
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (23,'사스레피나무 ','Japanese eurya','Eurya japonica','당신은 소중합니다.','오래 전 졸업식이나 입학식의 꽃다발 장식에 빠지지 않고 쓰였던 나무이다. 지금은 축하나 조문용 화환을 만들 때 뒷 바탕을 장식하는 상록소재로 거의 빠짐없이 들어간다.','잎이 상록성으로 연중이용이 가능하여 꽃꽂이나 화환제작 등에 가지나 줄기를 잘라 이용한다. 특히 일본에서는 제례용 소재로 많이 이용된다. 잎 모양이 좋고 열매도 아름다워 남부에서는 정원수로도 훌륭한 소재이다.','씨앗은 가을에 익은 다음 따서 열매의 과육을 제거 후 바로 뿌리거나 땅에 묻었다가 이듬해 뿌린다. 삽목은 4월 하순경에 새로 나온 가지를 꺾꽂이하여 번식한다.','차나무과에 속하는 상록성 관목이다. 세계적으로 아시아 동남부 및 태평양 열도를 중심으로 약 70종이 자생한다. 우리나라에서는 주로 제주지역이나 남부해안가의 낮은 산에서 자생한다. 유사종으로 우묵사스레피나무, 거제도에 나는 섬사스레피나무, 잎이 넓고 두꺼운 떡사스레피나무 등이 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0123-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0123-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0123-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 24
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (24,'굴거리나무','Sloumi','Daphniphyllum macropodum','자리를 내어줌','제주에 가면 아래로 젖혀진 넓고 긴 잎과 빙둘러난 잎자루가 유난히 붉은 빛을 띠어 꽃으로 착각하기도 하는 나무가 있는데 바로 굴거리나무이다. 길고 두꺼운 잎이 마치 고무나무와도 비슷하여 혹시 외래종인가 하는 착각도 든다.','굴거리나무가 자랄 수 있는 북방한계선은 내륙으로는 내장산, 해안으로는 안면도까지 자생한다. 잎모양과 잎자루가 특이하고 키가 그리 크지 않아 월동이 가능한 지역에서는 정원수로 훌륭한 소재다. 화분에 심어 실내 분화용으로 이용해도 어느 외국 관엽류 못지않게 아름다우며 잎을 잘라 꽃꽂이 소재로도 쓴다.','씨앗을 가을에 따서 과육을 벗긴 다음 바로 뿌려도 되고 땅속에 묻어 두었다가 이른 봄에 뿌린다. 6-7월 장마철 공기 중에 습도가 높을 때 삽목해도 된다. 옮겨심기를 싫어하는 편으로 봄에 새잎이 나오기 전이나 장마철에 옮겨주면 그나마 피해를 덜 받는다.','대극과에 속하는 상록성 관목으로 아시아 동부지역을 중심으로 15종이 분포한다. 우리나라는 내장산과 남부해안 및 제주지역에 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0124-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0124-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0124-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 25
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (25,'산호수 ','Ardisia','Ardisia pusilla ','용감, 총명','바다의 보석이라 일컫는 ‘산호’가 있는데, 산호 중에도 으뜸으로 치는 것이 적색산호라 한다. 산호수의 빨간 열매가 이 바다의 산호를 꼭 닮아서 붙여진 이름인 듯 하다.','잎이 늘 녹색을 띠며 줄기가 옆으로 뻗는 특성이 있고 가을에 맺는 열매가 일품으로 분화용이나 실내조경용으로 많이 이용되고 있다. 특히 키가 작고 분지력이 좋은 데다 실내 그늘진 곳에서도 잘 자란다. 일본에서 인기가 많아 분화용으로 수출하기도 한다.','자생식물 중 광도가 낮은 곳에서도 잘 자라는 몇 안 되는 식물 중의 하나이다. 추위에 약해 중부이북에서는 바깥에서 월동이 어렵다. 반 그늘진 곳을 좋아하며 어느 정도 습기유지가 중요하다. 씨앗을 12-4월에 따서 과육을 제거하고 뿌리거나 봄 또는 여름에 줄기를 삽목하면 잘 번식한다.','자금우과에 속하는 상록소관목이다. 지구상에 250종이 자생하는데 아시아, 호주, 아메리카 전역의 습기가 있는 산림에서 분포한다. 우리나라에는 자금우, 왕자금우, 산호수, 백량금 등 4종이 남부해안과 도서 및 제주지역의 낮은 산 그늘에서 자란다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0125-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0125-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0125-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 26
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (26,'꽝꽝나무','Japanese holly','Ilex crenata','굳은 의지','제주의 어느 식물원에 갔을 때 수형이 잘 다듬어진 울타리가 있어 회양목인줄 알았는데 자세히 보니 꽝꽝나무였다. 산굼부리 오르는 길 양쪽의 탄탄한 생울타리도 바로 이 꽝꽝나무로 만들어진 것이다. 나무줄기가 단단하여 붙여진 이름과 꽃말인 듯싶다.','나무가 단단하고 작으며 잎은 물론 까만 열매도 아름다워 남부지역에서는 정원수로 많이 심으며, 나무의 조직이 치밀하고 자라는 속도가 느리기 때문에 수형잡기가 쉬워 분재로도 쓴다. 재질이 튼튼하여 조각재로 쓰이고 열매는 염료식물로도 이용된다.','햇볕이 잘 들고 거름기가 좀 있는 정원이면 기르는데 별 어려움이 없다. 열매가 검은 색으로 익으면 늦지 않게 따서 과육을 물로 씻어낸 다음 바로 뿌리거나 땅에 묻어두었다가 봄에 뿌린다. 삽목은 4월에는 전년도에 자란 가지를, 6-7월에는 당년도에 자란 가지를 잘라 삽목하면 쉽게 뿌리를 내린다.','감탕나무과에 속하는 상록활엽관목이다. 세계적으로 약 400종이 있으며 상록성은 물론 낙엽성인 것들도 많다. 우리나라에 나는 것으로 유사종은 주로 제주에 자생하는 먼나무, 호랑가시나무, 좀꽝꽝나무 등이 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0126-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0126-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0126-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 27
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (27,'구상나무','Korean fir','Abies koreana','기개','구상나무는 세계적으로 우리나라에만 나는 한국특산식물이다. 잎도 잘 떨어지지 않고 수형이 좋아 외국에서는 크리스마스트리로 가장 귀하게 여기는 나무이기도 하다. 한라산 윗세오름이나 덕유산 정상에 가보면 고사목들이 서 있는데 기품이 당당하다. 주목은 살아서 천년 죽어서 천년이라 했는데, 구상나무는 살아서 백년 죽어서 백년이라 한다.','수형이 곧고 피라미드 모양의 층을 이루며 자라는 습성이 있어 일반 가정의 정원수로는 물론 공원, 학교 등 조경용으로 흔히 이용된다. 봄에 나오는 연녹색의 신초나 가을에 맺는 원통형의 열매도 관상가치가 뛰어나다. 나무 결이 좋고 튼튼하여 가구재, 건축재로도 쓰인다. 우리가 관상용으로 품종을 개발해 외국으로 수출할 수 있는 가능성이 큰 식물이다.','추위나 음지에도 강하고 맹아력도 좋아 전국 어디서든 잘 자란다. 반면에 공해에 약하고 생장은 좀 늦은 편이다. 너무 건조하지 않고 배수가 잘되는 토양이 좋고 반그늘, 양지 모두 좋지만 여름철 무더위는 조심해야 한다. 10월에 잘 익은 열매를 따서 바로 뿌리거나 땅에 묻어두었다 봄에 뿌린다.','소나무과에 속하는 상록성 침엽수이다. 열매의 색깔에 따라 붉은구상나무, 검은구상나무, 푸른구상나무가 있으며 구상나무와 비슷한 것으로 분비나무와 젓나무가 있다. 한라산, 덕유산, 지리산 등지의 해발 1000m 이상에서 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0127-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0127-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0127-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 28
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (28,'프리뮬러','English primrose','Primula spp.','소년시절의 희망','프리뮬러는 원래 추운 곳에서 자라는 식물이라 긴 겨울을 나야 이듬해 봄에 꽃이 탐스럽게 핀다. 많은 원예품종들이 나와 있으며 화원에서 1-2월부터 볼 수 있어 우리에게 봄이 왔음을 가장 먼저 알려주는 꽃이다.','꽃이 작고 모양이 아름다우며 꽃색도 종류가 많아 분화용으로 가장 많이 쓰인다. 식물원이나 공원에서 화단용으로도 흔히 식재한다. 암석정원에서도 바위틈에 심으면 매우 관상가치가 높다.','프리뮬러는 원래 고향이 고산지역이라 햇볕을 좋아하고 내한성이 강해 우리나라 어디서든 월동은 가능하지만 여름철 더위에는 매우 약하다. 따라서 여름철에는 그늘을 만들어 시원하게 유지해 주는 것이 중요하다. 씨앗으로 번식하기도 하지만 가을철에 포기나누기를 해도 된다. 요즘은 개량 품종들은 일년생으로 F1품종들이 많아 봄에 화원에서 몇 개 구입하여 다양한 종류를 관상하는 것도 바람직하다.','앵초과에 속하는 다년생 초본류로 종류가 500 여종이나 되는 대가족식물이다. 아시아 북부의 한대지방이나 유럽의 북반구 쪽에서 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0128-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0128-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0128-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 29
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (29,'괭이눈 ','Golden saxifraga','Chrysosplenium grayanum ','순간의 아름다움','씨앗 모양이 고양이의 눈을 닮았다 하여 괭이눈이라 불린다. 꽃이 필 때 꽃 주변의 잎들이 노랗게 변해서 햇볕을 받으면 황금과도 같은 빛을 발하지만 번식이 끝나고 나면 잎은 원래의 색을 찾는다. 산수국, 백당나무나 포인세티아처럼 꽃가루를 받아 수정되어 후손을 남기려는 생존전략으로 보인다. 그러고 보면 다들 살아갈 궁리는 확실히 하고 태어난다.','키가 작고 모양이 정연하여 분화용이나 지피식물로 이용이 가능하다. 자생지 환경이 반 그늘진 곳으로 습기가 충분한 곳이므로 실내나 지피용으로 이용할 때는 어느 정도의 햇볕과 충분한 수분유지가 중요할 것으로 생각된다. 어린 순을 나물로 쓰기도 한다.','아직 일반적으로 재배되는 품목이 아니다. 자생지 환경을 고려한다면 여름철에 통풍과 환기에 유의하면서 고온다습한 환경에 특히 조심해야 할 것으로 보인다. 씨앗을 뿌려서 번식해도 좋으며 포기나누기도 잘 된다.','범의귀과에 속하는 다년생 초본류이다. 우리나라에는 산괭이눈, 애기괭이눈, 선괭이눈, 털괭이눈, 가지괭이눈 등 10종이 자생한다. 사진은 선괭이눈이다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0129-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0129-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0129-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 30
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (30,'칼세올라리아','Slipperwort, Pocketbook Plant','Calceolaria spp.','나의 재산을 드립니다.','주머니처럼 생긴 꽃들이 넓은 잎 뒤로 붙어 있어서 속칭 주머니꽃이라고도 불린다. 꽃대가 큰 것부터 아주 작아서 바닥에 기는 것까지 다양하며 꽃 모양도 둥근 원형이 있는가 하면 난처럼 혀를 내밀고 있는 것들도 있다. 키가 아주 작은 편이며 작은 꽃들이 다닥다닥 붙어 공처럼 송이를 형성하고 있다.','가을에 파종하는 일년 초화류로 흔히 재배되고 있으며, 봄과 여름사이의 화단용으로 많이 쓰이고 있고 다른 초화분화처럼 3-4월에 분화로도 많이 이용된다.','이 식물은 원래 고향이 고산지대라 15-20℃의 중저온에서 잘 자라며 고온에서는 연약해지고 특히 30℃이상으로 올라가면 생육이 현저히 나빠진다. 온도가 너무 낮아도 안되는데 0℃이하로 내려가면 동해를 받는다.','현삼과의 한해살이, 두해살이, 여러해살이풀 및 관목류까지 있는 식물로 지구상에 약 300종 이상이 있는 대가족 식물이다. 원산지는 남아프리카의 페루나 칠레의 안데스산맥에서 뉴질랜드 등지이다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0130-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0130-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0130-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 31
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (31,'네펜데스','Monkey cup, Tropical pitcher plant','Nepenthes spp.','끈기','애완식물로 불려지는 벌레잡이식물들이 온, 오프라인 모두 동호회들이 많이 생기면서 인기를 끌고 있다. 잎 끝에 주머니처럼 생긴 포충낭이 달려 있어 벌레가 들어오면 분해 흡수하여 영양분을 섭취한다. 벌레잡는 주머니는 꽃말처럼 벌레가 주머니 안으로 들어올 때까지 한없이 끈기를 갖고 기다릴 줄 안다. 벌레가 들어오면 조용히 뚜껑을 닫는다.','식충식물이라는 측면에서 새로운 분화식물로 자리잡아 가고 있다. 초, 중등학교 교육용으로도 좋으며, 가정용은 물론 사무실 실내식물로 이용범위가 점차 늘어가고 있다. 중고등학교 학생들의 선물용으로도 허브 다음으로 인기다.','많은 식충식물의 자생지가 산성토양 또는 산성을 띠는 습지인데 여기서는 식물이 성장에 필요한 질소화합물을 뿌리를 통해 흡수할 수 없어 벌레를 먹이로 이용하여 질소급원으로 이용하는 것이다. 물은 습도유지가 중요하여 저면으로 주는 게 좋고 여름철에는 스프레이를 자주해준다.','벌레잡이통풀과에 속하는 여러해살이 풀이다. 세계적으로 약 70종이 있는데 인도네시아, 뉴기니아, 마다가스카르등 주로 열대지방에서 절벽이나 나무를 타고 오르며 자생한다. 원예종으로는 무수히 많은 품종들이 나오고 있다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0131-1.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0131-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0131-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--행 32
INSERT INTO PLANT_INFO (PNO, PKORNAME, PENGNAME, PSCTNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3, PTEMPERATURE, PHUMIDITY, PSUNSHINE, PWATERCYCLE, PFLOWERINGTIME, PVIEW, PTAG) VALUES (32,'남천','Heavenly bamboo','Nandina domestica','지속적인 사랑','잎 모양이 대나무 잎을 닮아 중국에서는 남천죽이라고도 부른다. 늦은 가을부터 붉게 물든 잎과 붉은 열매가 좋다. 정원에 심겨 있으면 겨울에도 볼거리를 줄 수 있는 식물이다.','남부지방에서는 화단이나 정원용으로 흔히 심기며, 중부이북에서는 실내정원을 만드는데 빠지지 않고 쓰인다. 최근 실내관엽용으로 키 작은 품종들이 나오고 있다. 지구온난화 현상으로 중부지방에서도 지역에 따라 바깥에서 겨울을 날수 있어 정원용으로 확대 이용될 전망이다.','가을에 온도가 낮아지면 잎색은 변하지만 낙엽으로 떨어지진 않는다. 사질토양에서는 자라기 힘드나 건조에는 강한 편이다. 씨앗번식도 가능하나 발아하는데 시간이 오래 걸리기 때문에 삽목이 좋다.','매자나무과에 속하는 상록성 관목이다. 세계적으로 단 1속 1종이 있으며,  잎에 무늬가 있는 반엽종도 있다. 중국, 인도, 일본의 산이나 계곡에 자생한다.','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0201-3.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0201-2.jpg','http://www.nihhs.go.kr/user/AttachFiles/FLOWF/SFLOWF/0201-1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO USERS (
    uNo, 
    uIds, 
    uPw, 
    uRole,
    uName, 
    uNickname, 
    uPhone, 
    uAddr, 
    uBirth, 
    uStatus, 
    uSignIn,
    uUpDate
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'twoswim98@naver.com', 
    '1234', 
    '관리자', 
    '이수영',
    NULL,
    NULL, 
    NULL,
    NULL,
    DEFAULT,
    DEFAULT,
    DEFAULT
);

SELECT * FROM BOARD;
SELECT * FROM REPLY;
SELECT * FROM USERS;

SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_LIKE;
SELECT * FROM PLANT_INFO;



COMMIT;