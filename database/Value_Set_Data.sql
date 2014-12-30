/*
-- Query: SELECT * FROM `minicrm-dev`.value_set
LIMIT 0, 1000

-- Date: 2014-12-26 22:14
*/
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','Per','个人',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','Gov','政府',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','Biz','金融',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','ISP','运营商',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','Pow','能源',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','Net','互联网',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','Oth','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Potential','潜在客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Need','需求客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Project','立项客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Contract','成交客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Coop','老客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Partner','合作伙伴',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','Channel','渠道客户',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','Person','独立开拓',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','Corp','公司资源',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','Leader','领导交付',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','Channel','渠道介绍',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','Signed','成交客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','Failed','失败客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','Channel','渠道建立',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','LongTerm','长期跟踪',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','InternalTrans','内部转移',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','Others','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_STATUS','Valid','有效',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_STATUS','Invalid','失效',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','MailComm','邮件沟通',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','TelVisit','电话访问',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','SiteVisit','现场拜访',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','Analysis','综合分析',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','Others','其他方式',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','CISA','CISA',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','CISSP','CISSP',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','CISP','CISP',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','CISM','CISM',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','CSSLP','CSSLP',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','COBIT','COBIT',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','ITIL','ITIL',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','内训课程','内训课程',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','咨询项目','咨询项目',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','安服项目','安服项目',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','外包项目','外包项目',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','其他','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','New','新建',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','Follow','跟进',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','Signed','签约',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','Close','关闭',NULL);