package com.easycompany.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.easycompany.cmm.util.FileUtil;
import com.easycompany.mapper.InstructorMapper;
import com.easycompany.mapper.LmsMapper;
import com.easycompany.service.LmsService;
import com.easycompany.service.vo.BoardVo;
import com.easycompany.service.vo.CategoryVo;
import com.easycompany.service.vo.LmsVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("lmsService")
@Transactional
public class LmsServiceImpl extends EgovAbstractServiceImpl implements LmsService {
	
	@Autowired
	private LmsMapper lmsMapper;

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws Exception {
		return lmsMapper.getSelectList(paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws Exception {
		return lmsMapper.getSelectData(paramMap);
	}
	
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return lmsMapper.getSelectListCnt(paramMap);
	}
	
	public int insertData(Map<String, Object> paramMap) throws Exception {
		return lmsMapper.insertData(paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws Exception {
		return lmsMapper.updateData(paramMap);
	}
	
	public int insertCommonFile(Map<String, Object> paramMap, Map<String, Object> fileSave, int gubun) {
		  int cnt = 0;
		  if (fileSave != null) {
			  paramMap.put("file_id",(String)fileSave.get("file_uuid"));
			  paramMap.put("file_name",(String)fileSave.get("file_name"));
			  paramMap.put("file_full_path",(String)fileSave.get("file_full_path"));
			  paramMap.put("file_size",fileSave.get("file_size"));
			  if(gubun == 1) {
			        cnt = this.lmsMapper.insertCommonFile(paramMap);
			  }else {
			        cnt = this.lmsMapper.updateCommonFile(paramMap);
			  }
		  }
		  
	    return cnt;
	}
	
	public int deleteData(Map<String, Object> paramMap) throws Exception {
		return lmsMapper.deleteData(paramMap);
	}
}
