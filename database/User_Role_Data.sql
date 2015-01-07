INSERT INTO `role` (`version`, `authority`, `description`) VALUES (0, 'ROLE_ADMIN', '管理员');
INSERT INTO `role` (`version`, `authority`, `description`) VALUES (0, 'ROLE_SALES', '销售人员');
INSERT INTO `role` (`version`, `authority`, `description`) VALUES (0, 'ROLE_SALES_MANAGER', '销售经理');
INSERT INTO  `role` (`version`, `authority`, `description`) VALUES (0, 'ROLE_GENERAL_MANAGER', '总经理');

INSERT INTO `user`
(`version`,`password_expired`,`account_expired`,`account_locked`,`enabled`,
`created_date`,`last_updated_date`,`password`,`realname`,`username`)
VALUES
(0,0,0,0,1,now(),now(),'$2a$10$mkbTvcj8lGCBj1D1wXIkm.MLtvNklsRP35kPBI7F0YtDOLdnSyN.C','管理员','admin');

INSERT INTO `user_role` (`role_id`, `user_id`) VALUES (1, 1);
