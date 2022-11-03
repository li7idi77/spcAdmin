package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.OrgMngMapper;
import com.easycompany.service.OrgMngService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("orgMngService")
@Transactional
public class OrgMngServiceImpl extends EgovAbstractServiceImpl  implements OrgMngService{

	@Autowired
	private OrgMngMapper OrgMngMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return OrgMngMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return OrgMngMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return OrgMngMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return OrgMngMapper.insertData(paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return OrgMngMapper.updateData(paramMap);
	}
	
	public int deleteData(Map<String, Object> paramMap) throws Exception {
		return OrgMngMapper.deleteData(paramMap);
	}
}