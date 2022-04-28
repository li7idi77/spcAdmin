package com.easycompany.service.vo;

import com.easycompany.cmm.vo.DefaultVO;

public class FareVo extends DefaultVO {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int fare_seq;
	private String sms_price;
	private String lms_price;
	private String mms_price;	
	private String use_yn;
	private String ins_date;
	private String upd_date;
	public int getFare_seq() {
		return fare_seq;
	}
	public void setFare_seq(int fare_seq) {
		this.fare_seq = fare_seq;
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
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
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
	

	
}
