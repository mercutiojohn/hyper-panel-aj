-- 增加堆叠图占比多值显示解析属性
INSERT INTO `aj_report`.`gaea_dict`(`dict_name`, `dict_code`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('堆叠多值显示属性', 'STACK_MORESHOW_PROPERTIES', '堆叠多值属性', 'admin', '2021-04-29 10:28:15', 'admin', '2021-06-23 10:47:20', 1);

INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('STACK_MORESHOW_PROPERTIES', 'x轴字段', 'xAxis', NULL, 1, 'zh', NULL, 1, 'admin', '2021-08-20 10:31:51', 'admin', '2021-08-20 10:31:51', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('STACK_MORESHOW_PROPERTIES', 'y轴字段', 'yAxis', NULL, 1, 'zh', NULL, 6, 'admin', '2021-08-20 10:32:52', 'admin', '2021-08-20 10:32:52', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('STACK_MORESHOW_PROPERTIES', '柱状', 'bar', NULL, 1, 'zh', NULL, 7, 'admin', '2021-08-20 10:33:02', 'admin', '2021-08-20 10:33:02', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('STACK_MORESHOW_PROPERTIES', '显示值1', 'display1', NULL, 1, 'zh', NULL, 8, 'admin', '2021-08-20 10:33:11', 'admin', '2021-08-20 10:33:11', 1);
INSERT INTO `aj_report`.`gaea_dict_item`(`dict_code`, `item_name`, `item_value`, `item_extend`, `enabled`, `locale`, `remark`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `version`) VALUES ('STACK_MORESHOW_PROPERTIES', '显示值2', 'display2', NULL, 1, 'zh', NULL, 8, 'admin', '2021-08-20 10:33:11', 'admin', '2021-08-20 10:33:11', 1);