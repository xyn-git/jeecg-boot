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
 * @Description: biz_ict_construction_contract
 * @Author: jeecg-boot
 * @Date:   2019-10-16
 * @Version: V1.0
 */
@Data
@TableName("biz_ict_construction_contract")
public class BizIctConstructionContract implements Serializable {
    private static final long serialVersionUID = 1L;
    
	/**id*/
	@TableId(type = IdType.ID_WORKER_STR)
	private java.lang.String id;
	/**合同编号*/
	@Excel(name = "合同编号", width = 15)
	private java.lang.String contractNumber;
	/**项目名称*/
	@Excel(name = "项目名称", width = 15)
	private java.lang.String projectName;
	/**乙方单位名*/
	@Excel(name = "乙方单位名", width = 15)
	private java.lang.String partyB;
	/**ICT协议金额*/
	@Excel(name = "ICT协议金额", width = 15)
	private java.math.BigDecimal itAmount;
	/**ICT协议税率*/
	@Excel(name = "ICT协议税率", width = 15)
	private java.math.BigDecimal itRate;
	/**设备协议金额*/
	@Excel(name = "设备协议金额", width = 15)
	private java.math.BigDecimal deivceAmount;
	/**设备协议税率*/
	@Excel(name = "设备协议税率", width = 15)
	private java.math.BigDecimal deviceRate;
	/**项目经理*/
	@Excel(name = "项目经理", width = 15)
	private java.lang.String projectManager;
	/**项目组*/
	@Excel(name = "项目组", width = 15)
	private java.lang.String projectTeam;
	/**合同签订时间*/
	@Excel(name = "合同签订时间", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date signingDate;
	/**乙方联系人*/
	@Excel(name = "乙方联系人", width = 15)
	private java.lang.String partyBLinkman;
	/**乙方联系电话*/
	@Excel(name = "乙方联系电话", width = 15)
	private java.lang.String partyBTel;
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
