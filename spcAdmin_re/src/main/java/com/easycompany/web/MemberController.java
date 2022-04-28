package com.easycompany.web;

import java.io.File;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.easycompany.cmm.util.EgovFileScrty;
import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.util.StringUtil;
import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.BoardService;
import com.easycompany.service.DepartmentService;
import com.easycompany.service.EmployeeService;
import com.easycompany.service.MemberService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("member")
public class MemberController {

	
	@Autowired
	private MemberService memberService;
	
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;

	/** 회원 - 목록  */
	@RequestMapping(value = "/memberList.do")
	public String getMemberList(@ModelAttribute("searchVO") DefaultVO searchVo, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVo.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVo.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVo.getPageUnit());
		paginationInfo.setPageSize(searchVo.getPageSize());
		
		/***  offSet 설정  ***/
		int offset = ((paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize());
		searchVo.setOffset(offset);
		
		List<LoginVo> list = memberService.getMemberList(searchVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = memberService.getMemberCount(searchVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVo", searchVo);

		return "memberList";
	}
	
	/** 회원 - 수정  */
	@RequestMapping(value = "/memberEdit.do")
	public String getBoardList(HttpServletRequest request, HttpServletResponse response,LoginVo loginVo, ModelMap model) throws Exception {
			
		model.addAttribute("LoginVo", loginVo);
		model.addAttribute("id", loginVo.getId());
		return "memberEdit";
	}
	
	/** 회원 - 상세  */
	@RequestMapping(value = "/getMemberDetail.do")
	@ResponseBody
	public LoginVo getMemberDetail(HttpServletRequest request, HttpServletResponse response,LoginVo loginVo, ModelMap model) throws Exception {

			
		LoginVo data = memberService.getMemberView(loginVo);
		model.addAttribute("LoginVo", data);
		return data;
	}
	
	/** 회원 - 수정  */
	@RequestMapping(value = "/updateMember.do")
	@ResponseBody
	public LoginVo updateMember(HttpServletRequest request, HttpServletResponse response,LoginVo loginVo, ModelMap model) throws Exception {

		String shaPassword = "";
		if (loginVo.getPassword() != null && loginVo.getPassword().length() > 0) {
			shaPassword = EgovFileScrty.encryptPassword(loginVo.getPassword(), loginVo.getId());
			loginVo.setShaPassword(shaPassword);
		}
		
		int resultCnt= memberService.updateMember(loginVo);
		loginVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );  
		return loginVo;
		
	}
}
