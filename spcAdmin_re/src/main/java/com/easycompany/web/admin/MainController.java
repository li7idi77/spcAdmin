package com.easycompany.web.admin;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.cmm.util.StringUtil;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.MainService;
import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.vo.MainVo;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping({"main"})
public class MainController
{

  @Autowired
  private MainService mainService;

  @Autowired
  protected EgovPropertyService propertiesService;

  @Value("#{dbinfo['file.path']}")
  private String filePath;

  @Value("#{dbinfo['web.path']}")
  private String webPath;

  @RequestMapping({"/logoList.do"})
  public String logoList(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());

    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }
    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("logo");
    }
    mainVo.setWebPath(this.webPath);

    MainVo mainForm = this.mainService.getCommonDetail(mainVo);
    
    model.addAttribute("mainVo", mainVo);
    model.addAttribute("mainForm", mainForm);
    model.addAttribute("path", request.getServletPath());

    return "logoList";
  }

  @RequestMapping({"/logoSave.do"})
  @ResponseBody
  public MainVo logoSave(HttpServletRequest request, MainVo mainVo) throws Exception
  {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      mainVo.setUser_id(loginvo.getUser_id());
      mainVo.setReg_id(loginvo.getId());
      mainVo.setUser_nm(loginvo.getUser_nm());

      if (StringUtil.isEmpty(mainVo.getGubun1())) {
        mainVo.setGubun1("R");
      }

      if (StringUtil.isEmpty(mainVo.getGubun2())) {
        mainVo.setGubun2("logo");
      }
      mainVo.setWebPath(this.webPath);

      String fileAddpath = this.filePath + File.separator + mainVo.getGubun2();

      if ("I".equals(mainVo.getGubun1()))
      {
        BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);

        mainVo.setFile_id(fileVo.getFile_uuid());
        mainVo.setFile_name(fileVo.getFile_name());
        mainVo.setFile_full_path(fileVo.getFile_full_path());
        mainVo.setFile_size(fileVo.getFile_size());
        resultCnt = this.mainService.insertCommon(mainVo);
      }

      if ("E".equals(mainVo.getGubun1())) {
        BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);

        MainVo fileDeleteVo1 = this.mainService.getCommonDetail(mainVo);

        String fileFullPath = fileDeleteVo1.getFile_full_path();
        mainVo.setFile_id(fileVo.getFile_uuid());
        mainVo.setFile_name(fileVo.getFile_name());
        mainVo.setFile_full_path(fileVo.getFile_full_path());
        mainVo.setFile_size(fileVo.getFile_size());
        mainVo.setFile_seq(fileDeleteVo1.getFile_seq());
        resultCnt = this.mainService.updateCommon(mainVo);

        FileUtil.deleteFile(request, fileFullPath);
      }

      mainVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
      
    }
    catch (Exception e)
    {
      mainVo.setResult("FAIL");
    }

    return mainVo;
  }

  @RequestMapping({"/fileDownload.do"})
  @ResponseBody
  public void fileDownload(HttpServletRequest request, HttpServletResponse response, MainVo mainVo)
    throws Exception
  {
    MainVo fileVo = this.mainService.getCommonDetail(mainVo);

    BoardVo boardVoForm = new BoardVo();
    boardVoForm.setFile_uuid(fileVo.getFile_id());
    boardVoForm.setFile_name(fileVo.getFile_name());
    boardVoForm.setFile_full_path(fileVo.getFile_full_path());
    boardVoForm.setFile_size(fileVo.getFile_size());

    FileUtil.fileDownload(request, response, boardVoForm);
  }

  @RequestMapping({"/imgList.do"})
  public String imgList(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());

    mainVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    mainVo.setPageSize(this.propertiesService.getInt("pageSize"));

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(mainVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(mainVo.getPageUnit());
    paginationInfo.setPageSize(mainVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    mainVo.setOffset(offset);

    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("img");
    }
    mainVo.setWebPath(this.webPath);

    List list = this.mainService.getCommonList(mainVo);
    model.addAttribute("resultList", list);

    int totCnt = this.mainService.getCommonCount(mainVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);

    
    model.addAttribute("mainVo", mainVo);
    model.addAttribute("path", request.getServletPath());

    return "imgList";
  }

  @RequestMapping({"/imgReg.do"})
  public String imgReg(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());

    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }
    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("img");
    }
    mainVo.setWebPath(this.webPath);

    MainVo mainForm = this.mainService.getCommonDetail(mainVo);

    model.addAttribute("mainVo", mainVo);
    model.addAttribute("mainForm", mainForm);
    model.addAttribute("path", request.getServletPath());

    return "imgReg";
  }

  @RequestMapping({"/imgSave.do"})
  @ResponseBody
  public MainVo imgSave(HttpServletRequest request, MainVo mainVo) throws Exception {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      mainVo.setUser_id(loginvo.getUser_id());
      mainVo.setReg_id(loginvo.getId());
      mainVo.setUser_nm(loginvo.getUser_nm());

      if (StringUtil.isEmpty(mainVo.getGubun2())) {
        mainVo.setGubun2("img");
      }

      String fileAddpath = this.filePath + File.separator + mainVo.getGubun2();

      if ("I".equals(mainVo.getGubun1())) {
        mainVo.setGubun3("I");

        BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);

        mainVo.setFile_id(fileVo.getFile_uuid());
        mainVo.setFile_name(fileVo.getFile_name());
        mainVo.setFile_full_path(fileVo.getFile_full_path());
        mainVo.setFile_size(fileVo.getFile_size());
        resultCnt = this.mainService.insertCommon(mainVo);
      }

      if ("E".equals(mainVo.getGubun1()))
      {
        if (!"N".equals(mainVo.getGubun3()))
        {
          BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);
          MainVo fileDeleteVo1 = this.mainService.getCommonDetail(mainVo);

          String fileFullPath = fileDeleteVo1.getFile_full_path();
          mainVo.setFile_id(fileVo.getFile_uuid());
          mainVo.setFile_name(fileVo.getFile_name());
          mainVo.setFile_full_path(fileVo.getFile_full_path());
          mainVo.setFile_size(fileVo.getFile_size());
          mainVo.setFile_seq(fileDeleteVo1.getFile_seq());
          resultCnt = this.mainService.updateCommon(mainVo);
          if ((fileFullPath != null) && (fileFullPath.length() > 3))
            FileUtil.deleteFile(request, fileFullPath);
        }
        else {
          mainVo.setGubun3("I");
          resultCnt = this.mainService.updateCommon(mainVo);
        }

      }

      if ("D".equals(mainVo.getGubun1()))
      {
        mainVo.setGubun3("I");

        MainVo fileDeleteVo = this.mainService.getCommonDetail(mainVo);
        resultCnt = this.mainService.deleteCommon(mainVo);

        if (fileDeleteVo != null) {
          String fileFullPath = fileDeleteVo.getFile_full_path();
          if ((fileFullPath != null) && (fileFullPath.length() > 3)) {
            FileUtil.deleteFile(request, fileFullPath);
          }
        }
      }

      mainVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
    }
    catch (Exception e)
    {
      mainVo.setResult("FAIL");
    }

    return mainVo;
  }

  @RequestMapping({"/bannerList.do"})
  public String bannerList(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    
    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());

    mainVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    mainVo.setPageSize(this.propertiesService.getInt("pageSize"));

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(mainVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(mainVo.getPageUnit());
    paginationInfo.setPageSize(mainVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    mainVo.setOffset(offset);

    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("banner");
    }
    mainVo.setWebPath(this.webPath);

    List list = this.mainService.getCommonList(mainVo);
    model.addAttribute("resultList", list);

    int totCnt = this.mainService.getCommonCount(mainVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);

 
    model.addAttribute("mainVo", mainVo);
    model.addAttribute("path", request.getServletPath());

    return "bannerList";
  }

  @RequestMapping({"/bannerReg.do"})
  public String bannerReg(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    
    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());
    
    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }
    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("banner");
    }
    mainVo.setWebPath(this.webPath);

    MainVo mainForm = this.mainService.getCommonDetail(mainVo);

    
    model.addAttribute("mainVo", mainVo);
    model.addAttribute("mainForm", mainForm);
    model.addAttribute("path", request.getServletPath());

    return "bannerReg";
  }

  @RequestMapping({"/bannerSave.do"})
  @ResponseBody
  public MainVo bannerSave(HttpServletRequest request, MainVo mainVo) throws Exception {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      mainVo.setUser_id(loginvo.getUser_id());
      mainVo.setReg_id(loginvo.getId());
      mainVo.setUser_nm(loginvo.getUser_nm());

      if (StringUtil.isEmpty(mainVo.getGubun2())) {
        mainVo.setGubun2("banner");
      }

      String fileAddpath = this.filePath + File.separator + mainVo.getGubun2();

      if ("I".equals(mainVo.getGubun1()))
      {
        mainVo.setGubun3("I");

        BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);

        mainVo.setFile_id(fileVo.getFile_uuid());
        mainVo.setFile_name(fileVo.getFile_name());
        mainVo.setFile_full_path(fileVo.getFile_full_path());
        mainVo.setFile_size(fileVo.getFile_size());
        resultCnt = this.mainService.insertCommon(mainVo);
      }

      if ("E".equals(mainVo.getGubun1()))
      {
        if (!"N".equals(mainVo.getGubun3()))
        {
          BoardVo fileVo = FileUtil.uploadFile(request, fileAddpath);
          MainVo fileDeleteVo1 = this.mainService.getCommonDetail(mainVo);

          String fileFullPath = fileDeleteVo1.getFile_full_path();
          mainVo.setFile_id(fileVo.getFile_uuid());
          mainVo.setFile_name(fileVo.getFile_name());
          mainVo.setFile_full_path(fileVo.getFile_full_path());
          mainVo.setFile_size(fileVo.getFile_size());
          mainVo.setFile_seq(fileDeleteVo1.getFile_seq());
          resultCnt = this.mainService.updateCommon(mainVo);
          if ((fileFullPath != null) && (fileFullPath.length() > 3))
            FileUtil.deleteFile(request, fileFullPath);
        }
        else {
          mainVo.setGubun3("I");
          resultCnt = this.mainService.updateCommon(mainVo);
        }
      }

      if ("D".equals(mainVo.getGubun1()))
      {
        mainVo.setGubun3("I");

        MainVo fileDeleteVo = this.mainService.getCommonDetail(mainVo);
        resultCnt = this.mainService.deleteCommon(mainVo);

        if (fileDeleteVo != null) {
          String fileFullPath = fileDeleteVo.getFile_full_path();
          if ((fileFullPath != null) && (fileFullPath.length() > 3)) {
            FileUtil.deleteFile(request, fileFullPath);
          }
        }
      }

      mainVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
    }
    catch (Exception e) {
      mainVo.setResult("FAIL");
    }

    return mainVo;
  }

  @RequestMapping({"/popupList.do"})
  public String popupList(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");
    
    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());

    mainVo.setPageUnit(this.propertiesService.getInt("pageUnit"));
    mainVo.setPageSize(this.propertiesService.getInt("pageSize"));

    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(mainVo.getPageIndex());
    paginationInfo.setRecordCountPerPage(mainVo.getPageUnit());
    paginationInfo.setPageSize(mainVo.getPageSize());

    int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize();
    mainVo.setOffset(offset);

    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }

    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("popup");
    }
    mainVo.setWebPath(this.webPath);

    List list = this.mainService.getCommonList(mainVo);
    model.addAttribute("resultList", list);

    int totCnt = this.mainService.getCommonCount(mainVo);
    paginationInfo.setTotalRecordCount(totCnt);
    model.addAttribute("paginationInfo", paginationInfo);

    model.addAttribute("mainVo", mainVo);
    model.addAttribute("path", request.getServletPath());

    return "popupList";
  }

  @RequestMapping({"/popupReg.do"})
  public String popupReg(@ModelAttribute("MainVo") MainVo mainVo, ModelMap model, HttpServletRequest request)
    throws Exception
  {
    LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

    mainVo.setUser_id(loginvo.getUser_id());
    mainVo.setReg_id(loginvo.getId());
    mainVo.setUser_nm(loginvo.getUser_nm());
    
    if (StringUtil.isEmpty(mainVo.getGubun1())) {
      mainVo.setGubun1("R");
    }
    if (StringUtil.isEmpty(mainVo.getGubun2())) {
      mainVo.setGubun2("popup");
    }
    mainVo.setWebPath(this.webPath);

    MainVo mainForm = this.mainService.getCommonDetail(mainVo);

    model.addAttribute("mainVo", mainVo);
    model.addAttribute("mainForm", mainForm);
    model.addAttribute("path", request.getServletPath());

    return "popupReg";
  }

  @RequestMapping({"/popupSave.do"})
  @ResponseBody
  public MainVo popupSave(HttpServletRequest request, MainVo mainVo) throws Exception {
    int resultCnt = 0;
    try
    {
      LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "AdminAccount");

      mainVo.setUser_id(loginvo.getUser_id());
      mainVo.setReg_id(loginvo.getId());
      mainVo.setUser_nm(loginvo.getUser_nm());

      if (StringUtil.isEmpty(mainVo.getGubun2())) {
        mainVo.setGubun2("popup");
      }

      mainVo.setGubun3("N");

      if ("I".equals(mainVo.getGubun1()))
      {
        resultCnt = this.mainService.insertCommon(mainVo);
      }

      if ("E".equals(mainVo.getGubun1())) {
        resultCnt = this.mainService.updateCommon(mainVo);
      }

      if ("D".equals(mainVo.getGubun1())) {
        resultCnt = this.mainService.deleteCommon(mainVo);
      }

      if ("A".equals(mainVo.getGubun1())) {
        String[] ArraysStr = mainVo.getCheckdstr().split(",");
        for (String s : ArraysStr) {
          mainVo.setPopup_no(Integer.parseInt(s));
          resultCnt = this.mainService.deleteCommon(mainVo);
        }
      }

      mainVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL");
    }
    catch (Exception e) {
      mainVo.setResult("FAIL");
    }

    return mainVo;
  }
}