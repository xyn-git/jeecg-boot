package org.jeecg.modules.config;

import com.github.xiaoymin.swaggerbootstrapui.annotations.EnableSwaggerBootstrapUI;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.Parameter;
import springfox.documentation.service.SecurityScheme;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @Author scott
 */
@Slf4j
@Configuration
@EnableSwagger2
@EnableSwaggerBootstrapUI
public class Swagger2BizConfig {
	public static String X_ACCESS_TOKEN = "X-Access-Token";
	/**
	 * swagger2的配置文件，这里可以配置swagger2的一些基本的内容，比如扫描的包等等
	 *
	 * @return Docket
	 */
	@Bean
	public Docket createRestApiBiz() {
		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(apiInfo()).groupName("业务模块")
				.select()
				//此包路径下的类，才生成接口文档
				.apis(RequestHandlerSelectors.basePackage("org.jeecg.modules.biz"))
				//加了ApiOperation注解的类，才生成接口文档
				.apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
				.paths(PathSelectors.any())
				.build()
				.securitySchemes(Collections.singletonList(securitySchemeBiz()));
		//.globalOperationParameters(setHeaderToken());
	}

	/***
	 * oauth2配置
	 * 需要增加swagger授权回调地址
	 * http://localhost:8888/webjars/springfox-swagger-ui/o2c.html
	 * @return
	 */
	private SecurityScheme securitySchemeBiz() {
		return new ApiKey(X_ACCESS_TOKEN, X_ACCESS_TOKEN, "header");
	}


	/**
	 * api文档的详细信息函数,注意这里的注解引用的是哪个
	 *
	 * @return
	 */
	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
				// //大标题
				.title("Biz业务 后台服务API接口文档")
				// 版本号
				.version("1.0")
//				.termsOfServiceUrl("NO terms of service")
				// 描述
				.description("后台API接口")
				// 作者
				.contact("研发团队")
				.build();
	}

}
