/*
-- Query: SELECT * FROM `minicrm-dev`.value_set
LIMIT 0, 1000

-- Date: 2014-12-26 22:14
*/
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC05','个人',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC10','政府',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC15','金融',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC20','运营商',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC25','能源',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC30','互联网',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CATEGORY','CC99','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC05','潜在客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC10','需求客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC15','立项客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC20','成交客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC25','老客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC30','合作伙伴',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_CLASSIFICATION','CC35','渠道客户',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','CS05','独立开拓',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','CS10','公司资源',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','CS15','领导交付',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SOURCE','CS20','渠道介绍',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','CS05','成交客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','CS10','失败客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','CS15','渠道建立',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','CS20','长期跟踪',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','CS25','内部转移',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_SITUATION','CS99','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_STATUS','CS05','有效',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('CUSTOMER_STATUS','CS10','失效',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','AT05','邮件沟通',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','AT10','电话访问',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','AT15','现场拜访',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','AT20','综合分析',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('ACTIVITY_TYPE','AT99','其他方式',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P005','CISA',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P010','CISSP',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P015','CISP',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P020','CISM',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P025','CSSLP',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P030','COBIT',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P035','ITIL',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P040','内训课程',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P045','咨询项目',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P050','安服项目',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P055','外包项目',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PRODUCT','P999','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','OS05','新建',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','OS10','跟进',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','OS15','签约',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('OPPORTUNITY_STATUS','OS20','关闭',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('IMPLEMENT_STATUS','IS05','未实施',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('IMPLEMENT_STATUS','IS10','实施中',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('IMPLEMENT_STATUS','IS15','已结束',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('RECEIPT_METHOD','RM05','现金',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('RECEIPT_METHOD','RM10','支票',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('RECEIPT_METHOD','RM15','承兑',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('RECEIPT_METHOD','RM20','电汇',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('RECEIPT_METHOD','RM25','信用证',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('RECEIPT_METHOD','RM99','其他',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('INVOICE_TYPE','IT05','收据',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('INVOICE_TYPE','IT10','增值税发票',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('INVOICE_TYPE','IT15','普通发票',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_CLASSIFICATION','SC05','普通客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_CLASSIFICATION','SC10','大客户',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_CLASSIFICATION','SC15','VIP客户',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_STATUS','SS05','新建',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_STATUS','SS10','分配中',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_STATUS','SS15','已分配',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_STATUS','SS20','处理中',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_STATUS','SS20','已解决',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('SERVICE_STATUS','SS20','关闭',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_POSITION','PP05','售前',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_POSITION','PP10','售后',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_POSITION','PP15','服务',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_POSITION','PP20','运维',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_POSITION','PP25','财务',NULL);

INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_STATUS','PS05','在职',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_STATUS','PS10','待岗',NULL);
INSERT INTO `value_set` (`category`,`code`,`code1`,`code2`) VALUES ('PERSON_STATUS','PS15','离职',NULL);