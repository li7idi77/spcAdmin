package com.easycompany.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.easycompany.mapper.FareMapper;
import com.easycompany.service.FareService;
import com.easycompany.service.vo.FareVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("fareService")
public  class FareServiceImpl extends EgovAbstractServiceImpl implements FareService {
	
	@Autowired
	private FareMapper fareMapper;	
	
	public List<FareVo> getFareList(FareVo fareVo) throws Exception{
		return fareMapper.getFareList(fareVo);
	}
	
	public int getFareCount(FareVo fareVo) {
		return fareMapper.getFareCount(fareVo); 
	}
	
	public FareVo getFareView(FareVo fareVo) {
		return fareMapper.getFareView(fareVo);
	}
	public int updateFare(FareVo fareVo) {
		return fareMapper.updateFare(fareVo);
	}
	public int insertFare(FareVo fareVo) {
		return fareMapper.insertFare(fareVo);
	}
	public int deleteFare(FareVo fareVo) {
		return fareMapper.deleteFare(fareVo);
	}
	
	
}
