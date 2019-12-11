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
 * @Description: biz_group_custormer
 * @Author: jeecg-boot
 * @Date:   2019-10-16
 * @Version: V1.0
 */
@Data
@TableName("biz_group_custormer")
public class BizGroupCustormer implements Serializable {
    private static final long serialVersionUID = 1L;
    
	/**id*/
	@TableId(type = IdType.ID_WORKER_STR)
	private java.lang.String id;
	/**部门*/
	@Excel(name = "部门", width = 15)
	private java.lang.String department;
	/**单元*/
	@Excel(name = "单元", width = 15)
	private java.lang.String unit;
	/**姓名*/
	@Excel(name = "姓名", width = 15)
	private java.lang.String name;
	/**员工编码*/
	@Excel(name = "员工编码", width = 15)
	private java.lang.String employeeCode;
	/**岗位*/
	@Excel(name = "岗位", width = 15)
	private java.lang.String position;
	/**用工形式*/
	@Excel(name = "用工形式", width = 15)
	private java.lang.String employeeType;
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
