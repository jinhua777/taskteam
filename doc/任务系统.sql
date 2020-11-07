CREATE TABLE `user` (

`uuid` bigint NOT NULL,

`user_name` varchar(50) NULL,

`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册日期',

`qywx_corpid` varchar(255) NULL COMMENT '用户所属企业corpid',

`qywx_userid` varchar(255) NULL COMMENT '用户企业微信id',

`tellphone` varchar(20) NULL COMMENT '手机',

`email` varchar(50) NULL COMMENT '邮箱',

`is_del` int NOT NULL DEFAULT 0 COMMENT '是否删除',

PRIMARY KEY (`uuid`) 

);



CREATE TABLE `task` (

`id` bigint NOT NULL,

`parent_id` bigint NULL COMMENT '父节点',

`task_name` varchar(50) NOT NULL COMMENT '任务名',

`content` text NULL COMMENT '任务内容',

`start_date` date NOT NULL COMMENT '开始日期',

`deadline` date NOT NULL COMMENT '截止日期',

`progress` decimal(3,2) NULL COMMENT '进度',

`tag` int NOT NULL DEFAULT 0 COMMENT '标签',

`ins_date` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',

`ins_user_id` bigint NOT NULL COMMENT '创建者id',

`principle_id` bigint NOT NULL COMMENT '负责人id',

`participant` varchar(2000) NULL COMMENT '参与者',

`status` int NOT NULL COMMENT '状态',

PRIMARY KEY (`id`) 

);



CREATE TABLE `comment` (

`id` bigint NOT NULL,

`task_id` bigint NOT NULL DEFAULT -1 COMMENT '任务id',

`comment` text NULL COMMENT '评论内容',

`create_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',

`user_id` bigint NOT NULL DEFAULT -1 COMMENT '评论人id',

`is_comment` int NOT NULL DEFAULT 0 COMMENT '是否真正评论',

`doc_id` bigint NULL COMMENT '文件id',

PRIMARY KEY (`id`) 

);



CREATE TABLE `document` (

`id` bigint NOT NULL COMMENT '创建日期',

`doc_name` varchar(255) NOT NULL COMMENT '文件名',

`doc_url` varchar(255) NOT NULL COMMENT '文件地址',

`create_date` datetime NULL,

PRIMARY KEY (`id`) 

);



CREATE TABLE `message` (


);





ALTER TABLE `task` ADD CONSTRAINT `fk_ins_user_task` FOREIGN KEY (`ins_user_id`) REFERENCES `user` (`uuid`);

ALTER TABLE `task` ADD CONSTRAINT `fk_principle_user_task` FOREIGN KEY (`principle_id`) REFERENCES `user` (`uuid`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);

ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_doc` FOREIGN KEY (`doc_id`) REFERENCES `document` (`id`);

