package com.easycompany.service;

import java.util.List;
import com.easycompany.service.vo.VendorVo;

public interface VendorService {
		
	public List<VendorVo> getVendorList(VendorVo vendorVo) throws Exception;
	public int getVendorCount(VendorVo vendorVo);
	public VendorVo getVendorView(VendorVo vendorVo);
	public int updateVendor(VendorVo vendorVo);
	public int insertVendor(VendorVo vendorVo);
	public int deleteVendor(VendorVo vendorVo);
	
}
