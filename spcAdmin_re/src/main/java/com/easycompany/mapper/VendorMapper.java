package com.easycompany.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.easycompany.service.vo.VendorVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("vendorMapper")
public class VendorMapper extends EgovAbstractMapper{
	
	String nameSpace = "com.easycompany.mapper.VendorMapper";
	
	public List<VendorVo> getVendorList(VendorVo vendorVo) throws DataAccessException {
		return selectList(nameSpace + "." +"getVendorList", vendorVo);
	}

	public int getVendorCount(VendorVo vendorVo) {
		return (Integer)selectOne(nameSpace + "." +"getVendorCount", vendorVo);
	}
	
	public VendorVo getVendorView(VendorVo vendorVo) {
		return selectOne(nameSpace + "." +"getVendorView", vendorVo);
	}
	
	public int updateVendor(VendorVo vendorVo) {
		return update(nameSpace + "." +"updateVendor", vendorVo);
	}
	
	public int insertVendor(VendorVo vendorVo) {
		return insert(nameSpace + "." +"insertVendor", vendorVo);
	}
	
	public int deleteVendor(VendorVo vendorVo) {
		return delete(nameSpace + "." +"deleteVendor", vendorVo);
	}
	
}
