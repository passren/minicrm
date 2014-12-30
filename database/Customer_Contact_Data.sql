INSERT INTO `minicrm-dev`.`customer`
(`version`, `address`, `category_id`,`classification_id`,`create_user_id`,`created_date`,`last_update_user_id`,
`last_updated_date`,`name`,`remark`,`source_id`,`status_id`, `city_id`)
VALUES
(1, '北京朝阳区', 1, 8, 2, now(), 2, now(), '北京个体户', '', 15, 19, 1);
INSERT INTO `minicrm-dev`.`customer`
(`version`, `address`, `category_id`,`classification_id`,`create_user_id`,`created_date`,`last_update_user_id`,
`last_updated_date`,`name`,`remark`,`source_id`,`status_id`, `city_id`)
VALUES
(1, '北京海淀区双清路289号东升大厦', 6, 9, 1, now(), 2, now(), '北京特拉特科技有限公司', '', 16, 19, 1);
INSERT INTO `minicrm-dev`.`customer`
(`version`, `address`, `category_id`,`classification_id`,`create_user_id`,`created_date`,`last_update_user_id`,
`last_updated_date`,`name`,`remark`,`source_id`,`status_id`, `city_id`)
VALUES
(1, '辽宁沈阳解放大道2号特拉特大楼', 2, 10, 2, now(), 2, now(), '北京特拉特科技天津分公司', '', 17, 19, 2);
INSERT INTO `minicrm-dev`.`customer`
(`version`, `address`, `category_id`,`classification_id`,`create_user_id`,`created_date`,`last_update_user_id`,
`last_updated_date`,`name`,`remark`,`source_id`,`status_id`, `city_id`)
VALUES
(1, '北京朝阳区三元东桥', 2, 11, 2, now(), 1, now(), '康明斯中国投资有限公司', '', 18, 19, 1);

INSERT INTO `minicrm-dev`.`contact`
(`version`,`cellphone`,`create_user_id`,`created_date`,`customer_id`,`department`,`deskphone`,`email`,`last_update_user_id`,
`last_updated_date`,`name`,`position`,`remark`,`status_id`)
VALUES
(1,'18766325674',2,now(),1,null,null,null,2,now(),'唐骏飞',null,null,19);
INSERT INTO `minicrm-dev`.`contact`
(`version`,`cellphone`,`create_user_id`,`created_date`,`customer_id`,`department`,`deskphone`,`email`,`last_update_user_id`,
`last_updated_date`,`name`,`position`,`remark`,`status_id`)
VALUES
(1,'(+86)15678984536',2,now(),1,null,null,'tt@sina.com',2,now(),'糖糖',null,null,19);
INSERT INTO `minicrm-dev`.`contact`
(`version`,`cellphone`,`create_user_id`,`created_date`,`customer_id`,`department`,`deskphone`,`email`,`last_update_user_id`,
`last_updated_date`,`name`,`position`,`remark`,`status_id`)
VALUES
(1,null,2,now(),1,null,'010-65443347',null,2,now(),'菲戈','战略',null,19);
