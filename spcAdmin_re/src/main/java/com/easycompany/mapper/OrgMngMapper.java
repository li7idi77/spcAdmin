package com.easycompany.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.easycompany.service.vo.CategoryVo;
import com.easycompany.service.vo.MainVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("orgMngMapper")
public class OrgMngMapper extends EgovAbstractMapper {
	String nameSpace = "com.easycompany.mapper.OrgMngMapper";

	public List<Map<String, Object>> getSelectList(Map<String, Object> paramMap) throws DataAccessException {
		return selectList(this.nameSpace + "." + paramMap.get("sqlName"), paramMap);
	}
	
	public Map<String, Object> getSelectData(Map<String, Object> paramMap) throws DataAccessException {
		return selectOne(this.nameSpace + "." + paramMap.get("sqlName"), paramMap);
	}
  
	public int getSelectListCnt(Map<String, Object> paramMap) {
		return ((Integer)selectOne(this.nameSpace + "." + paramMap.get("sqlName"), paramMap)).intValue();
	}
	
	public int insertData(Map<String, Object> paramMap) throws DataAccessException {
		return insert(this.nameSpace + "." + paramMap.get("sqlName"), paramMap);
	}
	
	public int updateData(Map<String, Object> paramMap) throws DataAccessException {
		return update(this.nameSpace + "." + paramMap.get("sqlName"), paramMap);
	}
	
	public int deleteData(Map<String, Object> paramMap) throws DataAccessException {
		return delete(this.nameSpace + "." + paramMap.get("sqlName"), paramMap);
	}
	
	public int selectCommonFile(Map<String, Object> paramMap){
	    return Integer.valueOf(selectOne(this.nameSpace + "." + "selectCommonFile", paramMap)).intValue();
	}
	
	public int insertCommonFile(Map<String, Object> paramMap){
	    return Integer.valueOf(insert(this.nameSpace + "." + "insertCommonFile", paramMap)).intValue();
	}
	
	public int updateCommonFile(Map<String, Object> paramMap){
	    return Integer.valueOf(update(this.nameSpace + "." + "updateCommonFile", paramMap)).intValue();
	}
}