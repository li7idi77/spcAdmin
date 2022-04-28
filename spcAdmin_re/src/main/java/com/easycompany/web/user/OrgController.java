package com.easycompany.web.user;

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
@RequestMapping({"user"})
public class OrgController
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

  @RequestMapping({"/org01info.do"})
  public String org01info(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  	model.addAttribute("path", request.getServletPath());
	    model.addAllAttributes(paramMap);
		return "org01info";
  }
  
  @RequestMapping({"/org01List.do"})
  public String org01List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  
	  paramMap.put("sqlName", "getOrgList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getOrgListCnt");
	  int totCnt = orgService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  
	  
	  return "org01List";
  }
    
  @RequestMapping({"/org01Req.do"})
  public String orgView(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  	paramMap.put("sqlName", "getCodeList");
	  	paramMap.put("code","32");
	  	List<Map<String, Object>> codeList = instructorService.getSelectList(paramMap);
		model.addAttribute("codeList", codeList);
		  
	  	paramMap.put("sqlName", "getOrgView");	
		Map<String, Object> result = orgService.getSelectData(paramMap);
	  	model.addAttribute("result", result);
	  	model.addAttribute("path", request.getServletPath());
	    model.addAllAttributes(paramMap);
		return "org01Req";
  }
  
  @RequestMapping({"/popInsSearch.do"})
  public String popInsSearch(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  	  
	  paramMap.put("sqlName", "getCodeList");
	  paramMap.put("code","32");
	  List<Map<String, Object>> codeList = instructorService.getSelectList(paramMap);
	  model.addAttribute("codeList", codeList);
		
	  paramMap.put("sqlName", "getInsSearch");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	  return "popInsSearch";
  }
    
  @RequestMapping({"/orgSave.do"})
  @ResponseBody
  public Map<String, Object> orgSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	      paramMap.put("sqlName", "orgSave");	
	      resultCnt = orgService.insertData(paramMap);
	      
	      paramMap.put("sqlName", "orgSaveSelectNo");	
		  Map<String, Object> resultMap = orgService.getSelectData(paramMap);
		  paramMap.put("schedule_no", resultMap.get("SCHEDULE_NO"));	
	      
	      paramMap.put("sqlName", "orgSaveDtl");	
	      resultCnt = orgService.insertData(paramMap);
	      
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
  
  @RequestMapping({"/org02List.do"})
  public String org02List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  
	  paramMap.put("sqlName", "getOrgStatList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getOrgStatListCnt");
	  int totCnt = orgService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "org02List";
  }
  
  @RequestMapping({"/popInsSelect.do"})
  public String popInsSelect(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  
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
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));

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
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  	  
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
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));

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
  
  @RequestMapping({"/org02Report.do"})
  public String org02Report(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  paramMap.put("sqlName", "getOrgReport");	
	  Map<String, Object> result = orgService.getSelectData(paramMap);
	  model.addAttribute("result", result);	
	  
	  paramMap.put("sqlName", "getEduAttList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  return "org02Report";
  }
  
  @RequestMapping({"/courUserDel.do"})
  @ResponseBody
  public String courUserDel(HttpServletRequest request, @RequestParam(value="userArr[]") List<String> userList, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
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
			paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
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
  
  
  @RequestMapping({"/org03List.do"})
  public String org03List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  
	  paramMap.put("sqlName", "getOrgStatList");
	  List<Map<String, Object>> list = orgService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getOrgStatListCnt");
	  int totCnt = orgService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "org03List";
  }
}