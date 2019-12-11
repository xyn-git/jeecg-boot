-- --------------------------------------------------------
-- 主机:                           221.204.213.108
-- 服务器版本:                        10.2.26-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 jeecgboot.biz_ict_construction_contract 结构
CREATE TABLE IF NOT EXISTS `biz_ict_construction_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同编号',
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `project_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `it_amount` double DEFAULT NULL COMMENT 'IT协议金额',
  `it_rate` int(11) DEFAULT NULL COMMENT 'IT协议税率',
  `deivce_amount` double DEFAULT NULL COMMENT '设备协议金额',
  `device_rate` int(11) DEFAULT NULL COMMENT '设备协议税率',
  `signing_date` date DEFAULT NULL COMMENT '合同签订时间',
  `party_b` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '乙方单位名',
  `party_b_linkman` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '乙方联系人',
  `party_b_tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '乙方联系电话',
  `party_b_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '乙方单位地址',
  `project_manager` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目经理',
  `project_team` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目组',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT项目施工合同';

-- 正在导出表  jeecgboot.biz_ict_construction_contract 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `biz_ict_construction_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ict_construction_contract` ENABLE KEYS */;

-- 导出  表 jeecgboot.biz_ict_contract 结构
CREATE TABLE IF NOT EXISTS `biz_ict_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `project_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `it_amount` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '协议金额-IT',
  `it_rate` int(11) DEFAULT NULL,
  `device_amount` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '协议金额-设备',
  `device_rate` int(11) DEFAULT NULL,
  `signing_date` date DEFAULT NULL COMMENT '合同签订日期',
  `party_a` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '甲方单位',
  `party_a_linkman` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '甲方联系人',
  `party_a_tel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '甲方联系电话',
  `party_a_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '甲方地址',
  `organizer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承办部门',
  `trade` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属行业',
  `account_manager` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发展人/客户经理',
  `account_manager_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发展人编码',
  `project_manager` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目经理',
  `project_manager_tel` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目经理联系电话',
  `project_status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目状态',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT合同';

-- 正在导出表  jeecgboot.biz_ict_contract 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `biz_ict_contract` DISABLE KEYS */;
INSERT INTO `biz_ict_contract` (`id`, `ict_contract_number`, `project_name`, `it_amount`, `it_rate`, `device_amount`, `device_rate`, `signing_date`, `party_a`, `party_a_linkman`, `party_a_tel`, `party_a_address`, `organizer`, `trade`, `account_manager`, `account_manager_number`, `project_manager`, `project_manager_tel`, `project_status`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(75, '附件', '太原市财贸学校等19所学校平安校园“一键式”报警系统服务项目', '469300.0', NULL, '0', NULL, NULL, '附件', NULL, NULL, NULL, '政企客户事业部', '科教文卫', '马丽娜', '1900958221', '王建谱', NULL, '神盾技术', 'CU12-1402-2019-002627', 'admin', '2019-10-09 08:46:56', 'admin', '2019-10-11 08:58:11'),
	(76, 'CU12-1402-2018-004336', '太原煤炭气化（集团）有限责任公司空调维保项目', '120000.0', NULL, '0', NULL, NULL, '太原煤炭气化（集团）有限责任公司', NULL, NULL, NULL, '政企客户事业部', '能源', '张丽仙', '1901313995', '侯永璐', NULL, '博力特', 'CU12-1402-2018-004948', 'admin', '2019-10-11 11:23:29', 'admin', '2019-10-11 12:05:45'),
	(77, 'CU12-1402-2019-000930', '太原市邮政快递专用电动三轮车管理平台建设项目', '692641.0', NULL, '0', NULL, NULL, '山西省快递协会', NULL, NULL, NULL, '政企客户事业部', '交通物流', '杨苗苗', NULL, '李嘉慧', NULL, '君耀金辉', 'CU12-1402-2018-001396', 'admin', '2019-10-09 08:46:56', 'admin', '2019-10-11 08:58:11'),
	(78, 'CU12-1402-2019-002771', '山西交通控股集团有限公司太原高速公司分公司机房改造及无线覆盖项目', '36000.0', NULL, '0', NULL, NULL, '山西交通控股集团有限公司太原高速公路分公司', NULL, NULL, NULL, '商企营销中心', '万柏林', '张永丽', '15536806927', '韩俊芳', NULL, '通阳科技', 'CU12-1402-2018-002771', 'admin', '2019-10-11 11:23:29', 'admin', '2019-10-11 12:05:45'),
	(79, '2014-376-80-67-D-1', '太原市公共安全视频图像信息系统网络运营商服务项目（一期）', '2449200.0', NULL, '0', NULL, NULL, '太原市公安局', NULL, NULL, NULL, '政企客户事业部', '公安消防营销中心', '高燕', '1901294694', '杨剑', NULL, '通信实业', 'CU12-1402-2018-003738', 'admin', '2019-10-11 11:28:32', 'admin', '2019-10-11 12:05:45'),
	(80, '2014-53-8-14-J-1', '太原市公共安全视频图像信息系统网络运营商服务项目（二期）', '2784000.0', NULL, '0', NULL, NULL, '太原市公安局', NULL, NULL, NULL, '政企客户事业部', '公安消防营销中心', '高燕', '1901294694', '杨剑', NULL, '通信实业', 'CU12-1402-2018-003739', 'admin', '2019-10-09 08:46:56', 'admin', '2019-10-11 08:58:11'),
	(81, 'CU12-1001-2017-001064', '太原市迎泽区委政法委员会与中国联合网络通信有限公司“雪亮”工程建设平台项目', '0', NULL, '0', NULL, NULL, '太原市迎泽区委政法委员', NULL, NULL, NULL, '政企客户事业部', '检法司', '杨毅 ', '1901322735', NULL, NULL, NULL, NULL, 'admin', '2019-10-11 11:23:29', 'admin', '2019-10-11 12:05:45'),
	(82, 'CU12-1402-2017-004096', '阳曲县公安局公共视频建设联网工程（雪亮工程）项目', '0', NULL, '0', NULL, NULL, '阳曲县公安局', NULL, NULL, NULL, '阳曲县分公司', '政府', '王浩', '1904293731', NULL, NULL, NULL, NULL, 'admin', '2019-10-09 08:46:56', 'admin', '2019-10-11 08:58:11');
/*!40000 ALTER TABLE `biz_ict_contract` ENABLE KEYS */;

-- 导出  表 jeecgboot.biz_ict_cost_pay 结构
CREATE TABLE IF NOT EXISTS `biz_ict_cost_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `it_cost_pay` double DEFAULT NULL COMMENT 'IT成本金额税前',
  `it_rate` double DEFAULT NULL COMMENT 'IT成本税率',
  `device_cost_pay` double DEFAULT NULL COMMENT '设备成本金额税前',
  `device_rate` double DEFAULT NULL COMMENT '设备成本税率',
  `cost_reporting_date` date DEFAULT NULL COMMENT '支付日期',
  `reported_account_month` int(11) DEFAULT NULL COMMENT '报支帐期（月）例201901',
  `cost_reporting_ratio` int(11) DEFAULT NULL COMMENT '支付比例',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT成本实际支付明细表';

