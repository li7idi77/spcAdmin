package com.easycompany.web.admin;

import java.io.File;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.easycompany.cmm.util.EgovFileScrty;
import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.InstructorService;
import com.easycompany.service.SectorService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"inst"})
public class AdminInstructorController
{
  @Autowired
  private InstructorService instructorService;
  
  @Autowired
  private SectorService sectorService;
  
  @Autowired
  protected EgovPropertyService propertiesService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  
  @RequestMapping({"/instructorAdm01List.do"})
  public String instructorAdm01List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  paramMap.put("site","");
	  paramMap.put("sqlName", "getCategoryList1");
	  List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category1list", category1list);
	  	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getCategoryList3");
	  List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category3list", category3list);
	  
	  paramMap.put("sqlName", "getInstructorAllCnt");
	  Map<String, Object> allCount = instructorService.getSelectData(paramMap);
	  model.addAttribute("allCount", allCount);
	  
	  paramMap.put("sqlName", "getInstructorList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInstructorListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructorAdm01List";
  }
  
  @RequestMapping({"/instructorAdm01View.do"})
  public String instructorAdm01View(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));  
	  
	  paramMap.put("sqlName", "getInsAuthList");
	  List<Map<String, Object>> authList = instructorService.getSelectList(paramMap);
	  model.addAttribute("authList", authList);
	   
	  paramMap.put("sqlName", "getInstructorView");	
	  Map<String, Object> result = instructorService.getSelectData(paramMap);
	  
	  model.addAttribute("result", result);
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  return "instructorAdm01View";
  }
  
  @RequestMapping({"/instructorAdm01AuthSave.do"})
  @ResponseBody
  public Map<String, Object> instructorAdm01AuthSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	      
	      paramMap.put("sqlName", "updateInstructorAuthData");	
	      resultCnt = instructorService.updateData(paramMap);
	      
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
  
  @RequestMapping({"/instructorAdm01Save.do"})
  @ResponseBody
  public Map<String, Object> instructorAdm01Save(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	      
	      paramMap.put("sqlName", "updateInstructorData");	
	      resultCnt = instructorService.updateData(paramMap);
	      
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
  
  @RequestMapping({"/instructorAdm02List.do"})
  public String instructorAdm02List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  paramMap.put("site","off");
	  paramMap.put("category1_key","7");
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getCategoryList3");
	  List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category3list", category3list);
	  	  
	  paramMap.put("sqlName", "getInsEduList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsEduListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructorAdm02List";
  }
  
  @RequestMapping({"/instructorAdm03List.do"})
  public String instructorAdm03List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  paramMap.put("site","off");
	  paramMap.put("category1_key","7");
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getCategoryList3");
	  List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category3list", category3list);
	  	  
	  paramMap.put("sqlName", "getInsAppList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsAppListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructorAdm03List";
  }
  
  @RequestMapping(value = "/instructorAdm03Edit.do")
	@ResponseBody
	public Map<String, Object> instructorAdm03Edit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		    
		    paramMap.put("sqlName", "instructorAdm03Edit");	
		    resultCnt = instructorService.updateData(paramMap);
		    
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
  
  @RequestMapping({"/instructorAdm04List.do"})
  public String instructorAdm04List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  	  
	  paramMap.put("sqlName", "getInsLeaveList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsLeaveListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructorAdm04List";
  }
  
  @RequestMapping(value = "/instructorAdm04App.do")
	@ResponseBody
	public Map<String, Object> instructorAdm04App(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		    
		    paramMap.put("sqlName", "instructorAdm04App");	
		    resultCnt = instructorService.updateData(paramMap);
		    
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
  
}