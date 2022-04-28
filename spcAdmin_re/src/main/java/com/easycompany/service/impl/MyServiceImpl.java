package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.MyMapper;
import com.easycompany.service.MyService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("myService")
@Transactional
public class MyServiceImpl extends EgovAbstractServiceImpl  implements MyService{

	@Autowired
	private MyMapper MyMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return MyMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return MyMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return MyMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return MyMapper.insertData(paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return MyMapper.updateData(paramMap);
	}
	
	public int deleteData(Map<String, Object> paramMap) throws Exception {
		return MyMapper.deleteData(paramMap);
	}
}