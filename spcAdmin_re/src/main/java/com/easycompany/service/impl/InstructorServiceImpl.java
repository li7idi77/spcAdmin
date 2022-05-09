package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.InstructorMapper;
import com.easycompany.service.InstructorService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("instructorService")
@Transactional
public class InstructorServiceImpl extends EgovAbstractServiceImpl implements InstructorService {
	//InstructorAdmController 와 같이 사용
	@Autowired
	private InstructorMapper instructorMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return instructorMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return instructorMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return instructorMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return instructorMapper.insertData(paramMap);
	}
		
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return instructorMapper.updateData(paramMap);
	}
}
