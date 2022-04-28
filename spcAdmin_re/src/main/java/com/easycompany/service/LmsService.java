package com.easycompany.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.easycompany.service.vo.LmsVo;

public interface LmsService {

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception;
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception;
	
	public int getSelectListCnt(Map<String, Object> paramMap);
	
	public int insertData(Map<String, Object> paramMap) throws Exception;
	
	public int updateData(Map<String, Object> paramMap) throws Exception;
	
	public int insertCommonFile(Map<String, Object> paramMap, Map<String, Object> fileSave, int gubun);

}
