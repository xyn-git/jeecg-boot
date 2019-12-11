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
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.util.oConvertUtils;
import org.jeecg.modules.biz.ict.entity.BizIctOverdueArrears;
import org.jeecg.modules.biz.ict.service.IBizIctOverdueArrearsService;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;

import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.def.NormalExcelConstants;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.ImportParams;
import org.jeecgframework.poi.excel.view.JeecgEntityExcelView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;

 /**
 * @Description: biz_ict_overdue_arrears
 * @Author: jeecg-boot
 * @Date:   2019-10-16
 * @Version: V1.0
 */
@RestController
@RequestMapping("/ict/bizIctOverdueArrears")
@Slf4j
public class BizIctOverdueArrearsController {
	@Autowired
	private IBizIctOverdueArrearsService bizIctOverdueArrearsService;
	
	/**
	  * 分页列表查询
	 * @param bizIctOverdueArrears
	 * @param pageNo
	 * @param pageSize
	 * @param req
	 * @return
	 */
	@GetMapping(value = "/list")
	public Result<IPage<BizIctOverdueArrears>> queryPageList(BizIctOverdueArrears bizIctOverdueArrears,
									  @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
									  @RequestParam(name="pageSize", defaultValue="10") Integer pageSize,
									  HttpServletRequest req) {
		Result<IPage<BizIctOverdueArrears>> result = new Result<IPage<BizIctOverdueArrears>>();
		QueryWrapper<BizIctOverdueArrears> queryWrapper = QueryGenerator.initQueryWrapper(bizIctOverdueArrears, req.getParameterMap());
		Page<BizIctOverdueArrears> page = new Page<BizIctOverdueArrears>(pageNo, pageSize);
		IPage<BizIctOverdueArrears> pageList = bizIctOverdueArrearsService.page(page, queryWrapper);
		result.setSuccess(true);
		result.setResult(pageList);
		return result;
	}
	
	/**
	  *   添加
	 * @param bizIctOverdueArrears
	 * @return
	 */
	@PostMapping(value = "/add")
	public Result<BizIctOverdueArrears> add(@RequestBody BizIctOverdueArrears bizIctOverdueArrears) {
		Result<BizIctOverdueArrears> result = new Result<BizIctOverdueArrears>();
		try {
			bizIctOverdueArrearsService.save(bizIctOverdueArrears);
			result.success("添加成功！");
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			result.error500("操作失败");
		}
		return result;
	}
	
	/**
	  *  编辑
	 * @param bizIctOverdueArrears
	 * @return
	 */
	@PutMapping(value = "/edit")
	public Result<BizIctOverdueArrears> edit(@RequestBody BizIctOverdueArrears bizIctOverdueArrears) {
		Result<BizIctOverdueArrears> result = new Result<BizIctOverdueArrears>();
		BizIctOverdueArrears bizIctOverdueArrearsEntity = bizIctOverdueArrearsService.getById(bizIctOverdueArrears.getId());
		if(bizIctOverdueArrearsEntity==null) {
			result.error500("未找到对应实体");
		}else {
			boolean ok = bizIctOverdueArrearsService.updateById(bizIctOverdueArrears);
			//TODO 返回false说明什么？
			if(ok) {
				result.success("修改成功!");
			}
		}
		
		return result;
	}
	
	/**
	  *   通过id删除
	 * @param id
	 * @return
	 */
	@DeleteMapping(value = "/delete")
	public Result<?> delete(@RequestParam(name="id",required=true) String id) {
		try {
			bizIctOverdueArrearsService.removeById(id);
		} catch (Exception e) {
			log.error("删除失败",e.getMessage());
			return Result.error("删除失败!");
		}
		return Result.ok("删除成功!");
	}
	
	/**
	  *  批量删除
	 * @param ids
	 * @return
	 */
	@DeleteMapping(value = "/deleteBatch")
	public Result<BizIctOverdueArrears> deleteBatch(@RequestParam(name="ids",required=true) String ids) {
		Result<BizIctOverdueArrears> result = new Result<BizIctOverdueArrears>();
		if(ids==null || "".equals(ids.trim())) {
			result.error500("参数不识别！");
		}else {
			this.bizIctOverdueArrearsService.removeByIds(Arrays.asList(ids.split(",")));
			result.success("删除成功!");
		}
		return result;
	}
	
	/**
	  * 通过id查询
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/queryById")
	public Result<BizIctOverdueArrears> queryById(@RequestParam(name="id",required=true) String id) {
		Result<BizIctOverdueArrears> result = new Result<BizIctOverdueArrears>();
		BizIctOverdueArrears bizIctOverdueArrears = bizIctOverdueArrearsService.getById(id);
		if(bizIctOverdueArrears==null) {
			result.error500("未找到对应实体");
		}else {
			result.setResult(bizIctOverdueArrears);
			result.setSuccess(true);
		}
		return result;
	}

  /**
      * 导出excel
   *
   * @param request
   * @param response
   */
  @RequestMapping(value = "/exportXls")
  public ModelAndView exportXls(HttpServletRequest request, BizIctOverdueArrears bizIctOverdueArrears) {
      // Step.1 组装查询条件查询数据
      QueryWrapper<BizIctOverdueArrears> queryWrapper = QueryGenerator.initQueryWrapper(bizIctOverdueArrears, request.getParameterMap());
      List<BizIctOverdueArrears> pageList = bizIctOverdueArrearsService.list(queryWrapper);
      // Step.2 AutoPoi 导出Excel
      ModelAndView mv = new ModelAndView(new JeecgEntityExcelView());
      // 过滤选中数据
      String selections = request.getParameter("selections");
      if(oConvertUtils.isEmpty(selections)) {
    	  mv.addObject(NormalExcelConstants.DATA_LIST, pageList);
      }else {
    	  List<String> selectionList = Arrays.asList(selections.split(","));
    	  List<BizIctOverdueArrears> exportList = pageList.stream().filter(item -> selectionList.contains(item.getId())).collect(Collectors.toList());
    	  mv.addObject(NormalExcelConstants.DATA_LIST, exportList);
      }
      //导出文件名称
      mv.addObject(NormalExcelConstants.FILE_NAME, "biz_ict_overdue_arrears列表");
      mv.addObject(NormalExcelConstants.CLASS, BizIctOverdueArrears.class);
      mv.addObject(NormalExcelConstants.PARAMS, new ExportParams("biz_ict_overdue_arrears列表数据", "导出人:Jeecg", "导出信息"));
      return mv;
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
      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
      Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
      for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
          MultipartFile file = entity.getValue();// 获取上传文件对象
          ImportParams params = new ImportParams();
          params.setTitleRows(2);
          params.setHeadRows(1);
          params.setNeedSave(true);
          try {
              List<BizIctOverdueArrears> listBizIctOverdueArrearss = ExcelImportUtil.importExcel(file.getInputStream(), BizIctOverdueArrears.class, params);
              bizIctOverdueArrearsService.saveBatch(listBizIctOverdueArrearss);
              return Result.ok("文件导入成功！数据行数:" + listBizIctOverdueArrearss.size());
          } catch (Exception e) {
              log.error(e.getMessage(),e);
              return Result.error("文件导入失败:"+e.getMessage());
          } finally {
              try {
                  file.getInputStream().close();
              } catch (IOException e) {
                  e.printStackTrace();
              }
          }
      }
      return Result.ok("文件导入失败！");
  }

}
