package com.easycompany.web.user;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.easycompany.service.vo.AdBoardVo;
import com.easycompany.service.vo.BoardVo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("user")
public class UserBoardController {
	
	@Autowired
	private AdBoardService adBoardService;
	
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;
	
    @Value("#{dbinfo['web.path']}")
    private String webPath;
	
	@RequestMapping(value = "/notice01List.do")
	public String notice01List(@ModelAttribute("adBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request) throws Exception {
		
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		
		/** EgovPropertyService.sample */
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
		
		if(StringUtil.isEmpty(adBoardVo.getBoard_type()) ) {
			adBoardVo.setBoard_type("01");
		}
		
		List<AdBoardVo> list = adBoardService.getBoardList(adBoardVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = adBoardService.getBoardCount(adBoardVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("sessionId",    loginvo);	
		model.addAttribute("adBoardVo",   adBoardVo);
		model.addAttribute("path",        request.getServletPath());

		return "notice01List";
	}
	
	@RequestMapping(value = "/notice01View.do")
	public String notice01View(@ModelAttribute("adBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request) throws Exception {
		
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
		
		return "notice01View";
	}
	
	@RequestMapping(value = "/notice02List.do")
	public String notice02List(@ModelAttribute("adBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request) throws Exception {
		
		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		
		/** EgovPropertyService.sample */
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
		adBoardVo.setBoard_type("02");
		List<AdBoardVo> list = adBoardService.getBoardList(adBoardVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = adBoardService.getBoardCount(adBoardVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("sessionId",    loginvo);	
		model.addAttribute("adBoardVo",   adBoardVo);
		model.addAttribute("path",      request.getServletPath());

		return "notice01List";
	}
	
	@RequestMapping(value = "/notice02View.do")
	public String notice02View(@ModelAttribute("adBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request) throws Exception {
		
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
	
		return "notice01View";
	}
	
	@RequestMapping(value = "/notice03List.do")
	public String notice03List(@ModelAttribute("adBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request) throws Exception {

		LoginVo loginvo = (LoginVo)WebUtils.getSessionAttribute(request, "UserAccount");
		
		/** EgovPropertyService.sample */
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
		adBoardVo.setBoard_type("03");
		List<AdBoardVo> list = adBoardService.getBoardList(adBoardVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = adBoardService.getBoardCount(adBoardVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("sessionId",    loginvo);	
		model.addAttribute("adBoardVo",   adBoardVo);
		model.addAttribute("path",      request.getServletPath());

		return "notice01List";
	}
	
	@RequestMapping(value = "/notice03View.do")
	public String notice03View(@ModelAttribute("adBoardVo") AdBoardVo adBoardVo, ModelMap model, HttpServletRequest request) throws Exception {

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
		
		return "notice01View";
	}
	
}
