DROP DATABASE  IF EXISTS bms;

CREATE DATABASE IF NOT EXISTS bms DEFAULT CHARACTER SET utf8;

USE bms;
DROP TABLE IF EXISTS bms_borrow;

DROP TABLE IF EXISTS bms_users;

CREATE TABLE IF NOT EXISTS bms_users(
  id BIGINT(20) primary key auto_increment,
  userCode varchar(50) not null UNIQUE KEY COMMENT '用户名',
  password varchar(30) not null COMMENT '密码',
  userName VARCHAR(50) not null COMMENT '姓名',
  gender INT(3) not null DEFAULT 0 COMMENT '性别,0 保密，1 男，2 女',
  birthday DATE not null COMMENT '生日',
  email varchar(80) COMMENT '邮箱',
  phone varchar(30) not null COMMENT '手机号',
  idType INT(3) NOT NULL DEFAULT 0 COMMENT '证件类型 0 中国大陆',
  idCard VARCHAR(30) NOT NULL COMMENT '身份证号',
  userType INT(3) NOT NULL DEFAULT 0 COMMENT '用户类型 0普通用户 99管理员',
  registerTime TIMESTAMP default CURRENT_TIMESTAMP COMMENT '注册日期'
);

INSERT INTO bms_users(userCode,password,userName,gender,birthday,email,phone,idType,idCard,userType) VALUES
('chenxin','123456','陈鑫',2,'2000-01-01','123456@163.com','13112345671',0,'612345677890012345',99),
('chenlin','123456','陈林',1,'2000-01-01','123456@163.com','13212345672',0,'612345678910111213',0),
('zhanglong','123456','张龙',1,'2000-01-01','123456@163.com','13312345673',0,'6124569873210012',99),
('chensuhang','123456','陈苏杭',1,'2000-01-01','123456@163.com','13512345675',0,'6124569873210013',99),
('dusilong','123456','杜思龙',1,'2000-01-01','123456@163.com','13212345676',0,'612345678910111222',99),
('luzhenqinag','123456','逯振强',1,'2000-01-01','123456@163.com','13212345677',0,'612345678910111288',99),
('hewei','123123123','何伟',1,'1991-02-09','hewei@163.com','13916542168',0,'140221199102095861',0),
('wangxu','85695111','王旭',1,'1986-09-18','wangxu@163.com','13495846230',0,'256951198609189847',0),
('suning','88888888','苏宁',2,'1996-10-22','suning@163.com','13784569201',0,'21648952199610225896',0),
('hetian','efaeea','何田',2,'1995-07-19','hetian@163.com','13965400214',0,'36845015199507195468',0),
('gurenjie','eiogj','顾仁杰',1,'1999-05-05','gurenjie@163.com','13754210210',0,'259982199905051452',0),
('liyunfei','fjeioaj','李云飞',1,'1988-11-08','liyunfei@163.com','13495423682',0,'368452198811081549',0),
('wangpengfei','8795462','王鹏飞',1,'1991-07-21','wangpengfei@163.com','13785426524',0,'245685199107215465',0),
('wangxiqian','89716548','王希茜',2,'1999-01-19','wangxiqian@163.com','13965421020',0,'698746199901195422',0),
('yuanbo','111111','袁博',1,'1998-12-23','yuanbo@163.com','13934215420',0,'140220199212235103',0),
('xufangyuan','ewqe1223','许方圆','2','1996-04-11','xufangyuan@163.com','13754268208',0,'146521199604111682',0);

DROP TABLE IF EXISTS bms_books;

CREATE TABLE bms_books(
  id BIGINT(20) PRIMARY KEY auto_increment,
  bookCode VARCHAR(50) NOT NULL COMMENT '书的编码',
  bookName VARCHAR(100) NOT NULL COMMENT '书的名称',
  type INT(3) DEFAULT 0 COMMENT '类型',
  language VARCHAR(50) NOT NULL DEFAULT '中文' COMMENT '书的语言',
  author VARCHAR(50) NOT NULL COMMENT '作者',
  press VARCHAR(80) NOT NULL COMMENT '出版社',
  pubTime DATE NOT NULL COMMENT '出版日期',
  createBy VARCHAR(50) NOT NULL COMMENT '创建人',
  createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP  COMMENT '创建时间',
  modifyBy VARCHAR(50) COMMENT '修改人',
  modifyTime DATETIME COMMENT '修改时间',
  inventory BIGINT(20) NOT NULL DEFAULT 0 COMMENT '库存量',
  inventoryCopy BIGINT(20) NOT NULL DEFAULT 0 COMMENT '库存量-副本',
  introduction VARCHAR(3000) COMMENT '书的简介'
);

