package com.easycompany.web.user;

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
import org.springframework.web.util.WebUtils;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.util.StringUtil;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.AdBoardService;
import com.easycompany.service.EduService;
import com.easycompany.service.MainService;
import com.easycompany.service.vo.AdBoardVo;
import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.vo.CategoryVo;
import com.easycompany.service.vo.MainVo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({"user"})
public class WebMainController
{

  @Autowired
  private MainService mainService;
  
  @Autowired
  private EduService eduService;
  
  @Autowired
  private AdBoardService adBoardService;

  @Autowired
  protected EgovPropertyService propertiesService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  /*
   * 사용자 페이지 메인 페이지
   */
  @RequestMapping({"/webMain.do"})
  public String webMain(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception {
	  
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
   
    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }
    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("logo");
    }
    mainVo.setWebPath(this.webPath);
    
    //logo  가져오기
    mainVo.setGubun2("logo");
    MainVo logoForm = this.mainService.getCommonDetail(mainVo);
    logoForm.setWebPath(this.webPath);
    logoForm.setGubun2("logo");
    model.addAttribute("logoForm",  logoForm);
    
    //popup list 가져오기
    mainVo.setGubun2("popup");
    List popupList = this.mainService.getCommonList(mainVo);
    model.addAttribute("popupList", popupList);
    
    //image 가져오기
    mainVo.setGubun2("img");
    List imgList = this.mainService.getCommonList(mainVo);
    model.addAttribute("imgList", imgList);
    model.addAttribute("mainVo",  mainVo);
    
    //기관교육 가져오기
    CategoryVo categoryVo = new CategoryVo();
   
    categoryVo.setRecordCountPerPage(5);
    categoryVo.setOffset(0);
    categoryVo.setGubun2("lifeEduOffOrgList");
    List lifeEduOffOrgList = this.eduService.getEducationList(categoryVo);
    model.addAttribute("lifeEduOffOrgList", lifeEduOffOrgList);
	
    //공지사항 가져오기
    AdBoardVo adBoardVo = new AdBoardVo();
    adBoardVo.setBoard_type("01");
    adBoardVo.setRecordCountPerPage(5);
    adBoardVo.setOffset(0);
	List<AdBoardVo> notiList = adBoardService.getBoardList(adBoardVo);
	model.addAttribute("notiList", notiList);
	
    
    model.addAttribute("path",         request.getServletPath());
    model.addAttribute("sessionId",    loginvo);

