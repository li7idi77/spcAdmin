package com.easycompany.web;

import java.util.ArrayList;
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
import org.springframework.web.util.WebUtils;

import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.SectorService;
import com.easycompany.service.WarrantService;
import com.easycompany.service.vo.LmsVo;
import com.easycompany.service.vo.WarrantVo;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("warrant")
public class WarrantController {
	
	@Autowired
	private WarrantService warrantService;
	
	@Autowired
	private SectorService sectorService;
	
	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;
	
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;
	
	@RequestMapping(value = "/warrantGeneralDefault.do")
	public String warrantGeneralDefault(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {

		return "warrantGeneralDefault";
	}
	
	@RequestMapping(value = "/warrantOnlineList.do")
	public String warrantOnlineList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		paramMap.put("offset",offset);
		  
		paramMap.put("site", "on");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		
		paramMap.put("sqlName", "getCategoryList2");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("license_type", "A");
		paramMap.put("sqlName", "warrantOnlineList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantOnlineListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		  
		return "warrantOnlineList";
	}
	
	@RequestMapping(value = "/warrantOnlineReq.do")
	public String warrantOnlineReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("site", "on");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		if(paramMap.get("actFlag").toString().equals("U")) {
			paramMap.put("license_type", "A");
			paramMap.put("sqlName", "selectDetailOnline");	
			Map<String, Object> result = warrantService.getSelectData(paramMap);
		  	model.addAttribute("result", result);
		  	
		  	paramMap.put("category1_key", result.get("CATEGORY1_KEY"));
		  	paramMap.put("category2_key", result.get("CATEGORY2_KEY"));
		  	paramMap.put("category3_key", result.get("CATEGORY3_KEY"));
		  	
			paramMap.put("sqlName", "getCategoryList2");
			List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
			model.addAttribute("category2list", category2list);
			  
			paramMap.put("sqlName", "getCategoryList3");
			List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
			model.addAttribute("category3list", category3list);
		}
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "warrantOnlineReq";
	}
	
	@RequestMapping(value = "/warrantSave.do")
	@ResponseBody
	public Map<String, Object> warrantSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		 Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
			
