package com.easycompany.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.easycompany.service.vo.FareVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("fareMapper")
public class FareMapper extends EgovAbstractMapper{
	
	String nameSpace = "com.easycompany.mapper.FareMapper";
	
	public List<FareVo> getFareList(FareVo fareVo) throws DataAccessException {
		return selectList(nameSpace + "." +"getFareList", fareVo);
	}

	public int getFareCount(FareVo fareVo) {
		return (Integer)selectOne(nameSpace + "." +"getFareCount", fareVo);
	}
	
	public FareVo getFareView(FareVo fareVo) {
		return selectOne(nameSpace + "." +"getFareView", fareVo);
	}
	
	public int updateFare(FareVo fareVo) {
		return update(nameSpace + "." +"updateFare", fareVo);
	}
	
	public int insertFare(FareVo fareVo) {
		return insert(nameSpace + "." +"insertFare", fareVo);
	}
	
	public int deleteFare(FareVo fareVo) {
		return delete(nameSpace + "." +"deleteFare", fareVo);
	}
	
}
