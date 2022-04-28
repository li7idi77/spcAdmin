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

import com.easycompany.service.vo.VendorVo;
import com.easycompany.service.VendorService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("vendor")
public class VendorController {

	
	@Autowired
	private VendorService vendorService;
	
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;

	/** Vendor - 목록  */
	@RequestMapping(value = "/vendorList.do")
	public String getvendorList(HttpServletRequest request, HttpServletResponse response, VendorVo vendorVo, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		vendorVo.setPageUnit(propertiesService.getInt("pageUnit"));
		vendorVo.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vendorVo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vendorVo.getPageUnit());
		paginationInfo.setPageSize(vendorVo.getPageSize());
		
		/***  offSet 설정  ***/
		int offset = ((paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getPageSize());
		vendorVo.setOffset(offset);
		
		List<VendorVo> list = vendorService.getVendorList(vendorVo);
		model.addAttribute("resultList", list);
			
		
		int totCnt = vendorService.getVendorCount(vendorVo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVo", vendorVo);

		return "vendorList";
	}
	
	/** Vendor - 수정  */
	@RequestMapping(value = "/vendorEdit.do")
	public String getBoardList(HttpServletRequest request, HttpServletResponse response, VendorVo vendorVo, ModelMap model) throws Exception {
			
		model.addAttribute("VendorVo", vendorVo);
		model.addAttribute("vendorSeq", vendorVo.getVendor_seq());
		return "vendorEdit";
	}
	
	/** Vendor - 상세  */
	@RequestMapping(value = "/getVendorDetail.do")
	@ResponseBody
	public VendorVo getvendorDetail(HttpServletRequest request, HttpServletResponse response,VendorVo vendorVo, ModelMap model) throws Exception {

			
		VendorVo data = vendorService.getVendorView(vendorVo);
		model.addAttribute("VendorVo", data);
		return data;
	}

	/** Vendor - 수정  */
	@RequestMapping(value = "/updateVendor.do")
	@ResponseBody
	public VendorVo updatevendor(HttpServletRequest request, HttpServletResponse response,VendorVo vendorVo, ModelMap model) throws Exception {

		int resultCnt= 0;
		
		if ("W".equals( vendorVo.getMode() ) ) {
			resultCnt = vendorService.insertVendor(vendorVo);	
		}else if ("E".equals( vendorVo.getMode() ) ) {
			resultCnt = vendorService.updateVendor(vendorVo);	
		}else if ("D".equals( vendorVo.getMode() ) ) {
			resultCnt = vendorService.deleteVendor(vendorVo);	
		}
		
		vendorVo.setResult((resultCnt > 0 ? "SUCCESS" : "FAIL") );  
		return vendorVo;
		
	}

}