			if ("I".equals(paramMap.get("actFlag").toString())) { // 저장
				if(paramMap.get("license_type").toString().equals("C")) {
					paramMap.put("license_status", 1);
				}else {
					paramMap.put("license_status", 0);
				}
				paramMap.put("sqlName", "warrantSave");
				resultCnt = warrantService.insertData(paramMap);
				
			} else if("U".equals(paramMap.get("actFlag").toString())) { // 수정
				paramMap.put("sqlName", "warrantUpdate");
				resultCnt = warrantService.updateData(paramMap);
			}
//			
		} catch (Exception e) {
			result.put("result", "FAIL");	 
		}
		result.put("result",resultCnt > 0 ? "SUCCESS" : "FAIL");
		return result;
	}
	
	@RequestMapping(value = "/warrantOfflineList.do")
	public String warrantOfflineList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		paramMap.put("offset",offset);
		  
		paramMap.put("site", "off");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		
		paramMap.put("sqlName", "getCategoryList2");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("license_type", "B");
		paramMap.put("sqlName", "warrantOnlineList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantOnlineListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		
		return "warrantOfflineList";
	}
	@RequestMapping(value = "/warrantOfflineReq.do")
	public String warrantOfflineReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("site", "off");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		if(paramMap.get("actFlag").toString().equals("U")) {
			paramMap.put("license_type", "B");
			paramMap.put("sqlName", "selectDetailOnline");	
			Map<String, Object> result = warrantService.getSelectData(paramMap);
		  	model.addAttribute("result", result);
		  	
		  	paramMap.put("category1_key", result.get("CATEGORY1_KEY"));
		  	paramMap.put("category2_key", result.get("CATEGORY2_KEY"));
		  	paramMap.put("category3_key", result.get("CATEGORY3_KEY"));
		  	
			paramMap.put("sqlName", "getCategoryList2");
			List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
			model.addAttribute("category2list", category2list);
			  
			paramMap.put("sqlName", "getCategoryList3");
			List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
			model.addAttribute("category3list", category3list);
		}
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "warrantOfflineReq";
	}
	
	@RequestMapping(value = "/warrantOrgList.do")
	public String warrantOrgList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		paramMap.put("offset",offset);
		  
		paramMap.put("site", "off");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		
		paramMap.put("sqlName", "getCategoryList2");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("license_type", "C");
		paramMap.put("sqlName", "warrantOnlineList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantOnlineListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);

		return "warrantOrgList";
	}
	@RequestMapping(value = "/warrantOrgReq.do")
	public String warrantOrgReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("site", "off");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		if(paramMap.get("actFlag").toString().equals("U")) {
			paramMap.put("license_type", "C");
			paramMap.put("sqlName", "selectDetailOnline");	
			Map<String, Object> result = warrantService.getSelectData(paramMap);
		  	model.addAttribute("result", result);
		  	
		  	paramMap.put("category1_key", result.get("CATEGORY1_KEY"));
		  	paramMap.put("category2_key", result.get("CATEGORY2_KEY"));
		  	paramMap.put("category3_key", result.get("CATEGORY3_KEY"));
		  	
			paramMap.put("sqlName", "getCategoryList2");
			List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
			model.addAttribute("category2list", category2list);
			  
			paramMap.put("sqlName", "getCategoryList3");
			List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
			model.addAttribute("category3list", category3list);
		}
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		
		return "warrantOrgReq";
	}
	
	@RequestMapping(value = "/warrantDel.do")
	@ResponseBody
	public String warrantDel(HttpServletRequest request, @RequestParam(value="boardIdxArray[]") List<String> boardIdxStrArray, @RequestParam Map<String, Object> paramMap) throws Exception {
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
			paramMap.put("boardIdxList", boardIdxStrArray); 
		    paramMap.put("sqlName", "warrantDel");
		    resultCnt = warrantService.deleteData(paramMap);
		    result = (resultCnt > 0 ? "SUCCESS" : "FAIL");
		    
		} catch (Exception e) {
			result = "FAIL";
		}
		
		return result;
	}
	
	@RequestMapping(value = "/warrantNumber.do")
	public String warrantNumber(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {

		return "warrantNumber";
	}
	
	@RequestMapping(value = "/warrantNumberReqList.do")
	public String warrantNumberReqList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
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
		
		paramMap.put("sqlName", "getCategoryList2_opt");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("sqlName", "warrantNumberReqList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantNumberReqListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		  
		return "warrantNumberReqList";
	}

	@RequestMapping(value = "/popWarrantNumberReq.do")
	public String popWarrantNumberReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "popWarrantNumberReq";
	}
	
	@RequestMapping(value = "/warrantNumberSave.do")
	@ResponseBody
	public Map<String, Object> warrantNumberSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		 Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
			
			paramMap.put("sqlName", "warrantNumberDetail");	
			Map<String, Object> resultData = warrantService.getSelectData(paramMap);
		  	paramMap.putAll(resultData);
		  	
			paramMap.put("sqlName", "warrantNumberSave");
			resultCnt = warrantService.insertData(paramMap);			
		} catch (Exception e) {
			result.put("result", "FAIL");	 
		}
		result.put("result",resultCnt > 0 ? "SUCCESS" : "FAIL");
		return result;
	}
	
	@RequestMapping(value = "/warrantNumberModList.do")
	public String warrantNumberModList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
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
		
		paramMap.put("sqlName", "getCategoryList2_opt");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("sqlName", "warrantNumberReqList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantNumberReqListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		  
		return "warrantNumberModList";
	}
	
	@RequestMapping(value = "/popWarrantNumberView.do")
	public String popWarrantNumberView(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "popWarrantNumberView";
	}
	
	@RequestMapping(value = "/popWarrantNumberMod.do")
	public String popWarrantNumberMod(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "popWarrantNumberMod";
	}
	
	@RequestMapping(value = "/warrantIssueList.do")
	public String warrantIssueList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		paramMap.put("offset",offset);
		  
		paramMap.put("site", "on");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		
		paramMap.put("sqlName", "getCategoryList2");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("license_type", "A");
		paramMap.put("sqlName", "warrantOnlineList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantOnlineListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		  
		return "warrantIssueList";
	}
	
	@RequestMapping(value = "/warrantOfficerDefault.do")
	public String warrantOfficerDefault(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {

		return "warrantOfficerDefault";
	}
	
	@RequestMapping(value = "/warrantOfficerOnList.do")
	public String warrantOfficerOnList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		paramMap.put("offset",offset);
		  
		paramMap.put("site", "on");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		
		paramMap.put("sqlName", "getCategoryList2");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("license_type", "A");
		paramMap.put("sqlName", "warrantOnlineList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantOnlineListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		  
		return "warrantOfficerOnList";
	}
	
	@RequestMapping(value = "/warrantOfficerOnReq.do")
	public String warrantOfficerOnReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("site", "on");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		if(paramMap.get("actFlag").toString().equals("U")) {
			paramMap.put("license_type", "A");
			paramMap.put("sqlName", "selectDetailOnline");	
			Map<String, Object> result = warrantService.getSelectData(paramMap);
		  	model.addAttribute("result", result);
		  	
		  	paramMap.put("category1_key", result.get("CATEGORY1_KEY"));
		  	paramMap.put("category2_key", result.get("CATEGORY2_KEY"));
		  	paramMap.put("category3_key", result.get("CATEGORY3_KEY"));
		  	
			paramMap.put("sqlName", "getCategoryList2");
			List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
			model.addAttribute("category2list", category2list);
			  
			paramMap.put("sqlName", "getCategoryList3");
			List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
			model.addAttribute("category3list", category3list);
		}
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "warrantOfficerOnReq";
	}
	
	@RequestMapping(value = "/warrantOfficerSave.do")
	@ResponseBody
	public Map<String, Object> warrantOfficerSave(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int resultCnt = 0;
		 Map<String, Object> result = new HashMap<String, Object>();
		try {
			paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
			
			if ("I".equals(paramMap.get("actFlag").toString())) { // 저장
				if(paramMap.get("license_type").toString().equals("C")) {
					paramMap.put("license_status", 1);
				}else {
					paramMap.put("license_status", 0);
				}
				paramMap.put("sqlName", "warrantSave");
				resultCnt = warrantService.insertData(paramMap);
				
			} else if("U".equals(paramMap.get("actFlag").toString())) { // 수정
				paramMap.put("sqlName", "warrantUpdate");
				resultCnt = warrantService.updateData(paramMap);
			}
//			
		} catch (Exception e) {
			result.put("result", "FAIL");	 
		}
		result.put("result",resultCnt > 0 ? "SUCCESS" : "FAIL");
		return result;
	}
	
	@RequestMapping(value = "/warrantOfficerOffList.do")
	public String warrantOfficerOffList(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("pageSize", 10);
		paramMap.put("recordCountPerPage", 10);
		paramMap.put("AdminAccount", request.getSession().getAttribute("AdminAccount"));
		if(!paramMap.containsKey("pageIndex")) {
		  paramMap.put("pageIndex", 1);
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(paramMap.get("pageIndex").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(paramMap.get("recordCountPerPage").toString()));
		paginationInfo.setPageSize(Integer.parseInt(paramMap.get("pageSize").toString()));
		  
		int offset = (paginationInfo.getCurrentPageNo() - 1) * paginationInfo.getRecordCountPerPage();
		paramMap.put("offset",offset);
		  
		paramMap.put("site", "off");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		
		paramMap.put("sqlName", "getCategoryList2");
		List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
		model.addAttribute("category2list", category2list);
		  
		paramMap.put("sqlName", "getCategoryList3");
		List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
		model.addAttribute("category3list", category3list);
		
		paramMap.put("license_type", "B");
		paramMap.put("sqlName", "warrantOnlineList");
		List<Map<String, Object>> list = warrantService.getSelectList(paramMap);
		model.addAttribute("resultList", list);
		  
		paramMap.put("sqlName", "warrantOnlineListCnt");
		int totCnt = warrantService.getSelectListCnt(paramMap);
		model.addAttribute("totCnt", totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		
		return "warrantOfficerOffList";
	}
	@RequestMapping(value = "/warrantOfficerOffReq.do")
	public String warrantOfficerOffReq(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest request) throws Exception {
		paramMap.put("site", "off");
		paramMap.put("sqlName", "getCategoryList1");
		List<Map<String, Object>> category1list = sectorService.getSelectList(paramMap);
		model.addAttribute("category1list", category1list);
		if(paramMap.get("actFlag").toString().equals("U")) {
			paramMap.put("license_type", "B");
			paramMap.put("sqlName", "selectDetailOnline");	
			Map<String, Object> result = warrantService.getSelectData(paramMap);
		  	model.addAttribute("result", result);
		  	
		  	paramMap.put("category1_key", result.get("CATEGORY1_KEY"));
		  	paramMap.put("category2_key", result.get("CATEGORY2_KEY"));
		  	paramMap.put("category3_key", result.get("CATEGORY3_KEY"));
		  	
			paramMap.put("sqlName", "getCategoryList2");
			List<Map<String, Object>> category2list = sectorService.getSelectList(paramMap);
			model.addAttribute("category2list", category2list);
			  
			paramMap.put("sqlName", "getCategoryList3");
			List<Map<String, Object>> category3list = sectorService.getSelectList(paramMap);
			model.addAttribute("category3list", category3list);
		}
		model.addAttribute("path", request.getServletPath());
		model.addAllAttributes(paramMap);
		return "warrantOfficerOffReq";
	}
}
