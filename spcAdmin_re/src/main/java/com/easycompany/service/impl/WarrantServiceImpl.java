package com.easycompany.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.WarrantMapper;
import com.easycompany.service.WarrantService;
import com.easycompany.service.vo.WarrantVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("warrantService")
@Transactional
public class WarrantServiceImpl extends EgovAbstractServiceImpl implements WarrantService {
	
	@Autowired
	private WarrantMapper warrantMapper;
	
	@Value("#{dbinfo['file.path']}")
	private String filePath;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return warrantMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return warrantMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return warrantMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return warrantMapper.insertData(paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return warrantMapper.updateData(paramMap);
	}
	
	public int deleteData(Map<String, Object> paramMap) throws Exception {
		return warrantMapper.deleteData(paramMap);
	}
}
