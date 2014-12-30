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

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_STATUS','Valid','有效',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_STATUS','Invalid','失效',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','MailComm','邮件沟通',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','TelVisit','电话访问',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','SiteVisit','现场拜访',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','Analysis','综合分析',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','Others','其他方式',NULL);