-- 正在导出表  jeecgboot.biz_ict_cost_pay 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `biz_ict_cost_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ict_cost_pay` ENABLE KEYS */;

-- 导出  表 jeecgboot.biz_ict_cost_reporting 结构
CREATE TABLE IF NOT EXISTS `biz_ict_cost_reporting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `it_cost` double DEFAULT NULL COMMENT 'IT成本金额税前',
  `it_rate` double DEFAULT NULL COMMENT 'IT成本税率',
  `device_cost` double DEFAULT NULL COMMENT '设备成本金额税前',
  `device_rate` double DEFAULT NULL COMMENT '设备成本税率',
  `cost_reporting_date` date DEFAULT NULL COMMENT '报支日期',
  `reported_account_month` int(11) DEFAULT NULL COMMENT '报支帐期（月）例201901',
  `cost_reporting_ratio` int(11) DEFAULT NULL COMMENT '报支比例',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT成本报支明细表';

-- 正在导出表  jeecgboot.biz_ict_cost_reporting 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `biz_ict_cost_reporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ict_cost_reporting` ENABLE KEYS */;

-- 导出  表 jeecgboot.biz_ict_overdue_arrears 结构
CREATE TABLE IF NOT EXISTS `biz_ict_overdue_arrears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `it_overdue_arrears` double DEFAULT NULL COMMENT 'IT欠费金额税前',
  `it_rate` double DEFAULT NULL COMMENT 'IT收入税率',
  `device_overdue_arrears` double DEFAULT NULL COMMENT '设备欠费金额税前',
  `device_rate` double DEFAULT NULL COMMENT '设备收入税率',
  `received_payments_account_month` int(11) DEFAULT NULL COMMENT '欠费帐期（月）例201901',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT欠费明细表';

