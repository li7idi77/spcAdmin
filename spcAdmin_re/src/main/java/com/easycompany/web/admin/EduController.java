package com.easycompany.web.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.EduService;
import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.vo.CategoryVo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"edu"})
public class EduController
{

  @Autowired
  private EduService eduService;

  @Autowired
  protected EgovPropertyService propertiesService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['file.resources']}")
  private String filleResources;

  @Value("#{dbinfo['file.upload']}")
  private String fileUpload;

  @Value("#{dbinfo['web.path']}")
  private String webPath;
  

  @RequestMapping({"/eduInfoRegList.do"})
  public String getEduInfoRegList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model,HttpServletRequest request)
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

    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
      categoryVo.setGubun2("category");
    }

    List list = this.eduService.getCategoryList(categoryVo);
    model.addAttribute("resultList", list);

    int totCnt = this.eduService.getCategoryCount(categoryVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);
    model.addAttribute("path", request.getServletPath());

    return "eduInfoRegList";
  }

  @RequestMapping({"/eduInfoRegCate.do"})
  public String getEduInfoRegCate(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model,HttpServletRequest request)
    throws Exception
  {
    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
      categoryVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
      categoryVo.setGubun2("category1");
    }

    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
    paginationInfo.setPageSize(categoryVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    categoryVo.setOffset(offset);

    List list = this.eduService.getCategoryList(categoryVo);
    model.addAttribute("resultList", list);

    int totCnt = this.eduService.getCategoryCount(categoryVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);
    model.addAttribute("categoryVo", categoryVo);
    model.addAttribute("path", request.getServletPath());

    return "eduInfoRegCate";
  }

  @RequestMapping({"/eduInfoRegCateSave.do"})
  @ResponseBody
  public CategoryVo eduInfoRegCateSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      categoryVo.setUser_id(loginvo.getUser_id());
      categoryVo.setReg_id(loginvo.getId());
      categoryVo.setUser_nm(loginvo.getUser_nm());

      if ("I".equals(categoryVo.getGubun1()))
      {
        resultCnt = this.eduService.getCategoryExist(categoryVo);

        if (resultCnt == 1) {
          categoryVo.setResult("EXIST");
        } else {
          resultCnt = this.eduService.insertCatgegory(categoryVo);
          categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
        }

      }

      if ("E".equals(categoryVo.getGubun1()))
      {
        resultCnt = this.eduService.updateCategory(categoryVo);
        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
      }

      if ("D".equals(categoryVo.getGubun1())) {
        
        ArrayList<String> fileList = new ArrayList<>();
        List list = this.eduService.getCommonFileList(categoryVo);
    	if (list !=null && list.size() > 0) {
    		for (int i = 0; i < list.size(); i++) {
    			CategoryVo fileCategoryVo  = (CategoryVo) list.get(i);
    			fileList.add(fileCategoryVo.getFile_full_path());
    		}
    	}
    	  
        resultCnt = this.eduService.deleteCategory(categoryVo);
        
        //성공 시 파일 삭제
        if(resultCnt > 0) {
	       	   if (fileList !=null && fileList.size() > 0) {
	       		for (String fileFullPath : fileList) {
	       			FileUtil.deleteFile(request, fileFullPath);
	            }
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

  @RequestMapping({"/eduInfoRegCate3.do"})
  public String getEduInfoRegCate3(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
    throws Exception
  {
    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
      categoryVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
      categoryVo.setGubun2("category3");
    }

    CategoryVo categoryForm = this.eduService.getCategoryDetail(categoryVo);
    
    if (categoryForm != null){
    	categoryVo.setCategory3_key(categoryForm.getCategory3_key());    	
    }
    
    List fileList = this.eduService.getCommonFileList(categoryVo);
    
    model.addAttribute("resultFileList", fileList);
    model.addAttribute("categoryVo",     categoryVo);
    model.addAttribute("categoryForm",   categoryForm);
    model.addAttribute("path",           request.getServletPath());

    return "eduInfoRegCate3";
  }

  @RequestMapping({"/eduInfoRegCate3Save.do"})
  @ResponseBody
  public CategoryVo eduInfoRegCate3Save(@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request, CategoryVo categoryVo) throws Exception
  {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      categoryVo.setUser_id(loginvo.getUser_id());
      categoryVo.setReg_id(loginvo.getId());
      categoryVo.setUser_nm(loginvo.getUser_nm());
      categoryVo.setGubun2("category3");

      String fileAddpath  = this.filePath + File.separator + categoryVo.getGubun2();
      String fileAddpath1 = StringUtil.getSaveFilePath(request, fileUpload, categoryVo.getGubun2());
      
      List<Map<String, Object>> fileSavelist = null;
      ArrayList<String> fileList = new ArrayList<>();
      
      if ("I".equals(categoryVo.getGubun1())) {
    	  
    	if (multipartFile.size() > 0) {
    		fileSavelist = FileUtil.uploadFileMulti(multipartFile, request, fileAddpath); 
    	}     
        resultCnt = this.eduService.insertCatgegory3(categoryVo, fileSavelist);
      }

      if ("E".equals(categoryVo.getGubun1())) {
    	  
    	  //삭제할 리스트 가져오기 why? 파일을 삭제 후는 못 가져옴.
    	  String[] ArraysStr = categoryVo.getCheckdstr().split(",");
    	  if(ArraysStr.length >0){
    		  for (String s : ArraysStr) {
    	        	if(!StringUtil.isEmpty(s)) {
    	        		categoryVo.setFile_seq(Integer.parseInt(s));
    	                CategoryVo fileCategoryVo = this.eduService.getEduCationFile(categoryVo);
    	                fileList.add(fileCategoryVo.getFile_full_path());
    	        	}        	
    	      }   
    	  }
               	 
          
          //파일업로드
    	  if (multipartFile !=null && multipartFile.size() > 0) {
      		fileSavelist = FileUtil.uploadFileMulti(multipartFile, request, fileAddpath); 
      	  }     
    	  //파일 추가, 카테고리 추가
          resultCnt = this.eduService.updateCategory3(categoryVo, fileSavelist);
          
          //성공 시 파일 삭제
          if(resultCnt > 0) {
	       	   if (fileList !=null && fileList.size() > 0) {
	       		for (String fileFullPath : fileList) {
	       			FileUtil.deleteFile(request, fileFullPath);
	            }
	       	  }
	      }
      }

      if ("D".equals(categoryVo.getGubun1())) {
    	  
    	List list = this.eduService.getCommonFileList(categoryVo);
    	if (list !=null && list.size() > 0) {
    		for (int i = 0; i < list.size(); i++) {
    			CategoryVo fileCategoryVo  = (CategoryVo) list.get(i);
    			fileList.add(fileCategoryVo.getFile_full_path());
    		}
    	}
    	  
        resultCnt = this.eduService.deleteCategory(categoryVo);
        
        //성공 시 파일 삭제
        if(resultCnt > 0) {
	       	   if (fileList !=null && fileList.size() > 0) {
	       		for (String fileFullPath : fileList) {
	       			FileUtil.deleteFile(request, fileFullPath);
	            }
	       	  }
	      }
      }

      categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
    }
    catch (Exception e)
    {
      categoryVo.setResult("FAIL");
    }

    return categoryVo;
  }

  @RequestMapping({"/eduInfoScheduleList.do"})
  public String eduInfoScheduleList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));

    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    categoryVo.setUser_id(loginvo.getUser_id());
    categoryVo.setReg_id(loginvo.getId());
    categoryVo.setUser_nm(loginvo.getUser_nm());

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
    paginationInfo.setPageSize(categoryVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    categoryVo.setOffset(offset);

    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
      categoryVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(categoryVo.getCheckdate())) {
      categoryVo.setCheckdate("ALL");
    }

    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
      categoryVo.setGubun2("eduInfoScheduleList");
    }

    List list = this.eduService.getCategoryList(categoryVo);
    model.addAttribute("resultList", list);

    int totCnt = this.eduService.getCategoryCount(categoryVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);
    model.addAttribute("path", request.getServletPath());

    return "eduInfoScheduleList";
  }

  @RequestMapping({"/eduInfoScheduleCate.do"})
  public String eduInfoScheduleCate(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
    throws Exception
  {
    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
      categoryVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
      categoryVo.setGubun2("eduInfoScheduleList");
    }

    CategoryVo categoryForm = this.eduService.getCategoryDetail(categoryVo);

    categoryVo.setGubun3("categorycode1");

    List category1list = this.eduService.getCategoryCodeList(categoryVo);

    model.addAttribute("categoryVo", categoryVo);
    model.addAttribute("category1list", category1list);
    model.addAttribute("categoryForm", categoryForm);
    model.addAttribute("path", request.getServletPath());

    return "eduInfoScheduleCate";
  }

  @RequestMapping({"/eduInfoScheduleCateSave.do"})
  @ResponseBody
  public CategoryVo eduInfoScheduleCateSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      categoryVo.setUser_id(loginvo.getUser_id());
      categoryVo.setReg_id(loginvo.getId());
      categoryVo.setUser_nm(loginvo.getUser_nm());
      categoryVo.setGubun2("category3");

      if ("I".equals(categoryVo.getGubun1()))
      {
        BoardVo fileVo = FileUtil.uploadFile(request, this.filePath);

        categoryVo.setFile_uuid(fileVo.getFile_uuid());
        categoryVo.setFile_name(fileVo.getFile_name());
        categoryVo.setFile_full_path(fileVo.getFile_full_path());
        categoryVo.setFile_size(fileVo.getFile_size());
      //  resultCnt = this.eduService.insertCatgegory3(categoryVo);
      }

      if ("E".equals(categoryVo.getGubun1())) {
        resultCnt = this.eduService.updateCategory(categoryVo);
      }

      if ("D".equals(categoryVo.getGubun1())) {
        resultCnt = this.eduService.deleteCategory(categoryVo);
      }

      categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
    }
    catch (Exception e)
    {
      categoryVo.setResult("FAIL");
    }

    return categoryVo;
  }

  @RequestMapping({"/eduInfoScheduleSave.do"})
  @ResponseBody
  public CategoryVo eduInfoScheduleSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception
  {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      categoryVo.setUser_id(loginvo.getUser_id());
      categoryVo.setReg_id(loginvo.getId());
      categoryVo.setUser_nm(loginvo.getUser_nm());

      if ("I".equals(categoryVo.getGubun1())) {
        resultCnt = this.eduService.insertSchedule(categoryVo);
        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
      }

      if ("E".equals(categoryVo.getGubun1())) {
        resultCnt = this.eduService.updateSchedule(categoryVo);
        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
      }

      if ("A".equals(categoryVo.getGubun1())) {
        String[] ArraysStr = categoryVo.getCheckdstr().split(",");
        for (String s : ArraysStr) {
          categoryVo.setEdu_key(Integer.parseInt(s));
          resultCnt = this.eduService.deleteSchedule(categoryVo);
        }
        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
      }

      if ("D".equals(categoryVo.getGubun1()))
      {
        resultCnt = this.eduService.deleteSchedule(categoryVo);
        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
      }
    }
    catch (Exception e)
    {
      categoryVo.setResult("FAIL");
    }

    return categoryVo;
  }

  @RequestMapping({"/excelDownload.do"})
  public ModelAndView excelDownload(@ModelAttribute("categoryVo") CategoryVo categoryVo)
    throws Exception
  {
	    categoryVo.setRecordCountPerPage(10000);
	    categoryVo.setOffset(0);
	    categoryVo.setGubun1("R");
	    categoryVo.setGubun2("eduInfoScheduleList");
	
	    List list = this.eduService.getCategoryList(categoryVo);
	
	    Map map = new HashMap();
	    map.put("list", list);
	    map.put("filename", categoryVo.getExcelFileName());
	
	    return new ModelAndView("schduleExcelView", map);
  }

  @RequestMapping({"/eduInfoClassList.do"})
  public String eduInfoClassList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("categoryClass");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	      categoryVo.setSite("on");
	    }
	
	    List list = this.eduService.getCategoryList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getCategoryCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoClassList";
  }

  @RequestMapping({"/eduInfoClassCate.do"})
  public String eduInfoClassCate(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request) throws Exception
  {
	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
	      categoryVo.setGubun1("R");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("category4");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	      categoryVo.setSite("on");
	    }
	
	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));
	
	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
	    paginationInfo.setPageSize(categoryVo.getPageSize());
	
	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
	    categoryVo.setOffset(offset);
	
	    List list = this.eduService.getCategoryList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getCategoryCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoClassCate";
  }

  @RequestMapping({"/eduInfoClassCateSave.do"})
  @ResponseBody
  public CategoryVo eduInfoClassCateSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	    int resultCnt = 0;
	    try
	    {
	      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
	
	      categoryVo.setUser_id(loginvo.getUser_id());
	      categoryVo.setReg_id(loginvo.getId());
	      categoryVo.setUser_nm(loginvo.getUser_nm());
	
	      if ("I".equals(categoryVo.getGubun1()))
	      {
	        resultCnt = this.eduService.getCategoryExist(categoryVo);
	
	        if (resultCnt == 1) {
	          categoryVo.setResult("EXIST");
	        } else {
	          resultCnt = this.eduService.insertCatgegory(categoryVo);
	          categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	        }
	
	      }
	
	      if ("E".equals(categoryVo.getGubun1()))
	      {
	        resultCnt = this.eduService.updateCategory(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	
	      if ("D".equals(categoryVo.getGubun1())) {
	        resultCnt = this.eduService.deleteCategory(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	    }
	    catch (Exception e)
	    {
	      categoryVo.setResult("FAIL");
	    }
	
	    return categoryVo;
  }

  @RequestMapping({"/eduInfoCategoryCodeList.do"})
  @ResponseBody
  public List<CategoryVo> eduInfoCategoryCodeList(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	    List category1list = null;
	    try {
	      if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	        categoryVo.setGubun2("eduInfoScheduleList");
	      }
	      if (StringUtil.isEmpty(categoryVo.getSite())) {
	        categoryVo.setSite("on");
	      }
	      category1list = this.eduService.getCategoryCodeList(categoryVo);
	    } catch (Exception e) {
	      categoryVo.setResult("FAIL");
	    }
	
	    return category1list;
  }

  /*
   * 온라인 교육 List
   */
  @RequestMapping({"/eduInfoOnlineList.do"})
  public String eduInfoOnlineList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
	
	    List list = this.eduService.getEducationList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getEducationCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoOnlineList";
  }

  /*
   * 온라인 교육 등록/수정
   */
  @RequestMapping({"/eduInfoOnlineReg.do"})
  public String eduInfoOnlineReg(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request) throws Exception
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
	
	    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
	    model.addAttribute("categoryForm", categoryForm);
	
	    List categoryFormSubList = this.eduService.getEduCationDetailSub(categoryVo);
	    model.addAttribute("categoryFormSubList", categoryFormSubList);
	
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoOnlineReg";
  }

  /*
   * 온라인 교육 저장
   */
  @RequestMapping({"/eduInfoOnlineSave.do"})
  @ResponseBody
  public CategoryVo eduInfoOnlineSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	    int resultCnt = 0;
	    try
	    {
	      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
	
	      categoryVo.setUser_id(loginvo.getUser_id());
	      categoryVo.setReg_id(loginvo.getId());
	      categoryVo.setUser_nm(loginvo.getUser_nm());
	
	      if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	        categoryVo.setGubun2("eduInfoOnline");
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
	        if ("YES".equals(categoryVo.getFileExit())) {
	          BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);
	          categoryVo.setFile_uuid(fileVo.getFile_uuid());
	          categoryVo.setFile_name(fileVo.getFile_name());
	          categoryVo.setFile_full_path(fileVo.getFile_full_path());
	          categoryVo.setFile_size(fileVo.getFile_size());
	          categoryVo.setEdu_notice(fileVo.getFile_uuid());
	        }
	
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

  @RequestMapping({"/eduInfoOfflineList.do"})
  public String eduInfoOfflineList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoOffline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	      categoryVo.setEdu_site("off");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	      categoryVo.setSite("off");
	    }
	
	    categoryVo.setWebPath(this.webPath);
	
	    List list = this.eduService.getEducationList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getEducationCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoOfflineList";
  }

  @RequestMapping({"/eduInfoOfflineReg.do"})
  public String eduInfoOfflineReg(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request) throws Exception
  {
	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
	      categoryVo.setGubun1("R");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoOffline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	      categoryVo.setEdu_site("off");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	      categoryVo.setSite("off");
	    }
	
	    categoryVo.setWebPath(this.webPath);
	    	    
	    //교육분류1
	    categoryVo.setGubun3("categorycode1");
	    List category1list = this.eduService.getCategoryCodeList(categoryVo);
	    model.addAttribute("category1list", category1list);
	
	    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
	    model.addAttribute("categoryForm", categoryForm);
	
	    List categoryFormSubList = this.eduService.getEduCationDetailSub(categoryVo);
	    model.addAttribute("categoryFormSubList", categoryFormSubList);
	
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoOfflineReg";
  }

  @RequestMapping({"/eduInfoOfflineSave.do"})
  @ResponseBody
  public CategoryVo eduInfoOfflineSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	    int resultCnt = 0;
	    try
	    {
	      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
	
	      categoryVo.setUser_id(loginvo.getUser_id());
	      categoryVo.setReg_id(loginvo.getId());
	      categoryVo.setUser_nm(loginvo.getUser_nm());
	
	      if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	        categoryVo.setGubun2("eduInfoOffline");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	        categoryVo.setEdu_site("off");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getSite())) {
	        categoryVo.setSite("off");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getFileExit())) {
	        categoryVo.setFileExit("NO");
	      }
	
	      if ("I".equals(categoryVo.getGubun1()))
	      {
	        resultCnt = this.eduService.insertEducation(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	
	      if ("E".equals(categoryVo.getGubun1())) {
	        resultCnt = this.eduService.updateEduCation(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	
	      if ("D".equals(categoryVo.getGubun1()))
	      {
	        resultCnt = this.eduService.deleteEduCation(categoryVo);
	        categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
	      }
	
	      if ("A".equals(categoryVo.getGubun1())) {
	        String[] ArraysStr = categoryVo.getCheckdstr().split(",");
	        for (String s : ArraysStr) {
	          categoryVo.setEdu_no(Integer.parseInt(s));
	          resultCnt = this.eduService.deleteEduCation(categoryVo);
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

  /*
   * 오프라인 교육[기관외] List
   */
  @RequestMapping({"/eduInfoNoOrglineList.do"})
  public String eduInfoNoOrglineList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoNoOrgline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
		    categoryVo.setEdu_site("nooff");
	    }
		
		if (StringUtil.isEmpty(categoryVo.getSite())) {
		   categoryVo.setSite("off");
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
	
	    return "eduInfoNoOrglineList";
  }

  /*
   * 오프라인 교육[기관외] 등록/수정
   */
  @RequestMapping({"/eduInfoNoOrglineReg.do"})
  public String eduInfoNoOrglineeReg(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request) throws Exception
  {
	    if (StringUtil.isEmpty(categoryVo.getGubun1())) {
	      categoryVo.setGubun1("R");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoNoOrgline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	        categoryVo.setEdu_site("nooff");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	        categoryVo.setSite("off");
	    }
	
	    categoryVo.setWebPath(this.webPath);
	
	    categoryVo.setGubun3("categorycode1");
	    List category1list = this.eduService.getCategoryCodeList(categoryVo);
	    model.addAttribute("category1list", category1list);
	
	    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
	    model.addAttribute("categoryForm", categoryForm);
	
	    List categoryFormSubList = this.eduService.getEduCationDetailSub(categoryVo);
	    model.addAttribute("categoryFormSubList", categoryFormSubList);
	
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "eduInfoNoOrglineReg";
  }

  /*
   * 오프라인 교육[기관외] 교육 저장
   */
  @RequestMapping({"/eduInfoNoOrglineSave.do"})
  @ResponseBody
  public CategoryVo eduInfoNoOrglineSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	    int resultCnt = 0;
	    try
	    {
	      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
	
	      categoryVo.setUser_id(loginvo.getUser_id());
	      categoryVo.setReg_id(loginvo.getId());
	      categoryVo.setUser_nm(loginvo.getUser_nm());
	
	      if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	        categoryVo.setGubun2("eduInfoNoOrgline");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	          categoryVo.setEdu_site("nooff");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getSite())) {
	          categoryVo.setSite("off");
	      }
	
	      if (StringUtil.isEmpty(categoryVo.getFileExit())) {
	        categoryVo.setFileExit("NO");
	      }
	
	      String fileAddpath = this.filePath + File.separator + categoryVo.getGubun2();
	
	      if ("I".equals(categoryVo.getGubun1()))
	      {
	        if ("YES".equals(categoryVo.getFileExit())) {
	          BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);
	          categoryVo.setFile_uuid(fileVo.getFile_uuid());
	          categoryVo.setFile_name(fileVo.getFile_name());
	          categoryVo.setFile_full_path(fileVo.getFile_full_path());
	          categoryVo.setFile_size(fileVo.getFile_size());
	          categoryVo.setEdu_notice(fileVo.getFile_uuid());
	        }
	
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
  
  @RequestMapping({"/excelDownloadOnLine.do"})
  public ModelAndView excelDownloadOnLine(@ModelAttribute("categoryVo") CategoryVo categoryVo)
    throws Exception
  {
	    categoryVo.setRecordCountPerPage(10000);
	    categoryVo.setOffset(0);
	    categoryVo.setGubun1("R");
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoOnline");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
	      categoryVo.setEdu_site("off");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getSite())) {
	      categoryVo.setSite("on");
	    }
	
	    List list = this.eduService.getEducationList(categoryVo);
	
	    Map map = new HashMap();
	    map.put("list", list);
	    map.put("categoryVo", categoryVo);
	    map.put("filename", categoryVo.getExcelFileName());
	
	    return new ModelAndView("onLineEducationExcelView", map);
  }
  
  @RequestMapping({"/fileDownload.do"})
  @ResponseBody
  public void fileDownload(HttpServletRequest request, HttpServletResponse response, CategoryVo categoryVo)
    throws Exception
  {
	CategoryVo fileCategoryVo = this.eduService.getEduCationFile(categoryVo);
	
    BoardVo boardVoForm = new BoardVo();
    boardVoForm.setFile_uuid(fileCategoryVo.getFile_uuid());
    boardVoForm.setFile_name(fileCategoryVo.getFile_name());
    boardVoForm.setFile_full_path(fileCategoryVo.getFile_full_path());
    boardVoForm.setFile_size(fileCategoryVo.getFile_size());	 

    FileUtil.fileDownload(request, response, boardVoForm);
  }
  
  /*
  * 온라인 교육신청 신청자 관리 - 온라인 교육 List
  */
 @RequestMapping({"/eduInfoOnlineMangList.do"})
 public String eduInfoOnlineMangList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
	
	    return "eduInfoOnlineMangList";
 }
 
 /*
  * 온라인 교육신청 신청자 관리 - 온라인 교육 상세  View
  */
 @RequestMapping({"/eduInfoOnlineMangView.do"})
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
	
	    return "eduInfoOnlineMangView";
 }
 
 
  /*
   * 오프라인 교육 관리 List
   */
  @RequestMapping({"/eduInfoMangNoOrglineMang.do"})
  public String eduInfoNoOrglineMangList(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
	
	    if (StringUtil.isEmpty(categoryVo.getGubun2())) {
	      categoryVo.setGubun2("eduInfoMangNoOrglineMang");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
		    categoryVo.setEdu_site("nooff");
	    }
		
		if (StringUtil.isEmpty(categoryVo.getSite())) {
		   categoryVo.setSite("off");
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
	
	    return "eduInfoMangNoOrglineMangList";
  }
  
  
  /*
   * 온라인 교육신청 신청자 관리 - 온라인 교육 상세  View
   */
  @RequestMapping({"/eduInfoMangNoOrglineMangView.do"})
  public String eduInfoMangNoOrglineMangView(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)
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
 	    
 	    categoryVo.setGubun2("eduInfoMangNoOrglineMangView");
 	    
 	    if (StringUtil.isEmpty(categoryVo.getEdu_site())) {
		    categoryVo.setEdu_site("nooff");
	    }
		
		if (StringUtil.isEmpty(categoryVo.getSite())) {
		   categoryVo.setSite("off");
		}
 	  
 	    categoryVo.setWebPath(this.webPath);
 	
 	
 	    List list = this.eduService.getEducationList(categoryVo);
 	    model.addAttribute("resultList", list);
 	
 	    int totCnt = this.eduService.getEducationCount(categoryVo);
 	    paginationInfo.setTotalRecordCount(totCnt);
 	    model.addAttribute("paginationInfo", paginationInfo);
 	    model.addAttribute("categoryVo", categoryVo);
 	    model.addAttribute("path", request.getServletPath());
 	
 	    return "eduInfoMangNoOrglineMangView";
  }
  
  /*
   * 오프라인 교육 등록 > 기관명 검색 팝업
   */
  @RequestMapping({"/orgPopSearch.do"})
  public String orgPopSearch(@ModelAttribute("categoryVo") CategoryVo categoryVo, ModelMap model ,HttpServletRequest request)  throws Exception
  {
	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));
	
	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
	    paginationInfo.setPageSize(categoryVo.getPageSize());
	
	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
	    categoryVo.setOffset(offset);
	
	
	    categoryVo.setGubun2("orgPopSearch");
		categoryVo.setWebPath(this.webPath);
	
		//공통 지역 코드 가져오기
	    categoryVo.setGubun3("commonCode");
	    categoryVo.setUp_cd_no("32");	    
	    List arealist = this.eduService.getCategoryCodeList(categoryVo);
	    model.addAttribute("arealist", arealist);
	
	    List list = this.eduService.getEducationList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getEducationCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	
	    return "orgPopSearch";
  }
}