package com.easycompany.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.LmsService;
import com.easycompany.service.SectorService;
import com.easycompany.service.vo.LmsVo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("lms")
public class LmsController {
	
	@Autowired
	private LmsService lmsService;

	@Autowired
	private SectorService sectorService;
	  
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;
	
	@RequestMapping(value = "/contentsList.do")
	public String contentsList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		  paramMap.put("pageSize", 10);
		  paramMap.put("recordCountPerPage", 10);
		  paramMap.put("UserAccount", request.getSession().getAttribute("AdminAccount"));
		  if(!paramMap.containsKey("pageIndex")) {
			  paramMap.put("pageIndex", 1);
		  }
		  PaginationInfo paginationInfo = new PaginationInfo();
		  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		  paramMap.put("offset",offset);
		
		  paramMap.put("sqlName", "getCategoryList1");
		  paramMap.put("site","on");
		  List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		  model.addAttribute("category1list", category1list);
		  
		  paramMap.put("sqlName", "contentsAllCnt");	
		  Map<String, Object> result = lmsService.getSelectData(paramMap);
		  model.addAttribute("count", result);  
			
		  paramMap.put("sqlName", "contentsList");
		  List<Map<String, Object>> list = lmsService.getSelectList(paramMap);
		  model.addAttribute("resultList", list);
			
		  paramMap.put("sqlName", "contentsListCnt");
		  int totCnt = lmsService.getSelectListCnt(paramMap);
		  model.addAttribute("totCnt", totCnt);
		  paginationInfo.setTotalRecordCount(totCnt);
		
		  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
		  model.addAttribute("paginationInfo", paginationInfo);
		  model.addAttribute("path", request.getServletPath());
		  model.addAllAttributes(paramMap);

		return "contentsList";
	}
	
	@RequestMapping(value = "/contentsReq.do")
	public String noticeReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("sqlName", "selectDetailLms");	
		Map<String, Object> result = lmsService.getSelectData(paramMap);
		model.addAttribute("result", result);  
	  	model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		
		return "contentsReq";
	}
	
	@RequestMapping(value = "/contentsSave.do")
	@ResponseBody
	public Map<String, Object> contentsSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, @RequestParam("file1") MultipartFile file1) throws Exception {
		int resultCnt = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		    
		      
		    String fileAddpath  = this.filePath + File.separator + paramMap.get("file_gubun");
		    Map<String, Object> fileSave = null;
		    if (file1 != null) {
		    	if(file1.getSize() > 0) {
		    		fileSave = FileUtil.uploadFile(file1, fileAddpath, request); 
			    	resultCnt = this.lmsService.insertCommonFile(paramMap, fileSave, 1);
			    	paramMap.put("file_id", fileSave.get("file_uuid"));
		    	}
	    	}     
		    
		    paramMap.put("sqlName", "updateContents");	
		    resultCnt = lmsService.updateData(paramMap);
		    
		    if(resultCnt > 0) {
		        result.put("result", "SUCCESS");
		    }else {
		        result.put("result", "FAIL");	 
		    }
		} catch (Exception e) {
		    result.put("result", "FAIL");
		}
		return result;
	}
	
	@RequestMapping({"/contentsDel.do"})
    @ResponseBody
    public String contentsDel(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("UserAccount", request.getSession().getAttribute("AdminAccount"));
			paramMap.put("sqlName", "deleteContents"); 
			resultCnt = lmsService.updateData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
	
	@RequestMapping(value = "/studentList.do")
	public String studentList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		  paramMap.put("pageSize", 10);
		  paramMap.put("recordCountPerPage", 10);
		  paramMap.put("UserAccount", request.getSession().getAttribute("AdminAccount"));
		  if(!paramMap.containsKey("pageIndex")) {
			  paramMap.put("pageIndex", 1);
		  }
		  PaginationInfo paginationInfo = new PaginationInfo();
		  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		  paramMap.put("offset",offset);
		
		  paramMap.put("sqlName", "studentAllCnt");	
		  Map<String, Object> result = lmsService.getSelectData(paramMap);
		  model.addAttribute("count", result);  
		  
		  paramMap.put("sqlName", "studentList");
		  List<Map<String, Object>> list = lmsService.getSelectList(paramMap);
		  model.addAttribute("resultList", list);
			
		  paramMap.put("sqlName", "studentListCnt");
		  int totCnt = lmsService.getSelectListCnt(paramMap);
		  model.addAttribute("totCnt", totCnt);
		  paginationInfo.setTotalRecordCount(totCnt);
		
		  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
		  model.addAttribute("paginationInfo", paginationInfo);
		  model.addAttribute("path", request.getServletPath());
		  model.addAllAttributes(paramMap);
		  
		return "studentList";
	}

}