-- 正在导出表  jeecgboot.biz_ict_overdue_arrears 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `biz_ict_overdue_arrears` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ict_overdue_arrears` ENABLE KEYS */;

-- 导出  表 jeecgboot.biz_ict_received_payments 结构
CREATE TABLE IF NOT EXISTS `biz_ict_received_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `it_received_payments` double DEFAULT NULL COMMENT 'IT回款金额税前',
  `it_rate` double DEFAULT NULL COMMENT 'IT收入税率',
  `device_received_payments` double DEFAULT NULL COMMENT '设备回款金额税前',
  `device_rate` double DEFAULT NULL COMMENT '设备收入税率',
  `received_date` date DEFAULT NULL COMMENT '回款日期',
  `received_payments_account_month` int(11) DEFAULT NULL COMMENT '回款冲销帐期（月）例201901',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT汇款明细表';

-- 正在导出表  jeecgboot.biz_ict_received_payments 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `biz_ict_received_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ict_received_payments` ENABLE KEYS */;

-- 导出  表 jeecgboot.biz_ict_reported_income 结构
CREATE TABLE IF NOT EXISTS `biz_ict_reported_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ict_contract_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ICT合同编号',
  `it_reported_income` double DEFAULT NULL COMMENT 'IT报收金额税前',
  `it_rate` double DEFAULT NULL COMMENT 'IT收入税率',
  `device_reported_income` double DEFAULT NULL COMMENT '设备报收金额税前',
  `device_rate` double DEFAULT NULL COMMENT '设备收入税率',
  `reported_date` date DEFAULT NULL COMMENT '报收日期',
  `reported_account_month` int(11) DEFAULT NULL COMMENT '报收帐期（月）例201901',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ICT报收明细表';

-- 正在导出表  jeecgboot.biz_ict_reported_income 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `biz_ict_reported_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ict_reported_income` ENABLE KEYS */;

-- 导出  表 jeecgboot.busi_group_custormer 结构
CREATE TABLE IF NOT EXISTS `busi_group_custormer` (
  `id` varchar(36) NOT NULL COMMENT 'id',
  `department` varchar(50) NOT NULL COMMENT '部门',
  `unit` varchar(50) NOT NULL COMMENT '单元',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `employee_code` varchar(20) NOT NULL COMMENT '员工编码',
  `position` varchar(40) NOT NULL COMMENT '岗位',
  `employee_type` varchar(20) NOT NULL COMMENT '用工形式',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Department of Government and Enterprise Customers\r\n政企客户部人员表';

-- 正在导出表  jeecgboot.busi_group_custormer 的数据：~188 rows (大约)
/*!40000 ALTER TABLE `busi_group_custormer` DISABLE KEYS */;
INSERT INTO `busi_group_custormer` (`id`, `department`, `unit`, `name`, `employee_code`, `position`, `employee_type`, `remark`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	('1', '政企', '工业制造行业营服中心', '高海峰', '0618562', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('10', '政企', '公安消防行业营服中心', '李彦', 'SX0002967', '客户经理【集客】', '紧密型外包', '8月从能源调动至公安行业', NULL, NULL, NULL, NULL),
	('100', '政企', '政企客户事业部', '张宇', '0617576', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('101', '政企', '政企客户事业部', '刘晓燕', '0618293', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('102', '政企', '政企客户事业部', '杨秀慧', '0110000', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('103', '政企', '政企客户事业部', '王慧君', '0618146', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('104', '政企', '政企客户事业部', '薛梅', '0618386', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('105', '政企', '政企客户事业部', '翟婷', '0873441', '后台【集客】', '合同制', '8月新调入', NULL, NULL, NULL, NULL),
	('106', '政企', '政企客户事业部', '朱晓丽', '0109829', '后台【集客】', '合同制', '8月新调入', NULL, NULL, NULL, NULL),
	('107', '政企', '政企客户事业部', '王蕾', '0618385', '后台【集客】', '合同制', '8月新调入', NULL, NULL, NULL, NULL),
	('108', '政企', '政企客户事业部', '崔健', '0111876', '客户经理【集客】-特殊', '合同制', '特殊人员-客户经理岗位', NULL, NULL, NULL, NULL),
	('109', '政企', '政企客户事业部', '郭雅君', '0111333', '下基层', '合同制', '', NULL, NULL, NULL, NULL),
	('11', '政企', '环保行业营服中心', '杜玮', '0734041', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('110', '政企', '政企客户事业部', '弓晓丽', '0112036', '下基层', '合同制', '', NULL, NULL, NULL, NULL),
	('111', '政企', '政企客户事业部', '郭晓卫', '0617948', '下基层', '合同制', '', NULL, NULL, NULL, NULL),
	('112', '政企', '政企客户事业部', '姚苏霞', '0618273', '下基层', '合同制', '', NULL, NULL, NULL, NULL),
	('113', '政企', '政企客户事业部', '张宴东', '0109842', '支撑【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('114', '政企', '政企客户事业部', '王伟', 'SX0001968', '支撑【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('115', '政企', '政企客户事业部', '郑琳', 'SX0014282', '支撑【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('116', '政企', '政企客户事业部', '赵亮', '0112619', '支撑【集客】', '合同制', '7月上岗', NULL, NULL, NULL, NULL),
	('117', '政企', '政企客户事业部', '张亚丽', 'SX0010874', '支撑【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('118', '政企', '政企客户事业部', '卢向男', 'SX0012609', '支撑【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('119', '政企', '政企客户事业部', '康丽娟', 'SX0001496', '支撑【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('12', '政企', '环保行业营服中心', '李锋', '0109561', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('120', '政企', '政企客户事业部', '任凤凤', 'SX0001623', '支撑【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('121', '政企', '政企客户事业部', '李静虹', 'SX0001970', '支撑【集客】-省委机要局营业', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('122', '政企', '政企客户事业部', '智洁', 'SX0001737', '支撑【集客】-省委机要局营业', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('123', '商企', '太原晋源商客营销中心', '王莉', '0109573', '承包人【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('124', '商企', '太原晋源商客营销中心', '寇成龙', '0879739', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('125', '商企', '太原晋源商客营销中心', '徐晋春', '0112369', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('126', '商企', '太原晋源商客营销中心', '关冬菊', 'SX0001285', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('127', '商企', '太原晋源商客营销中心', '原智鑫', 'SX0001549', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('128', '商企', '太原晋源商客营销中心', '王江花', '0616930', '支撑【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('129', '商企', '太原南城商客营销中心', '雷震', '0111811', '承包人【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('13', '政企', '环保行业营服中心', '郭甲林', '0109762', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('130', '商企', '太原南城商客营销中心', '李英亮', '0900418', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('131', '商企', '太原南城商客营销中心', '师晓庆', '0892163', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('132', '商企', '太原南城商客营销中心', '杜新平', 'SX0012994', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('133', '商企', '太原南城商客营销中心', '王志凯', 'SX0003057', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('134', '商企', '太原南城商客营销中心', '常萍', 'SX0010875', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('135', '商企', '太原南城商客营销中心', '代晋瑞', 'SX0001561', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('136', '商企', '太原南城商客营销中心', '孙丽君', 'SX0002224', '客户经理【商客】', '紧密型外包', '8月预提交辞职报告', NULL, NULL, NULL, NULL),
	('137', '商企', '太原南城商客营销中心', '王芝燕', 'SX0002280', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('138', '商企', '太原南城商客营销中心', '张丽娟', 'SX0012612', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('139', '商企', '太原南城商客营销中心', '周艳玲', 'SX0001982', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('14', '政企', '环保行业营服中心', '任晋凤', '0110385', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('140', '商企', '太原南城商客营销中心', '王华龙', '0879729', '团队长【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('141', '商企', '太原南城商客营销中心', '马超', 'SX0001118', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('142', '商企', '太原南城商客营销中心', '侯高明', 'SX0002362', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('143', '商企', '太原万柏林商客营销中心', '贾琦', '0112569', '承包人【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('144', '商企', '太原万柏林商客营销中心', '郭文婷', '0879712', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('145', '商企', '太原万柏林商客营销中心', '苗春福', '0109873', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('146', '商企', '太原万柏林商客营销中心', '刘涛', '0109718', '客户经理【商客】', '合同制', '8月调动至驻地网', NULL, NULL, NULL, NULL),
	('147', '商企', '太原万柏林商客营销中心', '骆萍', 'SX0002243', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('148', '商企', '太原万柏林商客营销中心', '王果仙', 'SX0001917', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('149', '商企', '太原万柏林商客营销中心', '王晓琴', 'SX0001130', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('15', '政企', '检法司行业营服中心', '王秉权', '0504632', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('150', '商企', '太原万柏林商客营销中心', '阴怀程', 'SX0013333', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('151', '商企', '太原万柏林商客营销中心', '马丽', 'SX0001135', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('152', '商企', '太原万柏林商客营销中心', '张永丽', 'SX0002689', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('153', '商企', '太原小店商客营销中心', '吴亚冰', 'SX0014453', '承包人【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('154', '商企', '太原小店商客营销中心', '苏守煜', '0892193', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('155', '商企', '太原小店商客营销中心', '陈庆英', '0111810', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('156', '商企', '太原小店商客营销中心', '程丽丽', 'SX0002652', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('157', '商企', '太原小店商客营销中心', '李步朝', 'SX0015271', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('158', '商企', '太原小店商客营销中心', '李晓兰', 'SX0013001', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('159', '商企', '太原小店商客营销中心', '洛斌', 'SX0002749', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('16', '政企', '检法司行业营服中心', '杜建新', '0879716', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('160', '商企', '太原小店商客营销中心', '邢星', '0892183', '团队长【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('161', '商企', '太原小店商客营销中心', '徐伟', 'SX0001851', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('162', '商企', '太原小店商客营销中心', '王忠元', '0111245', '支撑【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('163', '商企', '太原杏花岭商客营销中心', '王晓玲', '0879741', '承包人【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('164', '商企', '太原杏花岭商客营销中心', '秦艳波', 'SX0017747', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('165', '商企', '太原杏花岭商客营销中心', '王华', 'SX0001212', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('166', '商企', '太原杏花岭商客营销中心', '周丽琴', 'SX0002793', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('167', '商企', '太原杏花岭商客营销中心', '庄秀娟', 'SX0001988', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('168', '商企', '太原杏花岭商客营销中心', '郭鹏燕', 'SX0002869', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('169', '商企', '太原杏花岭商客营销中心', '岳铭', 'SX0002871', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('17', '政企', '检法司行业营服中心', '杨毅', 'SX0001972', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('170', '商企', '太原杏花岭商客营销中心', '郭海龙', 'SX0001763', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('171', '商企', '太原杏花岭商客营销中心', '李晶', 'SX0001945', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('172', '商企', '太原迎泽商客营销中心', '刘改玭', '0879738', '承包人【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('173', '商企', '太原迎泽商客营销中心', '段志慧', '0618466', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('174', '商企', '太原迎泽商客营销中心', '孟磊', '0110860', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('175', '商企', '太原迎泽商客营销中心', '章小博', '0618286', '客户经理【商客】', '合同制', '', NULL, NULL, NULL, NULL),
	('176', '商企', '太原迎泽商客营销中心', '侯蕊', 'SX0014761', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('177', '商企', '太原迎泽商客营销中心', '马静', 'SX0002344', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('178', '商企', '太原迎泽商客营销中心', '王慧', 'SX0002350', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('179', '商企', '太原迎泽商客营销中心', '廉伟', 'SX0001998', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('18', '政企', '检法司行业营服中心', '刘江玉', 'SX0002124', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('180', '商企', '太原迎泽商客营销中心', '梁丽丽', 'SX0001863', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('181', '商企', '太原迎泽商客营销中心', '张俊彬', 'SX0002045', '客户经理【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('182', '商企', '太原迎泽商客营销中心', '张健强', 'SX0001497', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('183', '商企', '太原迎泽商客营销中心', '王经', 'SX0001156', '团队长【商客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('184', '政企', '政企商业外包', '刘婕', '', '', '商业外包', '支撑绩效报市场部吕秀娟', NULL, NULL, NULL, NULL),
	('185', '政企', '政企商业外包', '苏红霞', '', '', '商业外包', '支撑绩效报市场部吕秀娟', NULL, NULL, NULL, NULL),
	('186', '政企', '省委商业外包', '胡颖', '', '', '商业外包', '集客标准绩效报市场部吕秀娟', NULL, NULL, NULL, NULL),
	('187', '政企', '省委商业外包', '张敏', '', '', '商业外包', '集客标准绩效报市场部吕秀娟', NULL, NULL, NULL, NULL),
	('188', '商企', '太原小店商客营销中心', '田文颖', '', '', '商业外包', '小店客户经理绩效报市场部吕秀娟', NULL, NULL, NULL, NULL),
	('19', '政企', '检法司行业营服中心', '李婧', 'SX0010883', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('2', '政企', '工业制造行业营服中心', '郑拓', '0618295', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('20', '政企', '建设维修行业营服中心', '吕庆茹', '0111323', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('21', '政企', '建设维修行业营服中心', '朱宝玮', '0110082', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('22', '政企', '建设维修行业营服中心', '庞小军', '0879747', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('23', '政企', '建设维修行业营服中心', '李晋军', 'SX0001985', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('24', '政企', '建设维修行业营服中心', '冷婧', 'SX0016646', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('25', '政企', '交通物流行业营服中心', '范臣', '0555015', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('26', '政企', '交通物流行业营服中心', '何晔', '0553998', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('27', '政企', '交通物流行业营服中心', '吴琳', 'SX0001333', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('28', '政企', '交通物流行业营服中心', '武军', 'SX0001962', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('29', '政企', '交通物流行业营服中心', '牛忠斌', 'SX0001975', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('3', '政企', '工业制造行业营服中心', '陈丽霞', '0879745', '客户经理【集客】', '合同制', '7月待岗至今', NULL, NULL, NULL, NULL),
	('30', '政企', '交通物流行业营服中心', '杨苗苗', 'SX0002961', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('31', '政企', '教育行业营服中心', '李静', '0111945', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('32', '政企', '教育行业营服中心', '王彩辉', '0109752', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('33', '政企', '教育行业营服中心', '郝志强', '0111305', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('34', '政企', '教育行业营服中心', '赵喜祥', '0111633', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('35', '政企', '教育行业营服中心', '赵丹玉', 'SX0001642', '客户经理【集客】', '紧密型外包', '8月调动至晋源商企', NULL, NULL, NULL, NULL),
	('36', '政企', '旅游消费行业营服中心', '贾娜', '0734036', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('37', '政企', '旅游消费行业营服中心', '常艳', '0001344', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('38', '政企', '政企客户事业部', '陈慧杰', '0110838', '客户经理【集客】', '合同制', '8月交回中心', NULL, NULL, NULL, NULL),
	('39', '政企', '旅游消费行业营服中心', '张立', 'SX0001363', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('4', '政企', '工业制造行业营服中心', '牛晓晨', 'SX0001318', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('40', '政企', '旅游消费行业营服中心', '刘云斌', 'SX0001397', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('41', '政企', '旅游消费行业营服中心', '郝璐', 'SX0010584', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('42', '政企', '能源行业营服中心', '赵琦', '0111251', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('43', '政企', '能源行业营服中心', '贺斌', '0112367', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('44', '政企', '能源行业营服中心', '刘艳', 'SX0001995', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('45', '政企', '能源行业营服中心', '张丽仙', 'SX0002358', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('46', '政企', '省市级政府二行业营服中心', '胡凯锋', '0111328', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('47', '政企', '省市级政府二行业营服中心', '冯少伟', '0111634', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('48', '政企', '省市级政府行业营服中心', '郝怡', '0554958', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('49', '政企', '省市级政府行业营服中心', '孙永', '0110814', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('5', '政企', '工业制造行业营服中心', '张萍', 'SX0002359', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('50', '政企', '省市级政府行业营服中心', '单晨杰', '0854468', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('51', '政企', '省市级政府行业营服中心', '赵宇佳', 'SX0002214', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('52', '政企', '医疗行业营服中心', '李亚玲', '0618285', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('53', '政企', '医疗行业营服中心', '尹伊君', '0588435', '客户经理【集客】', '合同制', '7月23日行总上交退出申请表', NULL, NULL, NULL, NULL),
	('54', '政企', '医疗行业营服中心', '张涛', 'SX0001977', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('55', '政企', '医疗行业营服中心', '刘衍斌', 'SX0002737', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('56', '政企', '医疗行业营服中心', '邹艳玲', 'SX0013311', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('57', '政企', '银行行业营服中心', '杨子剑', '0879732', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('58', '政企', '银行行业营服中心', '刘正江', '0110797', '客户经理【集客】', '合同制', '8月调动至迎泽商企', NULL, NULL, NULL, NULL),
	('59', '政企', '银行行业营服中心', '段晓霞', '0812377', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('6', '政企', '公安消防行业营服中心', '闫杰', '0734027', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('60', '政企', '银行行业营服中心', '刘慧娟', '0838117', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('61', '政企', '银行行业营服中心', '靳涛', '0879743', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('62', '政企', '银行行业营服中心', '石磊', '0892180', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('63', '政企', '银行行业营服中心', '付豪杰', 'SX0001963', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('64', '政企', '银行行业营服中心', '方亚娟', 'SX000', '客户经理【集客】', '紧密型外包', '7月19日调动至银行行业', NULL, NULL, NULL, NULL),
	('65', '政企', '证券与保险行业营服中心', '马丽娜', '0111772', '行总【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('66', '政企', '证券与保险行业营服中心', '白惠兰', '0110865', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('67', '政企', '证券与保险行业营服中心', '王清', '0111329', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('68', '政企', '证券与保险行业营服中心', '时建宏', 'SX0001964', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('69', '政企', '证券与保险行业营服中心', '孙晓娟', 'SX0001973', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('7', '政企', '公安消防行业营服中心', '王志峰', '0112556', '客户经理【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('70', '政企', '证券与保险行业营服中心', '梁爱琴', 'SX0001978', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('71', '政企', '省委机要局', '支向清', '0111645', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('72', '政企', '省委机要局', '周志俊', '0112859', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('73', '政企', '省委机要局', '尚艳林', 'SX0001868', '省委机要局-测量【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('74', '政企', '省委机要局', '张丽丽', 'SX0001859', '省委机要局-测量【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('75', '政企', '省委机要局', '吴晋莉', 'SX0001869', '省委机要局-测量【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('76', '政企', '省委机要局', '梁瑞', 'SX0001865', '省委机要局-话务【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('77', '政企', '省委机要局', '温雅娟', 'SX0001864', '省委机要局-话务【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('78', '政企', '省委机要局', '商君', 'SX0002244', '省委机要局-话务【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('79', '政企', '省委机要局', '武康', 'SX0001866', '省委机要局-线务【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('8', '政企', '公安消防行业营服中心', '王琳', 'SX0001487', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('80', '政企', '省委机要局', '李永利', 'SX0001867', '省委机要局-线务【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('81', '政企', '省委机要局', '贾晋', 'SX0001860', '省委机要局-线务【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('82', '政企', '省委机要局', '张秀红', 'SX0001858', '省委机要局-营业【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('83', '政企', '省委机要局', '张萌', 'SX0015031', '省委机要局-营业【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('84', '政企', '省政府', '孙珉', 'SX0001206', '省政府线务员【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('85', '政企', '省政府', '李勇', 'SX0001470', '省政府线务员【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('86', '政企', '市政府', '郭懋', '0110458', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('87', '政企', '市政府', '鲍江', '0112671', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('88', '政企', '市政府', '刘红琳', '0112858', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('89', '政企', '政企客户事业部', '石妍', '0109931', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('9', '政企', '公安消防行业营服中心', '高燕', 'SX0001565', '客户经理【集客】', '紧密型外包', '', NULL, NULL, NULL, NULL),
	('90', '政企', '政企客户事业部', '武智强', '0109999', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('91', '政企', '政企客户事业部', '师文秀', '0110048', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('92', '政企', '政企客户事业部', '史正义', '0110060', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('93', '政企', '政企客户事业部', '单红霞', '0111046', '后台【集客】', '合同制', '2020年3月退休', NULL, NULL, NULL, NULL),
	('94', '政企', '政企客户事业部', '李寒凝', '0111642', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('95', '政企', '政企客户事业部', '李存娥', '0111778', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('96', '政企', '政企客户事业部', '魏新月', '0112561', '后台【集客】', '合同制', '2019年8月退休', NULL, NULL, NULL, NULL),
	('97', '政企', '政企客户事业部', '苏瑞平', '0112908', '后台【集客】', '合同制', '2020年8月退休', NULL, NULL, NULL, NULL),
	('98', '政企', '政企客户事业部', '戴燕梅', '0112917', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL),
	('99', '政企', '政企客户事业部', '王晓涛', '0616530', '后台【集客】', '合同制', '', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `busi_group_custormer` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
