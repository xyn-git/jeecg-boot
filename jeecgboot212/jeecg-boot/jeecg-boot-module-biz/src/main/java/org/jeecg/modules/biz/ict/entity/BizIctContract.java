package org.jeecg.modules.biz.ict.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.jeecgframework.poi.excel.annotation.Excel;
import org.jeecg.common.aspect.annotation.Dict;

/**
 * @Description: biz_ict_contract
 * @Author: jeecg-boot
 * @Date:   2019-10-16
 * @Version: V1.0
 */
@Data
@TableName("biz_ict_contract")
public class BizIctContract implements Serializable {
    private static final long serialVersionUID = 1L;
    
	/**ID*/
	@TableId(type = IdType.ID_WORKER_STR)
	private java.lang.String id;
	/**ICT收入合同编号*/
	@Excel(name = "ICT收入合同编号", width = 15)
	private java.lang.String ictContractNumber;
	/**ICT支出合同编号*/
	@Excel(name = "ICT支出合同编号", width = 15)
	private java.lang.String ictConstructionContractNumber;
	/**项目名称*/
	@Excel(name = "项目名称", width = 15)
	private java.lang.String projectName;
	/**项目类别*/
	@Excel(name = "项目类别", width = 15)
	private java.lang.String projectType;
	/**协议金额-ICT*/
	@Excel(name = "协议金额-ICT", width = 15)
	private java.lang.String ictAmount;
	/**ICT税率*/
	@Excel(name = "ICT税率", width = 15)
	private java.math.BigDecimal itRate;
	/**协议金额-设备*/
	@Excel(name = "协议金额-设备", width = 15)
	private java.lang.String deviceAmount;
	/**设备税率*/
	@Excel(name = "设备税率", width = 15)
	private java.math.BigDecimal deviceRate;
	/**合同签订日期*/
	@Excel(name = "合同签订日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date signingDate;
	/**甲方单位*/
	@Excel(name = "甲方单位", width = 15)
	private java.lang.String partyA;
	/**承办部门*/
	@Excel(name = "承办部门", width = 15)
	private java.lang.String organizer;
	/**归属行业*/
	@Excel(name = "归属行业", width = 15)
	private java.lang.String trade;
	/**发展人*/
	@Excel(name = "发展人", width = 15)
	private java.lang.String accountManager;
	/**发展人编码*/
	@Excel(name = "发展人编码", width = 15)
	private java.lang.String accountManagerNumber;
	/**项目经理*/
	@Excel(name = "项目经理", width = 15)
	private java.lang.String projectManager;
	/**项目状态*/
	@Excel(name = "项目状态", width = 15)
	private java.lang.String projectStatus;
	/**备注*/
	@Excel(name = "备注", width = 15)
	private java.lang.String remark;
	/**创建人*/
	@Excel(name = "创建人", width = 15)
	private java.lang.String createBy;
	/**创建日期*/
	@Excel(name = "创建日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date createTime;
	/**更新人*/
	@Excel(name = "更新人", width = 15)
	private java.lang.String updateBy;
	/**更新日期*/
	@Excel(name = "更新日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date updateTime;
}
