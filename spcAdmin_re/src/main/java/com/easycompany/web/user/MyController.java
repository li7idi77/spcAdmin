package com.easycompany.web.user;

import java.time.LocalDate;
import java.util.ArrayList;
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

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.MyService;
import com.easycompany.service.SectorService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"my"})
public class MyController
{

  @Autowired
  private MyService myService;
  
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
  @RequestMapping({"/my01info.do"})
  public String my01info(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my01info";
  }

  @RequestMapping({"/my01cart.do"})
  public String my01cart(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  String[] cate1List = {"1","4","7"};
	  paramMap.put("category1_key_arr", cate1List);
	  paramMap.put("sqlName", "getCartList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getCartListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my01cart";
  }
  
  @RequestMapping({"/cartDel.do"})
  @ResponseBody
  public String cartDel(HttpServletRequest request, @RequestParam(value="basket_no[]") List<Long> basketList, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
			paramMap.put("basketList", basketList); 
			paramMap.put("sqlName", "deleteCart"); 
			resultCnt = myService.deleteData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
  
  @RequestMapping({"/courDel.do"})
  @ResponseBody
  public String courDel(HttpServletRequest request, @RequestParam(value="cour_no[]") List<Long> courList, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
			paramMap.put("courList", courList); 
			paramMap.put("sqlName", "deleteCour"); 
			resultCnt = myService.deleteData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
  
  @RequestMapping({"/my01status.do"})
  public String my01status(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
		  paramMap.put("category1_key", "1");
	  }else {
		  if(paramMap.get("site").toString().equals("on")) {
			  paramMap.put("category1_key", "1");
		  }else {
			  if(!paramMap.containsKey("category1_key")) {
				  paramMap.put("category1_key", "4");
			  }
		  }
	  }
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getStatusList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getStatusListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my01status";
  }
  
  @RequestMapping({"/my01edu.do"})
  public String my01edu(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  if(!paramMap.containsKey("site")) {
		  paramMap.put("site", "on");
		  paramMap.put("category1_key", "1");
	  }else {
		  if(paramMap.get("site").toString().equals("on")) {
			  paramMap.put("category1_key", "1");
		  }else {
			  if(!paramMap.containsKey("category1_key")) {
				  paramMap.put("category1_key", "4");
			  }
		  }
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);

	  paramMap.put("sqlName", "getEduAllCnt");
	  Map<String, Object> allCount = myService.getSelectData(paramMap);
	  model.addAttribute("allCount", allCount);
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getEduList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getEduListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my01edu";
  }
  
  @RequestMapping({"/my01warrant.do"})
  public String my01warrant(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  if(!paramMap.containsKey("site")) {
		  paramMap.put("site", "on");
	  }
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	    	  
	  if(paramMap.get("site").equals("on")) {
		  paramMap.put("category1_key", "1");
	  }else if(paramMap.get("site").equals("off")){
		  paramMap.put("category1_key", "4");
	  }else {
		  paramMap.put("category1_key", "7");
	  }
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getWarrantList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getWarrantListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my01warrant";
  }
  
  @RequestMapping({"/popMyWarrant.do"})
  public String popMyWarrant(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  paramMap.put("sqlName", "getMyWarrant");
	  Map<String, Object> result = myService.getSelectData(paramMap);
	  model.addAttribute("result", result);
	  if(result.get("LICENSE_GUBUN").toString().equals("번호") && result.get("LICENSE_CHK") != null) {
		  if(!result.containsKey("LICENSE_PBL_DATE")) {
			  paramMap.put("sqlName", "myWarrantUpdate");	
		      myService.updateData(paramMap);
		  }
	  }
	  
	  if(result.get("LICENSE_GUBUN").toString().equals("일반")) {
		  if(!result.containsKey("LICENSE_PBL_DATE")) {
			  paramMap.put("sqlName", "myWarrantUpdate");	
		      myService.updateData(paramMap);
		  }
	  }
      
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  if(result.get("LICENSE_GUBUN").toString().equals("일반")) {
		  return "popMyWarrant";
	  }else {
		  return "popMyWarrantNum";
	  }
  }
  
  @RequestMapping({"/popMyWarrantNum.do"})
  public String popMyWarrantNum(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  paramMap.put("sqlName", "getMyWarrant");
	  model.addAttribute("result", myService.getSelectData(paramMap));
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	  return "popMyWarrantNum";
  }
  
  @RequestMapping({"/my01mylist.do"})
  public String my01mylist(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  paramMap.put("sqlName", "getMyList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getMyListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my01mylist";
  }
  
  @RequestMapping({"/popMyClass.do"})
  public String popMyClass(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  paramMap.put("sqlName", "getEduIngList");
	  List<Map<String, Object>> ingList = myService.getSelectList(paramMap);
	  model.addAttribute("ingList", ingList);
	  
	  paramMap.put("sqlName", "getEduEndList");
	  List<Map<String, Object>> endList = myService.getSelectList(paramMap);
	  model.addAttribute("endList", endList);
	  
	  LocalDate today = LocalDate.now();
	  paramMap.put("today", today);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	    return "popMyClass";
  }
  
  @RequestMapping({"/popMyClassDetail.do"})
  public String popMyClassDetail(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  paramMap.put("sqlName", "getCourInfo");
	  model.addAttribute("result", myService.getSelectData(paramMap));
	  
	  paramMap.put("sqlName", "getCourSecList");
	  List<Map<String, Object>> resultList = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", resultList);
	  
	  LocalDate today = LocalDate.now();
	  paramMap.put("today", today);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	    return "popMyClassDetail";
  }
  
  @RequestMapping({"/popMyPlayer.do"})
  public String popMyPlayer(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model ,HttpServletRequest request)  throws Exception {
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  paramMap.put("sqlName", "getOnclassTime");
	  model.addAttribute("result", myService.getSelectData(paramMap));
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	
	    return "popMyPlayer";
  }
  
  @RequestMapping({"/onclassUpdate.do"})
  @ResponseBody
  public Map<String, Object> sectorSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	      paramMap.put("sqlName", "onclassUpdate");	
	      resultCnt = myService.updateData(paramMap);
	      
	      paramMap.put("sqlName", "onclassFinishCheck");
	      Map<String, Object> cntMap = myService.getSelectData(paramMap);
	      if(cntMap.get("ALLCNT").toString().equals(cntMap.get("CNT").toString())) {
	    	  paramMap.put("sqlName", "onclassFinish");	
		      resultCnt = myService.updateData(paramMap);
	      }
	      
	      if(resultCnt < 1) {
	    	  result.put("result", "SUCCESS");
	      }else {
	    	  result.put("result", "FAIL");	 
	      }
	    } catch (Exception e) {
	      result.put("result", "FAIL");
	    }
	
	    return result;
  }
  
  @RequestMapping({"/my02info.do"})
  public String my02info(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my02info";
  }

  @RequestMapping({"/my02act.do"})
  public String my02act(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  paramMap.put("sqlName", "getAreaList");
	  List<Map<String, Object>> areaList = myService.getSelectList(paramMap);
	  model.addAttribute("areaList", areaList);
	    
	  paramMap.put("sqlName", "getInsActList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsActListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my02act";
  }
  
  @RequestMapping({"/my02absence.do"})
  public String my02absence(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  	    
	  paramMap.put("sqlName", "getInsLeaveList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsLeaveListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my02absence";
  }
  
  @RequestMapping({"/deleteInsLeave.do"})
  @ResponseBody
  public String deleteInsLeave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
			paramMap.put("sqlName", "deleteInsLeave"); 
			resultCnt = myService.deleteData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
  
  @RequestMapping({"/my02edu.do"})
  public String my02edu(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  	    
	  paramMap.put("sqlName", "getInsEduList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsEduListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my02edu";
  }
  
  @RequestMapping({"/deleteInsEdu.do"})
  @ResponseBody
  public String deleteInsEdu(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
			paramMap.put("sqlName", "deleteInsEdu"); 
			resultCnt = myService.deleteData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
  
  @RequestMapping({"/my02warrant.do"})
  public String my02warrant(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  if(!paramMap.containsKey("site")) {
		  paramMap.put("site", "on");
	  }
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	    	  
	  if(paramMap.get("site").equals("on")) {
		  paramMap.put("category1_key", "3");
	  }else if(paramMap.get("site").equals("off")){
		  paramMap.put("category1_key", "8");
	  }else {
		  paramMap.put("category1_key", "7");
	  }
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getWarrantList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getWarrantListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my02warrant";
  }
  
  @RequestMapping({"/my02mylist.do"})
  public String my02mylist(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  paramMap.put("sqlName", "getMyList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getMyListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my02mylist";
  }
  
  @RequestMapping({"/my03info.do"})
  public String my03info(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my03info";
  }

  @RequestMapping({"/my03cart.do"})
  public String my03cart(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  String[] cate1List = {"2","5","7"};
	  paramMap.put("category1_key_arr", cate1List);
	  paramMap.put("sqlName", "getCartList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getCartListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my03cart";
  }
    
  @RequestMapping({"/my03status.do"})
  public String my03status(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
		  paramMap.put("category1_key", "2");
	  }else {
		  if(paramMap.get("site").toString().equals("on")) {
			  paramMap.put("category1_key", "2");
		  }else {
			  if(!paramMap.containsKey("category1_key")) {
				  paramMap.put("category1_key", "5");
			  }
		  }
	  }
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getStatusList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getStatusListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my03status";
  }
  
  @RequestMapping({"/my03edu.do"})
  public String my03edu(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("pageSize", 10);
	  paramMap.put("recordCountPerPage", 10);
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
	  }
	  if(!paramMap.containsKey("site")) {
		  paramMap.put("site", "on");
		  paramMap.put("category1_key", "2");
	  }else {
		  if(paramMap.get("site").toString().equals("on")) {
			  paramMap.put("category1_key", "2");
		  }else {
			  if(!paramMap.containsKey("category1_key")) {
				  paramMap.put("category1_key", "5");
			  }
		  }
	  }
	  PaginationInfo paginationInfo = new PaginationInfo();
	  paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
	  paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
	  paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	  
	  paramMap.put("sqlName", "getEduAllCnt");
	  Map<String, Object> allCount = myService.getSelectData(paramMap);
	  model.addAttribute("allCount", allCount);
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getEduList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getEduListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my03edu";
  }
  
  @RequestMapping({"/my03warrant.do"})
  public String my03warrant(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  if(!paramMap.containsKey("site")) {
		  paramMap.put("site", "on");
	  }
	  
	  int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
	  paramMap.put("offset",offset);
	    	  
	  if(paramMap.get("site").equals("on")) {
		  paramMap.put("category1_key", "2");
	  }else if(paramMap.get("site").equals("off")){
		  paramMap.put("category1_key", "5");
	  }else {
		  paramMap.put("category1_key", "7");
	  }
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getWarrantList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getWarrantListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my03warrant";
  }
  
  @RequestMapping({"/my03mylist.do"})
  public String my03mylist(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  paramMap.put("sqlName", "getMyList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getMyListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my03mylist";
  }
  
  @RequestMapping({"/my04info.do"})
  public String my04info(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04info";
  }
  
  @RequestMapping({"/my04app.do"})
  public String my04app(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  paramMap.put("category1_key", "7");
	  
	  paramMap.put("sqlName", "getCategoryList2");
	  List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category2list", category2list);
	  
	  paramMap.put("sqlName", "getOrgEduList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getOrgEduListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04app";
  }
  
  @RequestMapping(value = "/my04appCancel.do")
	@ResponseBody
	public Map<String, Object> my04appCancel(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		    
		    paramMap.put("sqlName", "my04appDelete");	
		    resultCnt = myService.deleteData(paramMap);
		    
		    paramMap.put("sqlName", "my04appDeleteDtl");	
		    resultCnt = myService.deleteData(paramMap);
		    
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
  
  @RequestMapping({"/my04insSel.do"})
  public String my04insSel(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "geInsSelList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geInsSelListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04insSel";
  }
  
  @RequestMapping({"/my04eduApp.do"})
  public String my04eduApp(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "geEduAppList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geEduAppListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04eduApp";
  }
  
  @RequestMapping({"/my04eduAppDetail.do"})
  public String my04eduAppDetail(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "geEduAppUserList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geEduAppUserListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04eduAppDetail";
  }
  
  @RequestMapping({"/my04eduResult.do"})
  public String my04eduResult(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "geEduResultList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geEduResultListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04eduResult";
  }
  
  @RequestMapping({"/my04eduResultDetail.do"})
  public String my04eduResultDetail(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "geEduResultUserList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "geEduResultUserListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04eduResultDetail";
  }
  
  @RequestMapping({"/my04mylist.do"})
  public String my04mylist(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	    	  
	  paramMap.put("sqlName", "getMyList");
	  List<Map<String, Object>> list = myService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getMyListCnt");
	  int totCnt = myService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "my04mylist";
  }
}