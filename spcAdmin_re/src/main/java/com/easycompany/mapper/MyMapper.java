package com.easycompany.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("myMapper")
public class MyMapper extends EgovAbstractMapper {
	String nameSpace = "com.easycompany.mapper.MyMapper";

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
}