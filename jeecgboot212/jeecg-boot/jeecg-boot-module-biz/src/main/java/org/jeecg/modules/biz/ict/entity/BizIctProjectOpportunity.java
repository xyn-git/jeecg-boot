package org.jeecg.modules.biz.ict.entity;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
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
 * @Description: biz_ict_project_opportunity
 * @Author: jeecg-boot
 * @Date:   2019-11-20
 * @Version: V1.0
 */
@Data
@TableName("biz_ict_project_opportunity")
public class BizIctProjectOpportunity implements Serializable {
    private static final long serialVersionUID = 1L;
    
	/**id*/
	@TableId(type = IdType.ID_WORKER_STR)
    private String id;
	/**项目组*/
	@Dict(dicCode = "ICT_projTeam")
	//@Dict(dicCode = "id",dictTable = "sys_depart",dicText = "depart_name")
	@Excel(name = "项目组", width = 15)
    private String projectTeam;
	/**项目经理*/
	@Excel(name = "项目经理", width = 15)
    private String projectManager;
	/**项目名称*/
	@Excel(name = "项目名称", width = 15)
    private String projectName;
	/**项目金额*/
	@Excel(name = "项目金额", width = 15)
    private String projectAmount;
	/**入收计划*/
	@Excel(name = "入收计划", width = 15)
    private String incomePlan;
	/**当前进展*/
	@Dict(dicCode = "ICT_projOpportunityProgress")
	@Excel(name = "当前进展", width = 15)
    private String currentProgress;
	/**支撑厂家*/
	@Excel(name = "支撑厂家", width = 15)
    private String supportingManufacturer;
	/**营销部门*/
	@Dict(dictTable = "sys_category",dicText = "name" ,dicCode = "id")
	@Excel(name = "营销部门", width = 15)
	private String saleDepartment;
	/**营销单位*/
	@Dict(dictTable = "sys_category",dicText = "name" ,dicCode = "id")
	@Excel(name = "营销单位", width = 15)
    private String saleUnit;
	/**客户经理*/
	@Excel(name = "客户经理", width = 15)
    private String customerManager;
	/**进度一*/
	@Excel(name = "进度一", width = 15)
    private String progress1;
	/**进度二*/
	@Excel(name = "进度二", width = 15)
    private String progress2;
	/**进度三*/
	@Excel(name = "进度三", width = 15)
    private String progress3;
	/**进度四*/
	@Excel(name = "进度四", width = 15)
    private String progress4;
	/**备注*/
	@Excel(name = "备注", width = 15)
    private String remark;
	/**创建人*/
	@Excel(name = "创建人", width = 15)
    private String createBy;
	/**创建日期*/
	//@Excel(name = "创建日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createTime;
	/**用户部门编号*/
	@Excel(name = "部门编号", width = 20)
	private String sysOrgCode;
	/**更新人*/
	//@Excel(name = "更新人", width = 15)
    private String updateBy;
	/**更新日期*/
	//@Excel(name = "更新日期", width = 15, format = "yyyy-MM-dd")
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updateTime;
}
