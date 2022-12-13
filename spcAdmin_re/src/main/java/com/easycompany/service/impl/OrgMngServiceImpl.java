package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easycompany.mapper.OrgMngMapper;
import com.easycompany.service.OrgMngService;
import com.easycompany.service.vo.MainVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("orgMngService")
@Transactional
public class OrgMngServiceImpl extends EgovAbstractServiceImpl  implements OrgMngService{

	@Autowired
	private OrgMngMapper orgMngMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return orgMngMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return orgMngMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return orgMngMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return orgMngMapper.insertData(paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return orgMngMapper.updateData(paramMap);
	}
	
	public int deleteData(Map<String, Object> paramMap) throws Exception {
		return orgMngMapper.deleteData(paramMap);
	}
	
	public int insertCommon(Map<String, Object> paramMap){
	      int cnt = orgMngMapper.selectCommonFile(paramMap);
	      if (cnt > 0) {
	    	  return orgMngMapper.updateCommonFile(paramMap);
	      }else{
	    	  return orgMngMapper.insertCommonFile(paramMap);
	      }

	  }
}