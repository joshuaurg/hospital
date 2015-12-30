package com.dpc.web.controller.back;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dpc.utils.PageEntity;
import com.dpc.utils.PageResult;
import com.dpc.utils.ValidateUtil;
import com.dpc.web.VO.DoctorVO;
import com.dpc.web.VO.Pager;
import com.dpc.web.controller.BaseController;
import com.dpc.web.mybatis3.domain.Article;
import com.dpc.web.mybatis3.domain.Doctor;
import com.dpc.web.service.IBackDoctorService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/back/doctor",produces = {"application/json;charset=UTF-8"})
public class BackDoctorController extends BaseController{
	
	@Autowired
	IBackDoctorService backDoctorService;
	
	@RequestMapping(value = "/view/list", method = RequestMethod.GET)
	public String loginView(HttpSession session,HttpServletRequest request) throws IOException{
		return "/back/doctor/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String register(HttpSession session,HttpServletRequest request) throws IOException{
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String delFlag = request.getParameter("delFlag");
		String category = request.getParameter("category");
		String illType = request.getParameter("illType");
		Article article = new Article();
		if(!ValidateUtil.isEmpty(startDate)){
			article.setStartDate(startDate);
		}
		if(!ValidateUtil.isEmpty(endDate)){
			article.setEndDate(endDate);
		}
		if(!ValidateUtil.isEmpty(delFlag) && !delFlag.equals("-1")){
			article.setDelFlag(Integer.parseInt(delFlag));
		}
		if(!ValidateUtil.isEmpty(category) && !category.equals("-1")){
			article.setCategory(Integer.parseInt(category));
		}
		if(!ValidateUtil.isEmpty(illType) && !illType.equals("-1")){
			article.setIllType(Integer.parseInt(illType));
		}
		DoctorVO doctor = new DoctorVO();
		Map<String, Object> result = new HashMap<String, Object>();
		Pager<DoctorVO> page = backDoctorService.findByPaginaton(doctor);
		request.setAttribute("page", page);
		return "/back/doctor/list";
	}
	
	
}
