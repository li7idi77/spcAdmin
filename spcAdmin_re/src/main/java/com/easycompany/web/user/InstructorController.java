package com.easycompany.web.user;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.easycompany.cmm.util.EgovFileScrty;
import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.InstructorService;
import com.easycompany.service.LmsService;
import com.easycompany.service.SectorService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"user"})
public class InstructorController
{

  @Autowired
  private InstructorService instructorService;
  
  @Autowired
  private LmsService lmsService;
  
  @Autowired
  private SectorService sectorService;
  
  @Autowired
  protected EgovPropertyService propertiesService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  
  @RequestMapping({"/instructor01List.do"})
  public String instructor01List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  paramMap.put("board_type","05"); 	  
	  paramMap.put("sqlName", "getBoardList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getBoardCount");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  
	  
	  return "instructor01List";
  }
  
  @RequestMapping({"/instructor01View.do"})
  public String instructor01View(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	    paramMap.put("board_type","05"); 	 
	    paramMap.put("sqlName", "getBoardView");	
		Map<String, Object> result = instructorService.getSelectData(paramMap);
	  	model.addAttribute("result", result);
		model.addAttribute("path", request.getServletPath());
	    model.addAllAttributes(paramMap);
		return "instructor01View";
  }
  
  @RequestMapping({"/instructor02List.do"})
  public String instructor02List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  paramMap.put("board_type","06"); 	  
	  paramMap.put("sqlName", "getBoardList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getBoardCount");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructor02List";
  }
  
  @RequestMapping({"/instructor02View.do"})
  public String instructor02View(@RequestParam Map<String, Object> paramMap, ModelMap model ,HttpServletRequest request) throws Exception {
	    paramMap.put("board_type","06"); 	 
	    paramMap.put("sqlName", "getBoardView");	
		Map<String, Object> result = instructorService.getSelectData(paramMap);
	  	model.addAttribute("result", result);
		model.addAttribute("path", request.getServletPath());
	    model.addAllAttributes(paramMap);
		return "instructor02View";
  }
  
  @RequestMapping({"/instructor03List.do"})
  public String instructor03List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "getCodeList");
	  paramMap.put("code","32");
	  List<Map<String, Object>> codeList = instructorService.getSelectList(paramMap);
	  model.addAttribute("codeList", codeList);
	  
	  paramMap.put("sqlName", "getInsActList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsActListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  
	  
	  return "instructor03List";
  }
  
  @RequestMapping({"/instructor03Save.do"})
  @ResponseBody
  public Map<String, Object> instructor03Save(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));

	      paramMap.put("sqlName", "instructor03Save");	
	      resultCnt = instructorService.insertData(paramMap);
	      
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
  
  @RequestMapping({"/instructor04List.do"})
  public String instructor04List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  
	  paramMap.put("sqlName", "getMyEduInfo");	
	  Map<String, Object> result = instructorService.getSelectData(paramMap);
	  model.addAttribute("result", result);
	  
	  paramMap.put("sqlName", "getMyEduAuthList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  	
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructor04List";
  }
  
  @RequestMapping({"/instructor04lecture.do"})
  public String instructor04lecture(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  
	  paramMap.put("sqlName", "getCodeList");
	  paramMap.put("code","32");
	  List<Map<String, Object>> codeList = instructorService.getSelectList(paramMap);
	  model.addAttribute("codeList", codeList);
	  
	  paramMap.put("sqlName", "getCategoryList1");
	  paramMap.put("site","off");
	  List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
	  model.addAttribute("category1list", category1list);
	  
	  paramMap.put("sqlName", "getInsLectureAllCnt");
	  Map<String, Object> allCount = instructorService.getSelectData(paramMap);
	  model.addAttribute("allCount", allCount);
	  
	  paramMap.put("sqlName", "getInsLectureList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsLectureListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructor04lecture";
  }
  
  @RequestMapping({"/instructor04absence.do"})
  public String instructor04absence(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
	  paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));
	  
	  /*paramMap.put("sqlName", "getInsUserData");	
	  Map<String, Object> result = instructorService.getSelectData(paramMap);
	  model.addAttribute("result", result);*/
	  	  	
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructor04absence";
  }
  
  @RequestMapping({"/instructor04Save.do"})
  @ResponseBody
  public Map<String, Object> instructor04Save(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, @RequestParam("file1") MultipartFile file1) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));

		  String fileAddpath  = this.filePath + File.separator + paramMap.get("file_gubun");
		  Map<String, Object> fileSave = null;
		  
		  paramMap.put("sqlName", "instructor04Save");	
	      resultCnt = instructorService.insertData(paramMap); 
	      
		    if (file1 != null) {
		    	if(file1.getSize() > 0) {
		    		paramMap.put("object_id", paramMap.get("INSTRUCTOR_LEAVE_IDX")); 
		    		fileSave = FileUtil.uploadFile(file1, fileAddpath, request); 
			    	resultCnt = this.lmsService.insertCommonFile(paramMap, fileSave, 1);
		    	}
	    	}     
	      
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
  
  @RequestMapping({"/instructor05List.do"})
  public String instructor05List(@RequestParam Map<String, Object> paramMap, DefaultVO vo, ModelMap model, HttpServletRequest request) throws Exception{
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
	  	  
	  if(!paramMap.containsKey("tapNo")) {
		  paramMap.put("tapNo", "1");
	  }
	  
	  paramMap.put("sqlName", "getInsEduAppList");
	  List<Map<String, Object>> list = instructorService.getSelectList(paramMap);
	  model.addAttribute("resultList", list);
	  
	  paramMap.put("sqlName", "getInsEduAppListCnt");
	  int totCnt = instructorService.getSelectListCnt(paramMap);
	  model.addAttribute("totCnt", totCnt);
	  paginationInfo.setTotalRecordCount(totCnt);
	  
	  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
	  model.addAttribute("paginationInfo", paginationInfo);
	  model.addAttribute("path", request.getServletPath());
	  model.addAllAttributes(paramMap);
	  
	  return "instructor05List";
  }
  
  @RequestMapping({"/instructor05Save.do"})
  @ResponseBody
  public Map<String, Object> instructor05Save(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
	    int resultCnt = 0;
	    Map<String, Object> result = new HashMap<String, Object>();
	    try {
	      paramMap.put("UserAccount", request.getSession().getAttribute("UserAccount"));

	      paramMap.put("sqlName", "instructor05Save");	
	      resultCnt = instructorService.insertData(paramMap); 
	      
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