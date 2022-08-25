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
import com.easycompany.service.SectorService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"user"})
public class SectorController
{

  @Autowired
  private SectorService sectorService;
  
  @Autowired
  protected EgovPropertyService propertiesService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  /*
   * 사용자 페이지 > 분야별 교육신청 > 교육신청
   */
  @RequestMapping({"/sectorList.do"})
  public String sectorList(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    
	  if(!paramMap.containsKey("site")) {
		  paramMap.put("site", "on");
	  }
	  paramMap.put("sqlName", "getCategoryList1");
	  List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category1list", category1list);
	  
	  if(paramMap.get("site").equals("on")) {
		  switch(paramMap.get("idx").toString()) {
			  case "01":paramMap.put("category1_key", "1");paramMap.put("category2_key", "2"); break;
			  case "02":paramMap.put("category1_key", "2");paramMap.put("category2_key", "3"); break;
			  case "03":paramMap.put("category1_key", "2");paramMap.put("category2_key", "4"); break;
			  case "04":paramMap.put("category1_key", "2");paramMap.put("category2_key", "5"); break;
			  case "05":paramMap.put("category1_key", "2");paramMap.put("category2_key", "6"); break;
		  }
	  }else {
		  switch(paramMap.get("idx").toString()) {
			  case "01":paramMap.put("category1_key", "4");paramMap.put("category2_key", "8"); break;
			  case "02":paramMap.put("category1_key", "5");paramMap.put("category2_key", "9"); break;
			  case "03":paramMap.put("category1_key", "5");paramMap.put("category2_key", "10"); break;
			  case "04":paramMap.put("category1_key", "5");paramMap.put("category2_key", "11"); break;
			  case "05":paramMap.put("category1_key", "5");paramMap.put("category2_key", "12"); break;
		  }
	  }
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getCategoryList3");
	  List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category3list", category3list);
	  
	  paramMap.put("sqlName", "getSectorList");
	  List<Map<String, Object>> list = sectorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getSectorListCnt");
	  int totCnt = sectorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAllAttributes(paramMap);
	  
	  
	  
	  return "sector"+paramMap.get("idx")+"List";
  }
  
  @RequestMapping({"/category2list.do"})
  @ResponseBody
  public List<Map<String, Object>> category2list(@RequestParam Map<String, Object> paramMap) throws Exception {
	    paramMap.put("sqlName", "getCategoryList2");
	    return sectorService.getSelectList(paramMap);
  }
  
  @RequestMapping({"/category2list_opt.do"})
  @ResponseBody
  public List<Map<String, Object>> category2list_opt(@RequestParam Map<String, Object> paramMap) throws Exception {
	    paramMap.put("sqlName", "getCategoryList2_opt");
	    return sectorService.getSelectList(paramMap);
  }
  
  @RequestMapping({"/category3list.do"})
  @ResponseBody
  public List<Map<String, Object>> category3list(@RequestParam Map<String, Object> paramMap) throws Exception {
	    paramMap.put("sqlName", "getCategoryList3");
	    return sectorService.getSelectList(paramMap);
  }
  
  @RequestMapping({"/sectorView.do"})
  public String sectorView(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
		paramMap.put("sqlName", "getSectorView");	
		Map<String, Object> result = sectorService.getSelectData(paramMap);
		model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
		  model.addAttribute("result", result);
	    model.addAllAttributes(paramMap);
		return "sector"+paramMap.get("idx")+"View";
  }
  
  @RequestMapping({"/sectorReq.do"})
  public String sectorReq(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
		paramMap.put("sqlName", "getSectorView");	
		Map<String, Object> result = sectorService.getSelectData(paramMap);
	  	model.addAttribute("result", result);
	  	model.addAttribute("UserAccount", request.getSession().getAttribute("UserAccount"));
	  	model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
		  model.addAllAttributes(paramMap);
		return "sector"+paramMap.get("idx")+"Req";
  }
  
  @RequestMapping({"/sectorSaveCheck.do"})
  @ResponseBody
  public Map<String, Object> sectorSaveCheck(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	      if(paramMap.get("gubun").toString().equals("B")) {
	    	  paramMap.put("sqlName", "getBasketCheck");	
	      }else if(paramMap.get("gubun").toString().equals("R")) {
	    	  paramMap.put("sqlName", "getRegistCheck");	
	      }
	      resultCnt = sectorService.getSelectListCnt(paramMap);
	      
	      if(resultCnt == 0) {
	    	  result.put("result", "SUCCESS");
	      }else {
	    	  result.put("result", "FAIL");	 
	      }
	    } catch (Exception e) {
	      result.put("result", "FAIL");
	    }
	
	    return result;
  }
  
  @RequestMapping({"/sectorSave.do"})
  @ResponseBody
  public Map<String, Object> sectorSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	      if(paramMap.get("gubun").toString().equals("B")) {
	    	  paramMap.put("sqlName", "basketInsert");	
	      }else if(paramMap.get("gubun").toString().equals("R")) {
	    	  paramMap.put("sqlName", "registInsert");	
	      }
	      resultCnt = sectorService.insertData(paramMap);
	      
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