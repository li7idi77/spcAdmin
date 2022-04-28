package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.SectorMapper;
import com.easycompany.service.SectorService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("sectorService")
@Transactional
public class SectorServiceImpl extends EgovAbstractServiceImpl  implements SectorService{

	@Autowired
	private SectorMapper SectorMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return SectorMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return SectorMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return SectorMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return SectorMapper.insertData(paramMap);
	}
}