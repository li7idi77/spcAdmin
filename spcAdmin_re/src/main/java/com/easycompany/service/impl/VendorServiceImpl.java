package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.mapper.MemberMapper;
import com.easycompany.mapper.VendorMapper;
import com.easycompany.service.MemberService;
import com.easycompany.service.VendorService;
import com.easycompany.service.vo.VendorVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("vendorService")
public  class VendorServiceImpl extends EgovAbstractServiceImpl implements VendorService {
	
	@Autowired
	private VendorMapper vendorMapper;	
	
	public List<VendorVo> getVendorList(VendorVo vendorVo) throws Exception{
		return vendorMapper.getVendorList(vendorVo);
	}
	
	public int getVendorCount(VendorVo vendorVo) {
		return vendorMapper.getVendorCount(vendorVo); 
	}
	
	public VendorVo getVendorView(VendorVo vendorVo) {
		return vendorMapper.getVendorView(vendorVo);
	}
	public int updateVendor(VendorVo vendorVo) {
		return vendorMapper.updateVendor(vendorVo);
	}
	public int insertVendor(VendorVo vendorVo) {
		return vendorMapper.insertVendor(vendorVo);
	}
	public int deleteVendor(VendorVo vendorVo) {
		return vendorMapper.deleteVendor(vendorVo);
	}
	
	
}
