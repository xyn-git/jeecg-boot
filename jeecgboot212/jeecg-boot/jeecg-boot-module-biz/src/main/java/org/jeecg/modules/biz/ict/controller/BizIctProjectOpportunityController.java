package org.jeecg.modules.biz.ict.controller;

import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.aspect.annotation.PermissionData;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.system.vo.LoginUser;
import org.jeecg.modules.biz.ict.entity.BizIctProjectOpportunity;
import org.jeecg.modules.biz.ict.entity.SysDepart;
import org.jeecg.modules.biz.ict.mapper.BizSysDepartMapper;
import org.jeecg.modules.biz.ict.service.IBizIctProjectOpportunityService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.jeecg.common.system.base.controller.JeecgController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Description: biz_ict_project_opportunity
 * @Author: jeecg-boot
 * @Date:   2019-11-20
 * @Version: V1.0
 */
@RestController
@RequestMapping("/ict/bizIctProjectOpportunity")
@Slf4j
public class BizIctProjectOpportunityController extends JeecgController<BizIctProjectOpportunity, IBizIctProjectOpportunityService> {
	@Autowired
	private IBizIctProjectOpportunityService bizIctProjectOpportunityService;
	@Autowired
	private BizSysDepartMapper sysDepartMapper;
	/**
	 * 分页列表查询
	 *
	 * @param bizIctProjectOpportunity
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@GetMapping(value = "/list")
	@PermissionData(pageComponent = "ict/BizIctProjectOpportunityList")
	public Result<?> queryPageList(BizIctProjectOpportunity bizIctProjectOpportunity,
								   @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
								   @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
								   HttpServletRequest req) {
		QueryWrapper<BizIctProjectOpportunity> queryWrapper = QueryGenerator.initQueryWrapper(bizIctProjectOpportunity, req.getParameterMap());
		Page<BizIctProjectOpportunity> page = new Page<BizIctProjectOpportunity>(pageNo, pageSize);
		IPage<BizIctProjectOpportunity> pageList = bizIctProjectOpportunityService.page(page, queryWrapper);
		return Result.ok(pageList);
	}
	
	/**
	 *   添加
	 *
	 * @param bizIctProjectOpportunity
	 * @return
	 */
	@PostMapping(value = "/add")
	public Result<?> add(@RequestBody BizIctProjectOpportunity bizIctProjectOpportunity) {
		LoginUser sysUser = (LoginUser) SecurityUtils.getSubject().getPrincipal();
		QueryWrapper<SysDepart> queryWrapper=new QueryWrapper<>();
		queryWrapper.eq("org_code",sysUser.getOrgCode());
		SysDepart sysDepart= sysDepartMapper.selectOne(queryWrapper);
		bizIctProjectOpportunity.setProjectManager(sysUser.getRealname());
		String team_item_value = sysDepartMapper.queryTeamItemValueByTeamName(sysDepart.getDepartName());
		bizIctProjectOpportunity.setProjectTeam(team_item_value);

		bizIctProjectOpportunityService.save(bizIctProjectOpportunity);
		return Result.ok("添加成功！");
	}
	
	/**
	 *  编辑
	 *
	 * @param bizIctProjectOpportunity
	 * @return
	 */
	@PutMapping(value = "/edit")
	public Result<?> edit(@RequestBody BizIctProjectOpportunity bizIctProjectOpportunity) {
		bizIctProjectOpportunityService.updateById(bizIctProjectOpportunity);
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
		bizIctProjectOpportunityService.removeById(id);
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
		this.bizIctProjectOpportunityService.removeByIds(Arrays.asList(ids.split(",")));
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
		BizIctProjectOpportunity bizIctProjectOpportunity = bizIctProjectOpportunityService.getById(id);
		if(bizIctProjectOpportunity==null) {
			return Result.error("未找到对应数据");
		}
		return Result.ok(bizIctProjectOpportunity);
	}

    /**
    * 导出excel
    *
    * @param request
    * @param bizIctProjectOpportunity
    */
    @RequestMapping(value = "/exportXls")
    public ModelAndView exportXls(HttpServletRequest request, BizIctProjectOpportunity bizIctProjectOpportunity) {
        return super.exportXls(request, bizIctProjectOpportunity, BizIctProjectOpportunity.class, "biz_ict_project_opportunity");
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
        return super.importExcel(request, response, BizIctProjectOpportunity.class);
    }


}
