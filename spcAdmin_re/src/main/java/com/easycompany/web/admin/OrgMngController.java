package com.easycompany.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.OrgMngService;
import com.easycompany.service.SectorService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"orgMng"})
public class OrgMngController
{

  @Autowired
  private OrgMngService orgMngService;
  
  @Autowired
  private SectorService sectorService;
  
  @Autowired
  protected EgovPropertyService propertiesService;
  
  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  
  @RequestMapping({"/orgOnlineList.do"})
  public String orgOnlineList(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "orgOnlineList");
	  List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "orgOnlineListCnt");
	  int totCnt = orgMngService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "orgOnlineList";
  }
  
  @RequestMapping({"/eduStatustMod.do"})
  public String eduStatustMod(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));  
	  	   
	  paramMap.put("sqlName", "getCodeList");
	  paramMap.put("code","32");
	  List<Map<String, Object>> codeList = orgMngService.getSelectList(paramMap);
	  model.addAttribute("codeList", codeList);
		
	  paramMap.put("sqlName", "getEduStatView");	
	  Map<String, Object> result = orgMngService.getSelectData(paramMap);
	  
	  model.addAttribute("result", result);
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  return "eduStatustMod";
  }
  
  @RequestMapping({"/orgSave.do"})
  @ResponseBody
  public Map<String, Object> orgSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
	      paramMap.put("sqlName", "orgUpdate");	
	      resultCnt = orgMngService.updateData(paramMap);
	      
	      paramMap.put("sqlName", "orgUpdateDtl");	
	      resultCnt = orgMngService.updateData(paramMap);
	      
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
	  
	  paramMap.put("sqlName", "geEduAppList");
	  List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geEduAppListCnt");
	  int totCnt = orgMngService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "eduTitleList";
  }
  
  @RequestMapping({"/eduTitleDetail.do"})
  public String eduTitleDetail(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "geEduAppUserList");
	  List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geEduAppUserListCnt");
	  int totCnt = orgMngService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "eduTitleDetail";
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
			resultCnt = orgMngService.updateData(paramMap);
			
			paramMap.put("sqlName", "scheduleStatUpdate"); 
			resultCnt = orgMngService.updateData(paramMap);
			
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
	  
	  paramMap.put("sqlName", "getReportAllCnt");
	  Map<String, Object> allCount = orgMngService.getSelectData(paramMap);
	  model.addAttribute("allCount", allCount);
	  
	  paramMap.put("sqlName", "getReportList");
	  List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getReportListCnt");
	  int totCnt = orgMngService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("AdminAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "eduReportList";
  }
  
  @RequestMapping({"/orgExcelDownload.do"})
  public ModelAndView excelDownload(@RequestParam Map<String, Object> paramMap)
    throws Exception
  {
		paramMap.put("recordCountPerPage", 10000);
		paramMap.put("offset",0);
		paramMap.put("pageSize", 1);
		paramMap.put("pageIndex", 1);
		paramMap.put("sqlName", "getReportList");
		
		List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	    paramMap.put("list", list);
	
	    return new ModelAndView("schduleExcelView", paramMap);
  }
  
  @RequestMapping({"/eduReportView.do"})
  public String eduReportView(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  paramMap.put("sqlName", "getOrgReport");	
	  Map<String, Object> result = orgMngService.getSelectData(paramMap);
	  model.addAttribute("result", result);	
	  
	  paramMap.put("sqlName", "getEduAttList");
	  List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  return "eduReportView";
  }
  
  @RequestMapping({"/eduReportMod.do"})
  public String eduReportMod(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	  paramMap.put("sqlName", "getOrgReport");	
	  Map<String, Object> result = orgMngService.getSelectData(paramMap);
	  model.addAttribute("result", result);	
	  
	  paramMap.put("sqlName", "getEduAttList");
	  List<Map<String, Object>> list = orgMngService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  return "eduReportMod";
  }
}