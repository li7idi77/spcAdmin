package com.easycompany.web.admin;

import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.util.StringUtil;
import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.EduService;
import com.easycompany.service.LmsService;
import com.easycompany.service.OrgMngService;
import com.easycompany.service.SectorService;
import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.vo.CategoryVo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"orgMng"})
public class OrgMngController
{

  @Autowired
  private OrgMngService orgMngService;
  
  @Autowired
  private EduService eduService;
  
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

  
  @RequestMapping({"/orgOnlineList.do"})
  public String orgOnlineList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
    throws Exception
  {
	  //paramMap.put("site","on");
	  //paramMap.put("category1_key","9");
	  //paramMap.put("category2_key","16");
	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));
	
	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
	    paginationInfo.setPageSize(categoryVo.getPageSize());
	
	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
	    categoryVo.setOffset(offset);
	    categoryVo.setCategory1_key(9);
	    categoryVo.setCategory2_key(16);
	    
	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
	      categoryVo.setGubun1("R");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoOnline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	        categoryVo.setEdu_site("on");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	        categoryVo.setSite("on");
	    }
	    
	    categoryVo.setWebPath(this.webPath);
	
	    categoryVo.setGubun3("categorycode3");
	    List category3list = this.eduService.getCategoryCodeList(categoryVo);
	    model.addAttribute("category3list", category3list);
	
	    List list = this.eduService.getEducationList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getEducationCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
			
	  return "orgOnlineList";
  }
  
  @RequestMapping({"/orgOnlineReq.do"})
  public String eduStatustMod(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request) throws Exception
  {
	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
	      categoryVo.setGubun1("R");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoOnline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	        categoryVo.setEdu_site("on");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	        categoryVo.setSite("on");
	    }
	
	    categoryVo.setWebPath(this.webPath);
	
	    categoryVo.setGubun3("categorycode1");
	    List category1list = this.eduService.getCategoryCodeList(categoryVo);
	    model.addAttribute("category1list", category1list);
	    
	    if(categoryVo.getEdu_no() != 0) {
	    	CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
		    model.addAttribute("categoryForm", categoryForm);
		
		    List categoryFormSubList = this.eduService.getEduCationDetailSub(categoryVo);
		    model.addAttribute("categoryFormSubList", categoryFormSubList);
	    }
	
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	  return "orgOnlineReq";
  }
  
  @RequestMapping({"/orgOnlineSave.do"})
  @ResponseBody
  public CategoryVo orgOnlineSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	  int resultCnt = 0;
	    try
	    {
	      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
	
	      categoryVo.setUser_id(loginvo.getUser_id());
	      categoryVo.setReg_id(loginvo.getId());
	      categoryVo.setUser_nm(loginvo.getUser_nm());
	
	      if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	        categoryVo.setGubun2("eduInfoOnline2");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	          categoryVo.setEdu_site("on");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getSite())) {
	          categoryVo.setSite("on");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getFileExit())) {
	        categoryVo.setFileExit("NO");
	      }
	
	      String fileAddpath = this.filePath + File.separator + categoryVo.getGubun2();
	
	      if ("I".equals(categoryVo.getGubun1()))
	      {
    	    resultCnt = this.eduService.getCategoryExist(categoryVo);
    		
	        if (resultCnt == 1) {
	          categoryVo.setResult("EXIST");
	        } else {
	          categoryVo.setGubun2("category6");
	          resultCnt = this.eduService.insertCatgegory(categoryVo);
	          categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	        }
	        if ("YES".equals(categoryVo.getFileExit())) {
	          BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);
	          categoryVo.setFile_uuid(fileVo.getFile_uuid());
	          categoryVo.setFile_name(fileVo.getFile_name());
	          categoryVo.setFile_full_path(fileVo.getFile_full_path());
	          categoryVo.setFile_size(fileVo.getFile_size());
	          categoryVo.setEdu_notice(fileVo.getFile_uuid());
	        }
	        categoryVo.setGubun2("eduInfoOnline2");
	        resultCnt = this.eduService.insertEducation(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	
	      if ("E".equals(categoryVo.getGubun1()))
	      {
	    	 CategoryVo fileCategoryVo = this.eduService.getEduCationFile(categoryVo);
	    	 
	         String fileFullPath = "";
	         
	         if( fileCategoryVo !=null) {
	        	 fileFullPath = fileCategoryVo.getFile_full_path();
	         }
	         if ("YES".equals(categoryVo.getFileExit())) {
	          BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);
	          categoryVo.setFile_uuid(fileVo.getFile_uuid());
	          categoryVo.setFile_name(fileVo.getFile_name());
	          categoryVo.setFile_full_path(fileVo.getFile_full_path());
	          categoryVo.setFile_size(fileVo.getFile_size());
	        }
	
	        resultCnt = this.eduService.updateEduCation(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	
	        if ((resultCnt > 0) && ("YES".equals(categoryVo.getFileExit())))
	        {
	          if ((fileFullPath != null) && (fileFullPath.length() > 3))
	          {
	            FileUtil.deleteFile(request, fileFullPath);
	          }
	
	        }
	
	      }
	
	      if ("D".equals(categoryVo.getGubun1())) {
	    	  
	    	 CategoryVo fileCategoryVo = this.eduService.getEduCationFile(categoryVo);
		    	 
			 String fileFullPath = "";
			     
		     if( fileCategoryVo !=null) {
		    	 fileFullPath = fileCategoryVo.getFile_full_path();
		     }
			resultCnt = this.eduService.deleteEduCation(categoryVo);
			if ((fileFullPath != null) && (fileFullPath.length() > 3)) {
			  FileUtil.deleteFile(request, fileFullPath);
			}
			categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	
	      if ("A".equals(categoryVo.getGubun1())) {
	        String[] ArraysStr = categoryVo.getCheckdstr().split(",");
	        for (String s : ArraysStr) {
	          categoryVo.setEdu_no(Integer.parseInt(s));
	          CategoryVo fileCategoryVo = this.eduService.getEduCationFile(categoryVo);
		      String fileFullPath = "";
	          if( fileCategoryVo !=null) {
	        	  fileFullPath = fileCategoryVo.getFile_full_path();
	          }
	          resultCnt = this.eduService.deleteEduCation(categoryVo);
	          if ((fileFullPath != null) && (fileFullPath.length() > 3)) {
	            FileUtil.deleteFile(request, fileFullPath);
	          }
	        }
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	    }
	    catch (Exception e)
	    {
	      categoryVo.setResult("FAIL");
	    }
	
	    return categoryVo;
  }
    
  @RequestMapping(value = "/orgOnContentsList.do")
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
		
		  paramMap.put("sqlName", "getCategoryList3");
		  paramMap.put("site","on");
		  paramMap.put("category1_key","9");
		  paramMap.put("category2_key","16");
		  paramMap.put("searchCondition","CATEGORY");
		  
		  List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		  model.addAttribute("category3list", category3list);
		  
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

		return "orgOnContentsList";
	}
	
	@RequestMapping(value = "/orgOnContentsReq.do")
	public String noticeReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("sqlName", "selectDetailLms");	
		Map<String, Object> result = lmsService.getSelectData(paramMap);
		model.addAttribute("result", result);  
	  	model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		
		return "orgOnContentsReq";
	}
	
	@RequestMapping(value = "/orgOnContentsSave.do")
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
	
  @RequestMapping({"/orgOnContentsDel.do"})
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
  
  @RequestMapping({"/orgOnAppUserList.do"})
  public String orgOnAppUserList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
    throws Exception
  {
 	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
 	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));
 	
 	    PaginationInfo paginationInfo = new PaginationInfo();
 	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
 	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
 	    paginationInfo.setPageSize(categoryVo.getPageSize());
 	
 	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
 	    categoryVo.setOffset(offset);
	    categoryVo.setCategory1_key(9);
	    categoryVo.setCategory2_key(16);
 	
 	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
 	      categoryVo.setGubun1("R");
 	    }
 	
 	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
 	      categoryVo.setGubun2("eduInfoOnlineMangList");
 	    }
 	
 	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
 	        categoryVo.setEdu_site("on");
 	    }
 	
 	    if (StringUtil.isEmpty(categoryVo.getSite())) {
 	        categoryVo.setSite("on");
 	    }
 	  
 	    categoryVo.setWebPath(this.webPath);
 	
 	    categoryVo.setGubun3("categorycode1");
 	    List category1list = this.eduService.getCategoryCodeList(categoryVo);
 	    model.addAttribute("category1list", category1list);
 	
 	    List list = this.eduService.getEducationList(categoryVo);
 	    model.addAttribute("resultList", list);
 	
 	    int totCnt = this.eduService.getEducationCount(categoryVo);
 	    paginationInfo.setTotalRecordCount(totCnt);
 	    model.addAttribute("paginationInfo", paginationInfo);
 	    model.addAttribute("categoryVo", categoryVo);
 	    model.addAttribute("path", request.getServletPath());
 	
 	    return "orgOnAppUserList";
  }
  
  @RequestMapping({"/orgOnAppUserView.do"})
  public String eduInfoOnlineMangView(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
    throws Exception
  {
 	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
 	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));
 	
 	    PaginationInfo paginationInfo = new PaginationInfo();
 	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
 	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
 	    paginationInfo.setPageSize(categoryVo.getPageSize());
 	
 	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
 	    categoryVo.setOffset(offset);
 	
 	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
 	      categoryVo.setGubun1("R");
 	    }
 	    
 	    if (StringUtil.isEmpty(categoryVo.getUser_nm())) {
 	    	categoryVo.setUser_nm("");
 		}
 	    
 	    categoryVo.setGubun2("eduInfoOnlineMangView");
 	    
 	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
 	        categoryVo.setEdu_site("on");
 	    }
 	
 	    if (StringUtil.isEmpty(categoryVo.getSite())) {
 	        categoryVo.setSite("on");
 	    }
 	  
 	    categoryVo.setWebPath(this.webPath);
 	
 	
 	    List list = this.eduService.getEducationList(categoryVo);
 	    model.addAttribute("resultList", list);
 	
 	    int totCnt = this.eduService.getEducationCount(categoryVo);
 	    paginationInfo.setTotalRecordCount(totCnt);
 	    model.addAttribute("paginationInfo", paginationInfo);
 	    model.addAttribute("categoryVo", categoryVo);
 	    model.addAttribute("path", request.getServletPath());
 	
 	    return "orgOnAppUserView";
  }
  
  @RequestMapping(value = "/orgOnStudentList.do")
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
		
		  paramMap.put("sqlName", "getCategoryList1");
		  paramMap.put("site","on");
		  List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		  model.addAttribute("category1list", category1list);
		  
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
		  
		return "orgOnStudentList";
	}
	
	@RequestMapping(value = "/orgOnStudentLearn.do")
	public String studentLearn(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
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
				  
		  paramMap.put("sqlName", "studentLearnList");
		  List<Map<String, Object>> list = lmsService.getSelectList(paramMap);
		  model.addAttribute("resultList", list);
			
		  paramMap.put("sqlName", "studentLearnListCnt");
		  int totCnt = lmsService.getSelectListCnt(paramMap);
		  model.addAttribute("totCnt", totCnt);
		  paginationInfo.setTotalRecordCount(totCnt);
		
		  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
		  model.addAttribute("paginationInfo", paginationInfo);
		  model.addAttribute("path", request.getServletPath());
		  model.addAllAttributes(paramMap);
		  
		return "orgOnStudentLearn";
	}
	
	@RequestMapping(value = "/orgOnStudentGraduate.do")
	public String studentGraduate(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
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
		  
		  paramMap.put("sqlName", "studentGraduateList");
		  List<Map<String, Object>> list = lmsService.getSelectList(paramMap);
		  model.addAttribute("resultList", list);
			
		  paramMap.put("sqlName", "studentGraduateListCnt");
		  int totCnt = lmsService.getSelectListCnt(paramMap);
		  model.addAttribute("totCnt", totCnt);
		  paginationInfo.setTotalRecordCount(totCnt);
		
		  model.addAttribute("sessionId", request.getSession().getAttribute("UserAccount"));
		  model.addAttribute("paginationInfo", paginationInfo);
		  model.addAttribute("path", request.getServletPath());
		  model.addAllAttributes(paramMap);
		  
		return "orgOnStudentGraduate";
	}

	@RequestMapping(value = "/orgOnStudentDel.do")
	@ResponseBody
	public String studentDel(HttpServletRequest request, @RequestParam(value="courNoArray[]") List<String> courNoArray, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {
			LoginVo loginvo = (LoginVo) WebUtils.getSessionAttribute(request, "AdminAccount");
			/*List<Long> boardIdxList = new ArrayList<Long>();
			
			for(String idxStr : boardIdxStrArray){
				boardIdxList.add(Long.parseLong(idxStr));
			}
			
		    HashMap<String, Object> map = new HashMap<String, Object>();
		    map.put("boardIdxList", boardIdxList);*/
			paramMap.put("courNoArrayList", courNoArray); 
		    paramMap.put("sqlName", "studentDel");
		    resultCnt = lmsService.deleteData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		    
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
}