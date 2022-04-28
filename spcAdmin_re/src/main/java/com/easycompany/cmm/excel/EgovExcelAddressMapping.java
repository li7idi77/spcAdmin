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
package com.easycompany.cmm.excel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.easycompany.service.vo.AddressVo;

import egovframework.rte.fdl.excel.EgovExcelMapping;
import egovframework.rte.fdl.excel.util.EgovExcelUtil;


/**
 * @author sjyoon
 *
 */
public class EgovExcelAddressMapping extends EgovExcelMapping {

	private static final Logger log = LoggerFactory.getLogger(EgovExcelAddressMapping.class);

	@Override
	public AddressVo mappingColumn(Row row) {

		Cell cell0 = row.getCell(0);
    	Cell cell1 = row.getCell(1);

    	AddressVo vo = new AddressVo();

    	vo.setAddress_name(EgovExcelUtil.getValue(cell0));
    	vo.setAddress_hp(EgovExcelUtil.getValue(cell1));
    	
		log.debug("########### vo is {}", vo.getAddress_name());
		log.debug("########### vo is {}", vo.getAddress_hp());
	

		return vo;
	}
}