INSERT INTO bms_books
(bookCode,bookName,type,language,author,press,pubTime,createBy,createTime,inventory,inventoryCopy,introduction) VALUES
('I561444140','红楼梦',2,'中文','曹雪芹','知识出版社','2015-04-01','李雷','2019-06-12 12:23:20',20,20,'《红楼梦》原名《石头记》。全书以贾、史、王、薛四大家族的兴衰为背景，以贾宝玉与林黛玉、薛宝钗的恋爱经历及其他红楼女子的生活经历为中心线索，真实而深入地描写了日益丰富的人性与生存环境（由社会制度、家族结构和礼教等构成）的冲突、人性被压抑的痛苦以及要求人性解放而进行的挣扎或反抗，生动地塑造了贾宝玉、林黛玉、薛宝钗、王熙凤、尤三姐、晴雯等许多具有鲜明个性的艺术形象。作品规模宏大，结构完整严密，白话运用纯熟自如，具有高度的思想性和卓越的艺术成就，达到了中国古代长篇小说中写实主义的顶峰。'),
('ISS156845','羊脂球',1,'中文','莫泊桑','中国人民出版社','1999-07-12','逯振强','2019-10-11 14:03:54',10,10,'《羊脂球》是法国作家莫泊桑创作的中篇小说。《羊脂球》是他的成名作，也是他的代表作之一。《羊脂球》以1870—1871年普法战争为背景。通过代表当时法国社会各阶层的10个人同乘一辆马车逃往一个港口的故事，形象地反映出资产阶级在这场战争中所表现出的卑鄙自私和出卖人民的丑恶嘴脸。'),
('ISS388000','复活',1,'中文','列夫·托尔斯泰','中国人民出版社','1991-12-03','逯振强','2019-10-11 14:14:21',10,10,'《复活》是俄国作家列夫·托尔斯泰创作的长篇小说，首次出版于1899年。该书取材于一件真实事件，主要描写男主人公聂赫留朵夫引诱姑妈家女仆玛丝洛娃，使她怀孕并被赶出家门。后来，她沦为妓女，因被指控谋财害命而受审判。男主人公以陪审员的身份出庭，见到从前被他引诱的女人，深受良心谴责。他为她奔走伸冤，并请求同她结婚，以赎回自己的罪过。上诉失败后，他陪她流放西伯利亚。他的行为感动了她，使她重新爱他。但为了不损害他的名誉和地位，她最终没有和他结婚而同一个革命者结为伉俪'),
('ISS458456','Java从入门到精通',3,'中文','国家863中部软件孵化器','人民邮电出版社','2010-04-04','逯振强','2019-10-11 14:22:45',5,5,'《Java从入门到精通》是人民邮电出版社于 2010年出版的图书，由国家863中部软件孵化器主编。以零基础讲解为宗旨，深入浅出地讲解Java的各项技术及实战技能。本书从初学者角度出发，通过通俗易懂的语言、丰富多彩的实例，详细介绍了使用Java语言进行程序开发应该掌握的各方面技术。'),
('ISS546825','C++从入门到精通',3,'中文','国家863中部软件孵化器','人民邮电出版社','2010-04-26','逯振强','2019-10-11 14:32:11',5,5,'《C++从入门到精通》是2010年人民邮电出版社出版的书籍，作者是徐兆元。本书介绍了C++发展历史、开发环境等基本知识和程序设计方法技巧，是一本计算机专业相关人员学习参考用书。'),
('ISBN854265','草房子',4,'中文','曹文轩','中国人民出版社','1997-05-30','逯振强','2019-10-11 14:38:14',3,3,'《草房子》讲述了发生在20世纪60年代初江南水乡一个动人动情的童年故事，少男少女之间毫无瑕的纯情，不幸少年与厄运拼博的悲怆与优雅，在死亡体验中对生命的深切而优美的领悟，大人们之间扑朔迷离且又充满诗情画意的情感纠葛。'),
('ISBN168547','西游记',2,'中文','吴承恩','中国人民出版社','1969-02-21','逯振强','2018-10-11 14:43:30',10,10,'《西游记》是中国古代第一部浪漫主义章回体长篇神魔小说。现存明刊百回本《西游记》均无作者署名。清代学者吴玉搢等首先提出《西游记》作者是明代吴承恩 [1]  。这部小说以“唐僧取经”这一历史事件为蓝本，通过作者的艺术加工，深刻地描绘了当时的社会现实。全书主要描写了孙悟空出世及大闹天宫后，遇见了唐僧、猪八戒、沙僧和白龙马，西行取经，一路降妖伏魔，经历了九九八十一难，终于到达西天见到如来佛祖，最终五圣成真的故事。'),
('IBSN351214','天才在左疯子在右',4,'中文','高铭','武汉大学出版社','2010-02-10','逯振强','2019-10-11 14:47:10',5,5,'《天才在左疯子在右》以访谈录的形式记载了生活在另一个角落的人群（精神病患者、心理障碍者等边缘人）深刻、视角独特的所思所想，让人们可以了解到疯子亦或是天才真正的内心世界。'),
('ISBN146528','史记',6,'中文','司马迁','南京大学出版社','1968-12-14','逯振强','2019-10-11 14:54:01',10,10,'《史记》最初称为《太史公》或《太史公记》、《太史记》，是西汉史学家司马迁撰写的纪传体史书，是中国历史上第一部纪传体通史，记载了上至上古传说中的黄帝时代，下至汉武帝太初四年间共3000多年的历史。太初元年（前104年），司马迁开始了《太史公书》即后来被称为《史记》的史书创作。该著作前后经历了14年，才得以完成。'),
('ISBN136849','水浒传',2,'中文','施耐庵','中国人民出版社','1978-03-31','逯振强','2019-10-11 15:00:51',10,10,'《水浒传》通过描写梁山好汉反抗欺压、水泊梁山壮大和受宋朝招安，以及受招安后为宋朝征战，最终消亡的宏大故事，艺术地反映了中国历史上宋江起义从发生、发展直至失败的全过程，深刻揭示了起义的社会根源，满腔热情地歌颂了起义英雄的反抗斗争和他们的社会理想，也具体揭示了起义失败的内在历史原因。'),
('ISBN147741','变色龙',5,'中文','契诃夫','清华出版社','1884-05-09','逯振强','2019-10-11 15:06:11',10,10,'《变色龙》是俄国作家契诃夫早期创作的一篇短篇小说。契诃夫在该作中栩栩如生地塑造了虚伪逢迎、见风使舵的巡警奥楚蔑洛夫，当他以为小狗是普通人家的狗时，就扬言要弄死它并惩罚其主人。当他听说狗主人是席加洛夫将军时，一会儿额头冒汗，一会儿又全身哆嗦。通过人物如同变色龙似的不断变化态度的细节描写，有力地嘲讽了沙皇专制制度下封建卫道士的卑躬屈膝的嘴脸。'),
('ISS145850','栀子花开',5,'中文','厉平','北京出版社','2012-12-01','逯振强','2019-10-11 15:11:57',5,5,'《栀子花开》是由厉平多年的文学心血汇聚而成，书中主要分为5大部分，分别是昨日香韵，手有余香，拈花一笑，花开花落，含苞欲放等组成。作者本身是扬州时报教育新闻部的主任，所以文字功力很好，但是文风体现了女性作家的柔婉，细腻，书中的精神都是反映社会，亲情，友情，爱情等真善美的东西，个别文章也针对了一些不好的社会现象进行了婉转的抨击。'),
('ISBN2546208','安娜·卡列尼娜',4,'俄语','列夫·托尔斯泰','俄国出版社','1877-06-01','逯振强','2019-10-11 15:16:41',10,10,'《安娜·卡列尼娜》讲述了贵族妇女安娜追求爱情幸福，却在卡列宁的虚伪、渥伦斯基的冷漠和自私面前碰得头破血流，最终落得卧轨自杀、陈尸车站的下场。庄园主列文反对土地私有制，抵制资本主义制度，同情贫苦农民，却又无法摆脱贵族习气而陷入无法解脱的矛盾之中。矛盾的时期、矛盾的制度、矛盾的人物、矛盾的心理，使全书在矛盾的漩涡中颠簸。这部小说是新旧交替时期紧张惶恐的俄国社会的写照。'),
('ISS3533264','朱自清散文集',6,'中文','朱自清','西苑出版社','2006-07-01','逯振强','2019-11-10 15:20:03',5,5,'作为一位散文作家，朱自清以他独特的美文艺术风格，为中国现代散文增添了瑰丽的色彩，为建立中国现代散文全新的审美特征，树立了“白话美文的模范”。朱自清是一位文化多面手，他给后人留下了近200万字的文学遗产。然而，他对中国现代新文学的突出贡献，无疑则是他所擅长的散文小品。他继承了中国古典文学的优秀传统，在中西文化交流的大背景之下，创造了具有中国民族特色的散文体制和风格。'),
('ISS354269','冰心散文集',6,'中文','冰心','上海古籍出版社','2002-04-01','逯振强','2019-10-11 15:27:00',5,5,'冰心散文集是冰心的著作中的重要的著作，她的著作分四个部分，一是：往事，二是：寄小读者，三是：关于女人，四是：冰心自传。冰心写的散文风格清新，文体秀美。在散文《寄小读者》中，冰心通过描写她儿时幼稚的欢乐和天真的泪水，尽情歌颂母爱、童真、大自然和祖国。'),
('ISBN1490097','朝花夕拾',4,'中文','鲁迅','中国人民出版社','1986-01-29','逯振强','2019-10-11 15:33:51',10,10,'《朝花夕拾》原名《旧事重提》，是现代文学家鲁迅的散文集，收录鲁迅于1926年创作的10篇回忆性散文， [1]  1928年由北京未名社出版，现编入《鲁迅全集》第2卷。此文集作为“回忆的记事”，多侧面地反映了作者鲁迅青少年时期的生活，形象地反映了他的性格和志趣的形成经过。前七篇反映他童年时代在绍兴的家庭和私塾中的生活情景，后三篇叙述他从家乡到南京，又到日本留学，然后回国教书的经历；揭露了半封建半殖民地社会种种丑恶的不合理现象，同时反映了有抱负的青年知识分子在旧中国茫茫黑夜中，不畏艰险，寻找光明的困难历程，以及抒发了作者对往日亲友、师长的怀念之情。'),
('ISS625485','重构',1,'英语','Jay Fields','机械工业出版社','2010-08-26','逯振强','2019-10-11 15:41:03',5,5,'《重构（Ruby版）》是2010年机械工业出版社出版的图书，作者是Jay Fields，Shane Harvi和Martin Fowler。');

