package com.easycompany.service;

import java.util.List;
import java.util.Map;

public abstract interface OrgMngService
{
  
	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception;
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception;
	
	public int getSelectListCnt(Map<String, Object> paramMap);
	
	public int insertData(Map<String, Object> paramMap) throws Exception;
	
	public int updateData(Map<String, Object> paramMap) throws Exception;
	
	public int deleteData(Map<String, Object> paramMap) throws Exception;
	
	public int insertCommon(Map<String, Object> paramMap);
}