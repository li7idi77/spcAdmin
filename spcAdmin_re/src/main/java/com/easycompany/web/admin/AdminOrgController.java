package com.easycompany.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.InstructorService;
import com.easycompany.service.OrgService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"org"})
public class AdminOrgController
{

  @Autowired
  private OrgService orgService;
  
  @Autowired
  protected EgovPropertyService propertiesService;
  
  @Autowired
  protected InstructorService instructorService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  
  @RequestMapping({"/eduStatustList.do"})
  public String org02List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "getAdOrgStatAllCnt");
	  Map<String, Object> allCount = orgService.getSelectData(paramMap);
	  model.addAttribute("allCount", allCount);
	  
	  paramMap.put("sqlName", "getAdOrgStatList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getAdOrgStatListCnt");
	  int totCnt = orgService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "eduStatustList";
  }
  
  @RequestMapping({"/popInsSelect.do"})
  public String popInsSelect(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	  
	  paramMap.put("sqlName", "getInsSelectList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
			  
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	  return "popInsSelect";
  }
  
  @RequestMapping({"/updateInsData.do"})
  @ResponseBody
  public Map<String, Object> updateInsData(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));

	      paramMap.put("sqlName", "updateInsData");	
	      resultCnt = orgService.updateData(paramMap);
	      
	      paramMap.put("sqlName", "updateInsDtlData");	
	      resultCnt += orgService.updateData(paramMap);
	      
	      paramMap.put("sqlName", "updateInsAppData");	
	      resultCnt += orgService.updateData(paramMap);
	      
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
  
  @RequestMapping({"/popAppCancel.do"})
  public String popAppCancel(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	  	  
	  paramMap.put("sqlName", "getInsSelectList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
			  
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	  return "popAppCancel";
  }
  
  @RequestMapping({"/saveAppCancel.do"})
  @ResponseBody
  public Map<String, Object> saveAppCancel(@RequestParam Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));

	      paramMap.put("sqlName", "updateAppCancel");	
	      resultCnt = orgService.updateData(paramMap);
	      
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
  
  @RequestMapping({"/eduTitleList.do"})
  public String eduTitleList(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "getAdOrgAppList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getAdOrgAppListCnt");
	  int totCnt = orgService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "eduTitleList";
  }
  
  @RequestMapping({"/courUserDel.do"})
  @ResponseBody
  public String courUserDel(HttpServletRequest request, @RequestParam(value="userArr[]") List<String> userList, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
			paramMap.put("userList", userList); 
			paramMap.put("sqlName", "courUserDel"); 
			resultCnt = orgService.updateData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		    
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
  
  @RequestMapping({"/courUserAtt.do"})
  @ResponseBody
  public String courUserAtt(HttpServletRequest request, @RequestParam(value="userArr[]") List<String> userList, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
			paramMap.put("userList", userList); 
			paramMap.put("sqlName", "courUserAtt"); 
			resultCnt = orgService.updateData(paramMap);
			
			paramMap.put("sqlName", "scheduleStatUpdate"); 
			resultCnt = orgService.updateData(paramMap);
			
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		    
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
  
  
  @RequestMapping({"/eduReportList.do"})
  public String eduReportList(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "getAdminOrgStatList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getAdminOrgStatListCnt");
	  int totCnt = orgService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "eduReportList";
  }
}