    return "webMain";
  }

  
  @RequestMapping({"/popup.do"})
  public String popup(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");

    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }
    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("popup");
    }
    mainVo.setWebPath(this.webPath);

    MainVo mainForm = this.mainService.getCommonDetail(mainVo);

    model.addAttribute("mainVo",    mainVo);
    model.addAttribute("mainForm",  mainForm);
    model.addAttribute("path",      request.getServletPath());
    model.addAttribute("sessionId", loginvo);

    return "mainPop";
  }
  /*
   * 사용자 페이지 > 개요 > 생명지킴이
   */
  @RequestMapping({"/summaryList01.do"})
  public String summaryList01(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
    model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "summaryList01";
  }
  
  /*
   * 사용자 페이지 > 개요 > 생명지킴이 교육 강사
   */
  @RequestMapping({"/summaryList02.do"})
  public String summaryList02(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	  LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "summaryList02";
  }
  
  /*
   * 사용자 페이지 > 개요 > 자살 유족 서비스 전문가
   */
  @RequestMapping({"/summaryList03.do"})
  public String summaryList03(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "summaryList03";
  }
  
  /*
   * 사용자 페이지 > 개요 > 심리부검 주면담원
   */
  @RequestMapping({"/summaryList04.do"})
  public String summaryList04(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "summaryList04";
  }
  
  /*
   * 사용자 페이지 > 개요 > 자살 사후대응 전문가
   */
  @RequestMapping({"/summaryList05.do"})
  public String summaryList05(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);  
    model.addAttribute("path",      request.getServletPath());
    return "summaryList05";
  }
  
  /*
   * 교육안내  > 생명지킴이 강사양성 교육
   */
  @RequestMapping({"/info01.do"})
  public String info01(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "info01";
  }
  
  /*
   * 교육안내 > 생명지킴이 강사양성 교육
   */
  @RequestMapping({"/info02.do"})
  public String info02(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {	
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
	model.addAttribute("path",      request.getServletPath());
    return "info02";
  }
  
  
  /*
   * 교육안내 > 실무자 역량 강화 교육
   */
  @RequestMapping({"/info03.do"})
  public String info03(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "info03";
  }
  
  /*
   * 교육안내 > 자살 유족 서비스제공 인력교육
   */
  @RequestMapping({"/info04.do"})
  public String info04(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "info04";
  }
  
  /*
   * 교육안내 > 광역주도형 심리부검면담원 양성교육
   */
  @RequestMapping({"/info05.do"})
  public String info05(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "info05";
  }
  
  /*
   * 교육안내 > 자살사후대응 전문가 양성교육
   */
  @RequestMapping({"/info06.do"})
  public String info06(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	model.addAttribute("sessionId", loginvo);
    model.addAttribute("path",      request.getServletPath());
    return "info06";
  }
  
 
  /*
   * 생명지킴이 교육신청 > 교육신청  > 온라인교육
   */
  @RequestMapping({"/lifeEduOnLineList.do"})
  public String lifeEduOnLineList(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  
   	categoryVo.setGubun1("R");
   	categoryVo.setGubun2("lifeEduOnLineList");
    
   	String edu_status ="신청중";
   	String edu_site   = "on";
    //  온라인에서 Category1_key 1: 일반, 2: 실무자  3:강사
   	/*
   	on	1	1	12	일반	온라인교육	일반 온라인 교육1
	on	1	1	13	일반	온라인교육	일반 온라인 교육2
	on	1	2	14	일반	생명지킴이 강사 양성 교육	생명지킴이 양성교육1
	on	3	7	15	강사	강사 보수 교육	강사교육1
	on	2	3	16	실무자	실무자 역량 강화 교육	실무자 역량 강화 교육1
	on	2	4	17	실무자	자살유족 서비스 제공 인력 교육	자살유족 서비스 제공 인력 교육1
	on	2	5	18	실무자	광역주도형 심리부검 주면담원 양성교육	광역주도형 심리부검 주면담원 양성교육1
	on	2	6	19	실무자	자살사후대응 전문가 양성교육	자살사후대응 전문가 양성교육1
	off	4	8	20	일반	생명지킴이 강사 양성 교육	생명지킴이 강사 양성 교육1
	off	5	9	21	실무자	실무자 역량 강화 교육	실무자 역량 강화 교육1
	off	5	10	22	실무자	자살유족 서비스 제공 인력 교육	자살유족 서비스 제공 인력 교육1
	off	5	11	23	실무자	광역주도형 심리부검 주면담원 양성교육	광역주도형 심리부검 주면담원 양성교육1
	off	5	12	24	실무자	자살사후대응 전문가 양성교육	자살사후대응 전문가 양성교육1
	off	7	14	1	기관	교육개설	보고듣고말하기 2.0 기본형

   	 */
    categoryVo.setCategory1_key(1);
    categoryVo.setCategory2_key(1);
    categoryVo.setEdu_site(edu_site);
    categoryVo.setEdu_status(edu_status);
  
    
    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
    paginationInfo.setPageSize(categoryVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    categoryVo.setOffset(offset);
 
    if (StringUtil.isEmpty(categoryVo.getSort_ordr())) {
        categoryVo.setSort_ordr("TRAIN_S_DATE");
    }
    
    if (StringUtil.isEmpty(categoryVo.getSearchCondition())) {
        categoryVo.setSearchCondition("CATEGORY3_NAME");
    }
    
    List list = this.eduService.getEducationList(categoryVo);
    model.addAttribute("resultList", list);

    int totCnt = this.eduService.getEducationCount(categoryVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);    
     
    categoryVo.setCategory3_key(0);
    //분류1
    categoryVo.setGubun3("categorycode1");
    List category1list = this.eduService.getCategoryCodeList(categoryVo);
    model.addAttribute("category1list", category1list);
    
    //분류2
    categoryVo.setGubun3("categorycode2");
    List category2list = this.eduService.getCategoryCodeList(categoryVo);
    model.addAttribute("category2list", category2list);
        
    //분류3
    categoryVo.setGubun3("categorycode3");
    List category3list = this.eduService.getCategoryCodeList(categoryVo);
    model.addAttribute("category3list", category3list);
        
    categoryVo.setWebPath(this.webPath);
    model.addAttribute("categoryVo", categoryVo);
    model.addAttribute("path",       request.getServletPath());
    model.addAttribute("sessionId",    loginvo);

    return "lifeEduOnLineList";
  }
 	   
  
  /*
   * 생명지킴이 교육신청 > 교육신청  > 온라인교육 상세정보
   */
  @RequestMapping({"/lifeEduOnLineInfo.do"})
  public String lifeEduOnLineInfo(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  
   	categoryVo.setGubun1("R");
   	categoryVo.setGubun2("lifeEduOnLineReg");
   
    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
    model.addAttribute("categoryForm", categoryForm);
    
    List categoryFormSubList = this.eduService.getEduCationDetailSub(categoryVo);
    model.addAttribute("categoryFormSubList", categoryFormSubList);
    
    model.addAttribute("categoryVo",   categoryVo);
    model.addAttribute("path",       request.getServletPath());
    model.addAttribute("sessionId",    loginvo);
    
    return "lifeEduOnLineInfo";
  }
  
  /*
   * 생명지킴이 교육신청 > 교육신청  > 온라인교육 신청
   */
  @RequestMapping({"/lifeEduOnLineReg.do"})
  public String lifeEduOnLieReg(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  
   	categoryVo.setGubun1("R");
   	categoryVo.setGubun2("lifeEduOnLineReg");
   
    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
    model.addAttribute("categoryForm", categoryForm);
    model.addAttribute("categoryVo",   categoryVo);
    model.addAttribute("path",         request.getServletPath());
    model.addAttribute("sessionId",    loginvo);

    return "lifeEduOnLineReg";
  }
  
  @RequestMapping({"/lifeEduOrgOnList.do"})
  public String lifeEduOrgOnList(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  
   	categoryVo.setGubun1("R");
   	categoryVo.setGubun2("lifeEduOnLineList");
    
   	String edu_status ="신청중";
   	String edu_site   = "on";

    categoryVo.setCategory1_key(9);
    categoryVo.setCategory2_key(16);
    categoryVo.setEdu_site(edu_site);
    categoryVo.setEdu_status(edu_status);
  
    
    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
    paginationInfo.setPageSize(categoryVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    categoryVo.setOffset(offset);
 
    if (StringUtil.isEmpty(categoryVo.getSort_ordr())) {
        categoryVo.setSort_ordr("TRAIN_S_DATE");
    }
    
    if (StringUtil.isEmpty(categoryVo.getSearchCondition())) {
        categoryVo.setSearchCondition("CATEGORY3_NAME");
    }
    
    List list = this.eduService.getEducationList(categoryVo);
    model.addAttribute("resultList", list);

    int totCnt = this.eduService.getEducationCount(categoryVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);    
     
    categoryVo.setCategory3_key(0);
    //분류1
    categoryVo.setGubun3("categorycode1");
    List category1list = this.eduService.getCategoryCodeList(categoryVo);
    model.addAttribute("category1list", category1list);
    
    //분류2
    categoryVo.setGubun3("categorycode2");
    List category2list = this.eduService.getCategoryCodeList(categoryVo);
    model.addAttribute("category2list", category2list);
        
    //분류3
    categoryVo.setGubun3("categorycode3");
    List category3list = this.eduService.getCategoryCodeList(categoryVo);
    model.addAttribute("category3list", category3list);
        
    categoryVo.setWebPath(this.webPath);
    model.addAttribute("categoryVo", categoryVo);
    model.addAttribute("path",       request.getServletPath());
    model.addAttribute("sessionId",    loginvo);

    return "lifeEduOrgOnList";
  }
  
  @RequestMapping({"/lifeEduOrgOnInfo.do"})
  public String lifeEduOrgOnInfo(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  
   	categoryVo.setGubun1("R");
   	categoryVo.setGubun2("lifeEduOnLineReg");
   
    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
    model.addAttribute("categoryForm", categoryForm);
    
    List categoryFormSubList = this.eduService.getEduCationDetailSub(categoryVo);
    model.addAttribute("categoryFormSubList", categoryFormSubList);
    
    model.addAttribute("categoryVo",   categoryVo);
    model.addAttribute("path",       request.getServletPath());
    model.addAttribute("sessionId",    loginvo);
    
    return "lifeEduOnLineInfo";
  }
  
  @RequestMapping({"/lifeEduOrgOnReg.do"})
  public String lifeEduOrgOnReg(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
	LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	  
   	categoryVo.setGubun1("R");
   	categoryVo.setGubun2("lifeEduOnLineReg");
   
    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
    model.addAttribute("categoryForm", categoryForm);
    model.addAttribute("categoryVo",   categoryVo);
    model.addAttribute("path",         request.getServletPath());
    model.addAttribute("sessionId",    loginvo);

    return "lifeEduOnLineReg";
  }
  /*
   * 생명지킴이 교육신청 > 교육신청  > 온라인교육 장바구니/수강신청
   */
  @RequestMapping({"/lifeEduOnLineSave.do"})
  @ResponseBody
  public CategoryVo eduInfoOnlineSave(HttpServletRequest request, CategoryVo categoryVo) throws Exception {
	    int resultCnt = 0;
	    try
	    {
	      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	
	      categoryVo.setUser_id(loginvo.getUser_id());
	      categoryVo.setReg_id(loginvo.getId());
	      categoryVo.setUser_nm(loginvo.getUser_nm());
	      //basket course
	      
	      
	      if ("course".equals(categoryVo.getGubun2())) {
	    	  
	    	  //수강신청일때 수강신청 인원 check
	          resultCnt = this.eduService.getCourseStatus(categoryVo);
	          
	          //수강 마감 여부 마감시 수강 테이블에 수강 완료로 해야 한다.신청마감
	          categoryVo.setCour_finish((resultCnt == 1 ? "F":"N"));
	          categoryVo.setEdu_status("신청마감");
	          
	          if(resultCnt < 1) {
	        	  categoryVo.setResult("FINISH");
	          }else {
	        	  
	        	  resultCnt = this.eduService.getCategoryExist(categoryVo);
	        	  
			      if(resultCnt == 0) {
			    	  resultCnt = this.eduService.insertLifeEdu(categoryVo);
				      categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
			      }else {
			    	  categoryVo.setResult("EXIST");
			      }
	          }         
	        
	      }

	      if ("basket".equals(categoryVo.getGubun2())) {
	      
		      resultCnt = this.eduService.getCategoryExist(categoryVo);
		
		      if(resultCnt == 0) {
		    	  resultCnt = this.eduService.insertLifeEdu(categoryVo);
			      categoryVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
		      }else {
		    	  categoryVo.setResult("EXIST");
		      }
	      }
	      
	    }
	    catch (Exception e)
	    {
	      categoryVo.setResult("FAIL");
	    }
	
	    return categoryVo;
  }
  
  /*
   * 생명지킴이 교육신청 > 교육일정  
   */
  @RequestMapping({"/lifeEduSch.do"})
  public String userInstNotiList(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
	    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));
	
	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
	    paginationInfo.setPageSize(categoryVo.getPageSize());
	
	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
	    categoryVo.setOffset(offset);
	    
	    if (StringUtil.isEmpty(categoryVo.getCheckdate())) {
	      categoryVo.setCheckdate("ALL");
	    }
	
	    if (StringUtil.isEmpty(categoryVo.getCategory3_name())) {
	    	categoryVo.setCategory3_name("");
		}
	    categoryVo.setGubun2("lifeEduSch");
	 	categoryVo.setWebPath(this.webPath);
	
	    List list = this.eduService.getEducationList(categoryVo);
	    model.addAttribute("resultList", list);
	
	    int totCnt = this.eduService.getEducationCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path", request.getServletPath());
	    model.addAttribute("sessionId",    loginvo);

       return "lifeEduSch";
  }
  
  /*
   * 생명지킴이 교육신청 > 생명지킴이 활동 수기  
   */
  @RequestMapping({"/lifeEduBoardList.do"})
  public String lifeEduBoard(@ModelAttribute("AdBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		adBoardVo.setPageUnit(propertiesService.getInt("pageUnit"));
		adBoardVo.setPageSize(propertiesService.getInt("pageSize"));
			
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(adBoardVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(adBoardVo.getPageUnit());
		paginationInfo.setPageSize(adBoardVo.getPageSize());
			
			/***  offSet 설정  ***/
		int offset = ((paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize());
		adBoardVo.setOffset(offset);
		
		adBoardVo.setBoard_type("04");
		List<AdBoardVo> list = adBoardService.getBoardList(adBoardVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = adBoardService.getBoardCount(adBoardVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		model.addAttribute("adBoardVo", adBoardVo);
		model.addAttribute("path",      request.getServletPath());
	    model.addAttribute("sessionId", loginvo);

		return "lifeEduBoardList";
  }
  
  /*
   * 생명지킴이 교육신청 > 생명지킴이 활동 수기  
   */
  @RequestMapping({"/lifeEduBoardView.do"})
  public String lifeEduBoardView(@ModelAttribute("AdBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		if(loginvo != null && loginvo.getUser_id() != null) {
			adBoardVo.setReg_id(loginvo.getUser_id());	
			adBoardVo.setUser_id(loginvo.getUser_id());
			adBoardVo.setUser_nm(loginvo.getUser_nm());	
		}
		
		//  조회수 증가
		adBoardService.updateBoardViewCount(adBoardVo);
		
		
		if(adBoardVo.getBoard_idx() != null) {
			AdBoardVo detailData = adBoardService.selectDetailBoard(adBoardVo);
			if(detailData != null ) {
				List<BoardVo> files = adBoardService.selectFileList(adBoardVo);
				model.addAttribute("resultFileList", files);
			}
			model.addAttribute("detailData",  detailData);			
			
		}
		
		//이전글
		adBoardVo.setGubun1("pre");		
		AdBoardVo detailPreData = adBoardService.selectViewDetailBoard(adBoardVo);
		model.addAttribute("detailPreData",   detailPreData);
		
		//다음글
		adBoardVo.setGubun1("next");
		AdBoardVo detailNextData = adBoardService.selectViewDetailBoard(adBoardVo);
		model.addAttribute("detailNextData",   detailNextData);
		
		model.addAttribute("sessionId",   loginvo);
		model.addAttribute("adBoardVo",   adBoardVo);
		model.addAttribute("path",        request.getServletPath());
	
		return "lifeEduBoardView";
  }
  
  /*
   * 생명지킴이 교육신청 > 생명지킴이 활동 수기  
   */
  @RequestMapping({"/lifeEduBoardReq.do"})
  public String lifeEduBoardReq(@ModelAttribute("AdBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
   
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		
		if(loginvo != null && loginvo.getUser_id() != null) {
			adBoardVo.setReg_id(loginvo.getUser_id());	
			adBoardVo.setUser_id(loginvo.getUser_id());
			adBoardVo.setUser_nm(loginvo.getUser_nm());	
		}

		
		if(adBoardVo.getBoard_idx() != null) {
			AdBoardVo detailData = adBoardService.selectDetailBoard(adBoardVo);
			if(detailData != null ) {
				List<BoardVo> files = adBoardService.selectFileList(adBoardVo);
				model.addAttribute("resultFileList", files);
			}
			model.addAttribute("detailData",  detailData);			
			
		}
		model.addAttribute("sessionId",   loginvo);
		model.addAttribute("adBoardVo",   adBoardVo);
		model.addAttribute("path",        request.getServletPath());
	
		return "lifeEduBoardReq";
  }
  
	@RequestMapping({"/fileDownload.do"})
	@ResponseBody
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, BoardVo boardVo) throws Exception {
		boardVo = adBoardService.selectFile(boardVo);
		
	    BoardVo boardVoForm = new BoardVo();
	    boardVoForm.setFile_uuid(boardVo.getFile_uuid());
	    boardVoForm.setFile_name(boardVo.getFile_name());
	    boardVoForm.setFile_full_path(boardVo.getFile_full_path());
	    boardVoForm.setFile_size(boardVo.getFile_size());	 
	
	    FileUtil.fileDownload(request, response, boardVoForm);
	}
	
	@RequestMapping(value = "/boardSave.do")
	@ResponseBody
	public AdBoardVo boardSave(@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request, AdBoardVo adBoardVo) throws Exception {
		int resultCnt = 0;
		try {
			
			LoginVo loginvo = (LoginVo) WebUtils.getSessionAttribute(request, "UserAccount");
			if(loginvo != null && loginvo.getUser_id() != null) {
				adBoardVo.setReg_id(loginvo.getUser_id());	
				adBoardVo.setUser_id(loginvo.getUser_id());
				adBoardVo.setUser_nm(loginvo.getUser_nm());	
			}

			
			String fileAddpath = this.filePath + File.separator + "board";
			List<Map<String, Object>> fileSavelist = null;
			ArrayList<String> fileList = new ArrayList<>();
			
			if ("I".equals(adBoardVo.getGubun1())) { // 저장
				fileSavelist = FileUtil.uploadFileMulti(multipartFile, request, fileAddpath); 
				resultCnt = adBoardService.insertBoard(adBoardVo, fileSavelist);
				adBoardVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
			} else if("E".equals(adBoardVo.getGubun1())) { // 수정
//				resultCnt = adBoardService.updateBoard(adBoardVo);
				String[] ArraysStr = adBoardVo.getCheckdstr().split(",");
		    	  if(ArraysStr.length >0){
		    		  BoardVo boardVo = new BoardVo();
		    		  for (String s : ArraysStr) {
		    	        	if(!StringUtil.isEmpty(s)) {
		    	        		boardVo.setFile_seq(Integer.parseInt(s));
		    	        		BoardVo fileCategoryVo = adBoardService.selectFile(boardVo);
		    	                fileList.add(fileCategoryVo.getFile_full_path());
		    	        	}        	
		    	      }   
		    	  }
		          
		          //파일업로드
		    	  if (multipartFile !=null && multipartFile.size() > 0) {
		      		fileSavelist = FileUtil.uploadFileMulti(multipartFile, request, fileAddpath); 
		      	  }
		    	  
		    	  //파일 추가, 정보업데이트
		          resultCnt = adBoardService.updateBoard(adBoardVo, fileSavelist);
		          
		          //성공 시 파일 삭제
		          if(resultCnt > 0) {
			       	   if (fileList !=null && fileList.size() > 0) {
			       		for (String fileFullPath : fileList) {
			       			FileUtil.deleteFile(request, fileFullPath);
			            }
			       	  }
			      }
				adBoardVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
			}
			
		} catch (Exception e) {
			adBoardVo.setResult("FAIL");
		}
		return adBoardVo;
	}
	
	@RequestMapping(value = "/boardDel.do")
	@ResponseBody
	public String boardDel(HttpServletRequest request, @RequestParam(value="boardIdxArray[]") List<String> boardIdxStrArray) throws Exception {
		int resultCnt = 0;
		String result = "";
		try {

			List<Long> boardIdxList = new ArrayList<Long>();
			
			for(String idxStr : boardIdxStrArray){
				boardIdxList.add(Long.parseLong(idxStr));
			}
			
		    HashMap<String, Object> map = new HashMap<String, Object>();
		    map.put("boardIdxList", boardIdxList);
		    
		    resultCnt = adBoardService.delBoard(map);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		    
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
	
	 /*
	   * 생명지킴이 교육신청 > 교육신청  > 기관 생명 지킴이 교육 소개
	   */
	  @RequestMapping({"/lifeEduOrgList.do"})
	  public String lifeEduOrgList(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
	    throws Exception
	  {
		  LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		  
		   	categoryVo.setGubun1("R");
		   	categoryVo.setGubun2("lifeEduOnLineList");
		    
		   	String edu_status ="신청중";
		   	String edu_site   = "on";
		    model.addAttribute("path",       request.getServletPath());
		    model.addAttribute("sessionId",    loginvo);

		    return "lifeEduOrgList01";
	 }
	  
	  /*
	   * 생명지킴이 교육신청 > 교육신청  > 기관 생명 지킴이 교육 리스트
	   */
	  @RequestMapping({"/lifeEduOrgList02.do"})
	  public String lifeEduOrgList02(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
	    throws Exception
	  {
	   
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		 
		if (StringUtil.isEmpty(categoryVo.getCheckdate())) {
		      categoryVo.setCheckdate("ALL");
		}
		
	   	categoryVo.setGubun1("R");
	   	categoryVo.setGubun2("lifeEduOffOrgList");
	    	    
	    categoryVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
	    categoryVo.setPageSize(this.propertiesService.getInt("pageSize"));

	    PaginationInfo paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(categoryVo.getPageIndex());
	    paginationInfo.setRecordCountPerPage(categoryVo.getPageUnit());
	    paginationInfo.setPageSize(categoryVo.getPageSize());

	    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
	    categoryVo.setOffset(offset);
	 
	    if (StringUtil.isEmpty(categoryVo.getSort_ordr())) {
	        categoryVo.setSort_ordr("TRAIN_S_DATE");
	    }
	    
	    if (StringUtil.isEmpty(categoryVo.getSearchCondition())) {
	        categoryVo.setSearchCondition("CATEGORY3_NAME");
	    }
	    
	    List list = this.eduService.getEducationList(categoryVo);
	    model.addAttribute("resultList", list);

	    int totCnt = this.eduService.getEducationCount(categoryVo);
	    paginationInfo.setTotalRecordCount(totCnt);
	    model.addAttribute("paginationInfo", paginationInfo);    
	     

	        
	    categoryVo.setWebPath(this.webPath);
	    model.addAttribute("categoryVo", categoryVo);
	    model.addAttribute("path",       request.getServletPath());
	    model.addAttribute("sessionId",    loginvo);

	    return "lifeEduOrgList02";
	  }
	  
	  /*
	   * 생명지킴이 교육신청 > 교육신청  > 기관 생명 지킴이 교육 상세정보
	   */
	  @RequestMapping({"/lifeEduOrgInfo.do"})
	  public String lifeEduOrgInfo(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
	    throws Exception
	  {
	   
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		  
	   	categoryVo.setGubun1("R");
	   	categoryVo.setGubun2("lifeEduOffOrgReg");
	   
	    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
	    model.addAttribute("categoryForm", categoryForm);
	    
	    model.addAttribute("categoryVo",   categoryVo);
	    model.addAttribute("path",         request.getServletPath());
	    model.addAttribute("sessionId",    loginvo);
	    
	    return "lifeEduOrgInfo";
	  }
	  
	  /*
	   * 생명지킴이 교육신청 > 교육신청  > 기관 생명 지킴이 교육  신청
	   */
	  @RequestMapping({"/lifeEduOrgReg.do"})
	  public String lifeEduOrgReg(@ModelAttribute("CategoryVo") CategoryVo categoryVo, ModelMap model, HttpServletRequest request)
	    throws Exception
	  {
	   
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		  
	   	categoryVo.setGubun1("R");
	   	categoryVo.setGubun2("lifeEduOffOrgReg");
	   
	    CategoryVo categoryForm = this.eduService.getEduCationDetail(categoryVo);
	    model.addAttribute("categoryForm", categoryForm);
	    model.addAttribute("categoryVo",   categoryVo);
	    model.addAttribute("path",         request.getServletPath());
	    model.addAttribute("sessionId",    loginvo);

	    return "lifeEduOrgReg";
	  }
}