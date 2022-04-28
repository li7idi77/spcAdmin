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
package com.easycompany.service;

import java.io.InputStream;
import java.util.List;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.vo.AddressVo;
import com.easycompany.service.vo.BoardVo;



/**
 * 품목정보에 관한 인터페이스 클래스를 정의한다.
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
public interface AddressService {
	
	
	
	public List<AddressVo> getAddressList(DefaultVO searchVO) throws Exception;
	
	public List<AddressVo> getAddressListXml(DefaultVO searchVO) throws Exception;


	/**
	 * 품목 xls 엑셀파일을 등록한다.
	 * @param file
	 * @throws Exception
	 */
	void insertExcelAddress(InputStream file) throws Exception;

	/**
	 * 품목 xlsx 엑셀파일을 등록한다.
	 * @param file
	 * @throws Exception
	 */
	void insertExcelPOIAddress(InputStream file) throws Exception;
}
