package org.jeecg.modules.biz.ict.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.aspect.annotation.PermissionData;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.system.vo.LoginUser;
import org.jeecg.common.util.oConvertUtils;
import org.jeecg.modules.biz.ict.entity.BizIctProjectIncome;
import org.jeecg.modules.biz.ict.entity.SysDepart;
import org.jeecg.modules.biz.ict.mapper.BizSysDepartMapper;
import org.jeecg.modules.biz.ict.service.IBizIctProjectIncomeService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.def.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.view.JeecgEntityExcelView;
import org.jeecg.common.system.base.controller.JeecgController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;

 /**
 * @Description: biz_ict_project_income
 * @Author: jeecg-boot
 * @Date:   2019-11-20
 * @Version: V1.0
 */
@RestController
@RequestMapping("/ict/bizIctProjectIncome")
@Slf4j
public class BizIctProjectIncomeController extends JeecgController<BizIctProjectIncome, IBizIctProjectIncomeService> {
	@Autowired
	private IBizIctProjectIncomeService bizIctProjectIncomeService;
	 @Autowired
	 private BizSysDepartMapper sysDepartMapper;
	/**
	 * 分页列表查询
	 *
	 * @param bizIctProjectIncome
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "ict/BizIctProjectIncomeList")
	public Result<?> queryPageList(BizIctProjectIncome bizIctProjectIncome,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<BizIctProjectIncome> queryWrapper = QueryGenerator.initQueryWrapper(bizIctProjectIncome, req.getParameterMap());
		Page<BizIctProjectIncome> page = new Page<BizIctProjectIncome>(pageNo, pageSize);
		IPage<BizIctProjectIncome> pageList = bizIctProjectIncomeService.page(page, queryWrapper);
		return Result.ok(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param bizIctProjectIncome
	 * @return
	 */
	@PostMapping(value = "/add")
	public Result<?> add(@RequestBody BizIctProjectIncome bizIctProjectIncome) {
		LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();
		QueryWrapper<SysDepart> queryWrapper=new QueryWrapper<>();
		queryWrapper.eq("org_code",sysUser.getOrgCode());
		SysDepart sysDepart= sysDepartMapper.selectOne(queryWrapper);
		bizIctProjectIncome.setProjectManager(sysUser.getRealname());
		String team_item_value = sysDepartMapper.queryTeamItemValueByTeamName(sysDepart.getDepartName());
		bizIctProjectIncome.setProjectTeam(team_item_value);

		bizIctProjectIncomeService.save(bizIctProjectIncome);
		return Result.ok("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param bizIctProjectIncome
	 * @return
	 */
	@PutMapping(value = "/edit")
	public Result<?> edit(@RequestBody BizIctProjectIncome bizIctProjectIncome) {
		bizIctProjectIncomeService.updateById(bizIctProjectIncome);
		return Result.ok("编辑成功!");
	}
	
	/**
	 *   通过id删除
	 *
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete")
	public Result<?> delete(@RequestParam(name="id",required=true) String id) {
		bizIctProjectIncomeService.removeById(id);
		return Result.ok("删除成功!");
	}
	
	/**
	 *  批量删除
	 *
	 * @param ids
	 * @return
	 */
	@DeleteMapping(value = "/deleteBatch")
	public Result<?> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		this.bizIctProjectIncomeService.removeByIds(Arrays.asList(ids.split(",")));
		return Result.ok("批量删除成功!");
	}
	
	/**
	 * 通过id查询
	 *
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/queryById")
	public Result<?> queryById(@RequestParam(name="id",required=true) String id) {
		BizIctProjectIncome bizIctProjectIncome = bizIctProjectIncomeService.getById(id);
		if(bizIctProjectIncome==null) {
			return Result.error("未找到对应数据");
		}
		return Result.ok(bizIctProjectIncome);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param bizIctProjectIncome
    */
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, BizIctProjectIncome bizIctProjectIncome) {
        return super.exportXls(request, bizIctProjectIncome, BizIctProjectIncome.class, "biz_ict_project_income");
    }

    /**
      * 通过excel导入数据
    *
    * @param request
    * @param response
    * @return
    */
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    public Result<?> importExcel(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Enter importExcel  ");
        return super.importExcel(request, response, BizIctProjectIncome.class);
    }

}
