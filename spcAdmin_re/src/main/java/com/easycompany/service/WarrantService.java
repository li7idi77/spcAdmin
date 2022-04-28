package com.easycompany.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easycompany.service.vo.WarrantVo;

public interface WarrantService {

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception;
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception;
	
	public int getSelectListCnt(Map<String, Object> paramMap);
	
	public int insertData(Map<String, Object> paramMap) throws Exception;
	
	public int updateData(Map<String, Object> paramMap) throws Exception;
	
	public int deleteData(Map<String, Object> paramMap) throws Exception;
}
