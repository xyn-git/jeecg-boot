package org.jeecg.modules.biz;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.aspect.annotation.AutoLog;
import org.jeecg.common.aspect.annotation.PermissionData;
import org.jeecg.common.constant.CommonConstant;
import org.jeecg.common.system.base.controller.JeecgController;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.common.util.DateUtils;
import org.jeecg.common.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Description: 测试demo 
 * @Author: jeecg-boot 
 * @Date:2018-12-29 
 * @Version:V1.0
 */
@Slf4j
@Api(tags="Hello")
@RestController
@RequestMapping("/hello")
public class HelloController {

	@Autowired
	private RedisUtil redisUtil;

	@GetMapping(value = "/test")
	@ApiOperation(value="Hello Rest 查询", notes="swagger test")
	public Result<String> test() {
		Result<String> result = new Result<String>();
		result.setResult("Test Hello World!");
		result.setSuccess(true);
		return result;
	}

	@ApiOperation(value="Hello world", notes="swagger hello")
	@GetMapping(value = "/")
	public String hello() {
		return "Hello World!";
	}
}
