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
 * @Description: biz_ict_cost_reporting
 * @Author: jeecg-boot
 * @Date:   2019-10-16
 * @Version: V1.0
 */
@Data
@TableName("biz_ict_cost_reporting")
public class BizIctCostReporting implements Serializable {
    private static final long serialVersionUID = 1L;
    
	/**id*/
	@TableId(type = IdType.ID_WORKER_STR)
	private java.lang.String id;
	/**ICT收入合同编号*/
	@Excel(name = "ICT收入合同编号", width = 15)
	private java.lang.String ictContractNumber;
	/**报支比例*/
	@Excel(name = "报支比例", width = 15)
	private java.math.BigDecimal costReportingRatio;
	/**报支日期*/
	@Excel(name = "报支日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date costReportingDate;
	/**报支帐期（月）例201901*/
	@Excel(name = "报支帐期", width = 15)
	private java.lang.Integer reportedAccountMonth;
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
