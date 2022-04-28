package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.OrgMapper;
import com.easycompany.service.OrgService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("orgService")
@Transactional
public class OrgServiceImpl extends EgovAbstractServiceImpl  implements OrgService{

	@Autowired
	private OrgMapper OrgMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return OrgMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return OrgMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return OrgMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return OrgMapper.insertData(paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return OrgMapper.updateData(paramMap);
	}
	
	public int deleteData(Map<String, Object> paramMap) throws Exception {
		return OrgMapper.deleteData(paramMap);
	}
}