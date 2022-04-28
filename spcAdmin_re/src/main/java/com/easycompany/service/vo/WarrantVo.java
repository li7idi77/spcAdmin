package com.easycompany.service.vo;

import com.easycompany.cmm.vo.DefaultVO;

@SuppressWarnings("serial")
public class WarrantVo extends DefaultVO {
	
	int license_idx;
	String category1_name;
	String category2_name;
	String category3_name;
	int category1_key;
	int category2_key;
	int category3_key;
	String reg_dt;
	String reg_id;
	String chg_id;
	String chg_dt;
	Boolean license_status;
	String gubun1;
	String license_type;
	
	public int getLicense_idx() {
		return license_idx;
	}
	public void setLicense_idx(int license_idx) {
		this.license_idx = license_idx;
	}
	public String getCategory1_name() {
		return category1_name;
	}
	public void setCategory1_name(String category1_name) {
		this.category1_name = category1_name;
	}
	public String getCategory2_name() {
		return category2_name;
	}
	public void setCategory2_name(String category2_name) {
		this.category2_name = category2_name;
	}
	public String getCategory3_name() {
		return category3_name;
	}
	public void setCategory3_name(String category3_name) {
		this.category3_name = category3_name;
	}
	public int getCategory1_key() {
		return category1_key;
	}
	public void setCategory1_key(int category1_key) {
		this.category1_key = category1_key;
	}
	public int getCategory2_key() {
		return category2_key;
	}
	public void setCategory2_key(int category2_key) {
		this.category2_key = category2_key;
	}
	public int getCategory3_key() {
		return category3_key;
	}
	public void setCategory3_key(int category3_key) {
		this.category3_key = category3_key;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getChg_id() {
		return chg_id;
	}
	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}
	public Boolean getLicense_status() {
		return license_status;
	}
	public void setLicense_status(Boolean license_status) {
		this.license_status = license_status;
	}
	
	public String getGubun1() {
		return gubun1;
	}
	public void setGubun1(String gubun1) {
		this.gubun1 = gubun1;
	}
	
	public String getLicense_type() {
		return license_type;
	}
	public void setLicense_type(String license_type) {
		this.license_type = license_type;
	}
	
}
