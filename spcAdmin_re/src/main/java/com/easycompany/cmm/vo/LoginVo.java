package com.easycompany.cmm.vo;

import com.easycompany.service.vo.MemberVo;

public class LoginVo extends MemberVo {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String id;
	private String hp;
	private String password;
	private String shaPassword;
	private String rePassword;
	private String sms_yn;
	private String account_yn;
	private String del_yn;
	private String ins_date;
	private String upd_date;
	private String sms_price;
	private String lms_price;
	private String mms_price;	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getShaPassword() {
		return shaPassword;
	}
	public void setShaPassword(String shaPassword) {
		this.shaPassword = shaPassword;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	public String getSms_yn() {
		return sms_yn;
	}
	public void setSms_yn(String sms_yn) {
		this.sms_yn = sms_yn;
	}
	public String getAccount_yn() {
		return account_yn;
	}
	public void setAccount_yn(String account_yn) {
		this.account_yn = account_yn;
	}
	public String getIns_date() {
		return ins_date;
	}
	public void setIns_date(String ins_date) {
		this.ins_date = ins_date;
	}
	public String getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(String upd_date) {
		this.upd_date = upd_date;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getSms_price() {
		return sms_price;
	}
	public void setSms_price(String sms_price) {
		this.sms_price = sms_price;
	}
	public String getLms_price() {
		return lms_price;
	}
	public void setLms_price(String lms_price) {
		this.lms_price = lms_price;
	}
	public String getMms_price() {
		return mms_price;
	}
	public void setMms_price(String mms_price) {
		this.mms_price = mms_price;
	}
	
	
}
