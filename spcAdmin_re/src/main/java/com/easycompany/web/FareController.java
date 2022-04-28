package com.easycompany.web;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easycompany.service.vo.FareVo;
import com.easycompany.service.FareService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("fare")
public class FareController {

	
	@Autowired
	private FareService fareService;
	
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;

	/** Vendor - 목록  */
	@RequestMapping(value = "/fareList.do")
	public String getFareList(HttpServletRequest request, HttpServletResponse response, FareVo fareVo, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		fareVo.setPageUnit(propertiesService.getInt("pageUnit"));
		fareVo.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(fareVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(fareVo.getPageUnit());
		paginationInfo.setPageSize(fareVo.getPageSize());
		
		/***  offSet 설정  ***/
		int offset = ((paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize());
		fareVo.setOffset(offset);
		
		List<FareVo> list = fareService.getFareList(fareVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = fareService.getFareCount(fareVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVo", fareVo);

		return "fareList";
	}
	
	/** Fare - 수정  */
	@RequestMapping(value = "/fareEdit.do")
	public String getBoardList(HttpServletRequest request, HttpServletResponse response, FareVo fareVo, ModelMap model) throws Exception {
			
		model.addAttribute("FareVo", fareVo);
		model.addAttribute("fareSeq", fareVo.getFare_seq());
		return "fareEdit";
	}
	
	/** Fare - 상세  */
	@RequestMapping(value = "/getFareDetail.do")
	@ResponseBody
	public FareVo getFareDetail(HttpServletRequest request, HttpServletResponse response,FareVo fareVo, ModelMap model) throws Exception {

			
		FareVo data = fareService.getFareView(fareVo);
		model.addAttribute("VendorVo", data);
		return data;
	}

	/** Fare - 수정  */
	@RequestMapping(value = "/updateFare.do")
	@ResponseBody
	public FareVo updateFare(HttpServletRequest request, HttpServletResponse response,FareVo fareVo, ModelMap model) throws Exception {

		int resultCnt= 0;
		
		if ("W".equals( fareVo.getMode() ) ) {
			resultCnt = fareService.insertFare(fareVo);	
		}else if ("E".equals( fareVo.getMode() ) ) {
			resultCnt = fareService.updateFare(fareVo);	
		}else if ("D".equals( fareVo.getMode() ) ) {
			resultCnt = fareService.deleteFare(fareVo);	
		}
		
		fareVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );  
		return fareVo;
		
	}

}
