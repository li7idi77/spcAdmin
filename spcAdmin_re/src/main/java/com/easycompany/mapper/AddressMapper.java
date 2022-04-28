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
package com.easycompany.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


import org.springframework.stereotype.Repository;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.service.vo.AddressVo;
import org.springframework.dao.DataAccessException;

/**
 * 품목 정보에 관한 데이터 접근 클래스를 정의한다.
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
@Repository("addressMapper")
public class AddressMapper extends EgovAbstractMapper {
	
	String nameSpace = "com.easycompany.mapper.AddressMapper";
	
	public List<AddressVo> getAddressList(DefaultVO searchVO) throws DataAccessException {
		return selectList(nameSpace + "." +"getAddressList", searchVO);
	}
	
	public List<AddressVo> getAddressListXml(DefaultVO searchVO) throws DataAccessException {
		return selectList(nameSpace + "." +"getAddressListXml", searchVO);
	}
	
	/**
	 * 데이터 베이스에서 품목 테이블을 초기화한다.
	 * @throws Exception
	 */
	public void deleteAddress() throws Exception {
		delete(nameSpace + "." + "deleteAll", new Object());
	}

	/**
	 * 품목 엑셀파일을 등록한다.
	 * @throws Exception
	 */
	public void insertExcelAddress(AddressVo addressVo) throws Exception {
		insert(nameSpace + "." + "insertAddress", addressVo);
	}
}
