package com.easycompany.service.vo;
import com.easycompany.cmm.vo.DefaultVO;

@SuppressWarnings("serial")
public class AddressVo extends DefaultVO {

	String address_hp;
	String address_name;
	
	public String getAddress_hp() {
		return address_hp;
	}
	public void setAddress_hp(String address_hp) {
		this.address_hp = address_hp;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

}
