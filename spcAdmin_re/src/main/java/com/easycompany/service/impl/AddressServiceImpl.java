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
package com.easycompany.service.impl;

import java.io.InputStream;
import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.excel.EgovExcelService;

import javax.annotation.Resource;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.mapper.AddressMapper;
import com.easycompany.mapper.BoardMapper;
import com.easycompany.service.AddressService;
import com.easycompany.service.vo.AddressVo;
import com.easycompany.service.vo.BoardVo;

/**
 * 품목정보에 관한 비지니스 클래스를 정의한다.
 * @author 실행환경 개발팀 이영진
 * @since 2011.07.11
 * @version 1.0
 * @see
 * <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.07.11  이영진          최초 생성
 *
 * </pre>
 */
@Service("addressService")
public class AddressServiceImpl extends EgovAbstractServiceImpl implements AddressService {

	@Autowired
	private AddressMapper addressdMapper;	
	
	@Autowired
	private EgovExcelService excelAddressService;
	
	String nameSpace = "com.easycompany.mapper.AddressMapper";
	
	public List<AddressVo> getAddressList(DefaultVO searchVO) throws Exception{
		return addressdMapper.getAddressList(searchVO);
	}
	
	public List<AddressVo> getAddressListXml(DefaultVO searchVO) throws Exception{
		return addressdMapper.getAddressListXml(searchVO);
	}
	
	/**
	 * 품목 xls 엑셀파일을 등록한다.
	 * @param file
	 * @throws Exception
	 */
	public void insertExcelAddress(InputStream file) throws Exception {
		addressdMapper.deleteAddress();
		excelAddressService.uploadExcel(nameSpace + "." + "insertAddress", file, 1, 0);
	}

	/**
	 * 품목 xlsx 엑셀파일을 등록한다.
	 * @param file
	 * @throws Exception
	 */
	public void insertExcelPOIAddress(InputStream file) throws Exception {
		addressdMapper.deleteAddress();
		excelAddressService.uploadExcel(nameSpace + "." + "insertAddress",  file, 1, 0, new XSSFWorkbook());
	}

}
