package com.easycompany.service;

import java.util.List;

import com.easycompany.service.vo.FareVo;


public interface FareService {
	
	public List<FareVo> getFareList(FareVo fareVo) throws Exception;
	public int getFareCount(FareVo fareVo);
	public FareVo getFareView(FareVo fareVo);
	public int updateFare(FareVo fareVo);
	public int insertFare(FareVo fareVo);
	public int deleteFare(FareVo fareVo);

	
}
