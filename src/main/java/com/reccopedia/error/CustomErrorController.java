package com.reccopedia.error;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 에러 페이지 정의
	private final String ERROR_TEMPLATES_PATH = "/errors/";
	//private final String ERROR_500_PAGE_PATH = "/error/500";
	//private final String ERROR_ETC_PAGE_PATH = "/error/error";

	@RequestMapping(value = "/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if(status != null){
            int statusCode = Integer.valueOf(status.toString());
            if(statusCode == HttpStatus.NOT_FOUND.value()){
                return ERROR_TEMPLATES_PATH + "404";
            }

            //if(statusCode == HttpStatus.FORBIDDEN.value()){
            //    return ERROR_TEMPLATES_PATH + "500";
            //}
        }
        return "error";
    }

}
