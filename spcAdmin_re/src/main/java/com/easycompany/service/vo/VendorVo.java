package com.easycompany.service.vo;

import com.easycompany.cmm.vo.DefaultVO;

public class VendorVo extends DefaultVO {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int vendor_seq;
	private String name;
	private String manager;
	private String manager_tel;
	private String company;
	private String company_tel;
	private String reg_date;
	private String end_date;
	private String sms_price;
	private String lms_price;
	private String mms_price;	
	private String comment;
	private String del_yn;
	private String ins_date;
	private String upd_date;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getManager_tel() {
		return manager_tel;
	}
	public void setManager_tel(String manager_tel) {
		this.manager_tel = manager_tel;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
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
	public int getVendor_seq() {
		return vendor_seq;
	}
	public void setVendor_seq(int vendor_seq) {
		this.vendor_seq = vendor_seq;
	}
	
}
