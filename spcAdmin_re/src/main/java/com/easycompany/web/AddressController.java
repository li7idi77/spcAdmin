/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.easycompany.web;

import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.AddressService;
import com.easycompany.service.vo.AddressVo;

import egovframework.rte.fdl.property.EgovPropertyService;



/**
 * 품목 정보를 관리하는 컨트롤러 클래스를 정의한다.
 * @author 실행환경 개발팀 신혜연
 * @since 2011.07.11
 * @version 1.0
 * @see
 * <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.07.11  신혜연          최초 생성
 *
 * </pre>
 */
@Controller
@RequestMapping("address")
public class AddressController {

	@Autowired
	private AddressService addressService;

	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;

	private static final Logger logger = LoggerFactory.getLogger(AddressController.class);
	
	@RequestMapping(value = "/address.do")
	public String address(@ModelAttribute("searchVO") DefaultVO searchVo, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		try {
			
			List<AddressVo> list =  addressService.getAddressList(searchVo);
			
			model.addAttribute("resultList", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "address";
	}
	
	/**
	 * 품목 엑셀파일을 데이터 베이스에 저장한다.
	 * @param searchVO 검색조건
	 * @return 엑셀파일
	 * @throws Exception
	 */
	@RequestMapping(value = "/excelUpload.do")
	public String excelUpload( HttpServletRequest request) throws Exception {

		final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		InputStream fis = null;

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();


			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				// 업로드 파일에 대한 확장자를 체크
				if (file.getOriginalFilename().endsWith(".xls") || file.getOriginalFilename().endsWith(".XLS")) {

					try {
						fis = file.getInputStream();
						addressService.insertExcelAddress(fis);
					} catch (Exception e) {
						throw e;
					} finally {
						if (fis != null) {
							fis.close();
						}
					}

				} else if (file.getOriginalFilename().endsWith(".xlsx") || file.getOriginalFilename().endsWith(".XLSX")){
					try {
						fis = file.getInputStream();
						addressService.insertExcelPOIAddress(fis);
					} catch (Exception e) {
						throw e;
					} finally {
						if (fis != null) {
							fis.close();
						}
					}
				} else {

					return "address";

				}
			}
		}
		return "address";
	}
	
	/**
	 * 품목리스트를 엑셀파일로 출력한다.
	 * @param searchVO 검색조건
	 * @return 엑셀파일
	 * @throws Exception
	 */
	@RequestMapping("/excelDownload.do")
	public ModelAndView excelDownload(@ModelAttribute("searchVO") DefaultVO searchVo) throws Exception {

		List<AddressVo> addressList = addressService.getAddressListXml(searchVo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addressList", addressList);
		map.put("filename", searchVo.getExcelFileName());

		return new ModelAndView("addressExcelView", map);
	}
	
	/**
	 * 품목리스트를 엑셀파일로 출력한다.
	 * @param searchVO 검색조건
	 * @return 엑셀파일
	 * @throws Exception
	 */
	@RequestMapping("/excelPOIDownload.do")
	public ModelAndView excelPOIDownload(@ModelAttribute("searchVO") DefaultVO searchVo) throws Exception {

		List<AddressVo> addressList = addressService.getAddressListXml(searchVo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addressList", addressList);
		map.put("filename", searchVo.getExcelFileName());
		
		return new ModelAndView("addressPOIExcelView", map);
	}
	
}