DROP TABLE IF EXISTS bms_types;

CREATE TABLE IF NOT EXISTS bms_types(
id int(3) primary key auto_increment,
typeName varchar(50) not null);

insert into bms_types(typeName) values
('其它'),
('名著'),
('科技'),
('小说'),
('散文'),
('文集');

CREATE TABLE IF NOT EXISTS bms_borrow(
id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
borrowTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '借阅时间',
limitLength BIGINT(20) NOT NULL DEFAULT 10 COMMENT '借阅时限',
returnTime DATETIME COMMENT '应当归还时间',
actualTime DATETIME COMMENT '实际归还时间',
bookId BIGINT(20) NOT NULL COMMENT '用户关联书籍信息',
FOREIGN KEY(bookId) REFERENCES bms_books(id) ON DELETE CASCADE ON UPDATE CASCADE,
userId BIGINT(20) NOT NULL COMMENT '用于关联用户信息',
FOREIGN KEY(userId) REFERENCES bms_users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS bms_return;

CREATE TABLE IF NOT EXISTS bms_return(
id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
bookCode VARCHAR (100) NOT NULL COMMENT '归还书籍编码',
bookName VARCHAR (100) NOT NULL COMMENT '归还书籍名称',
borrowTime DATETIME COMMENT '借阅时间',
actualTime DATETIME COMMENT '实际归还时间',
overStatus INT(3) NOT NULL COMMENT '超时状态  1未超时 2超时 3未归还',
userId BIGINT(20) NOT NULL COMMENT '用于关联用户信息'
);
