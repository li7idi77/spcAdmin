package com.easycompany.service.vo;

import com.easycompany.cmm.vo.DefaultVO;

@SuppressWarnings("serial")
public class InstructorVo extends DefaultVO {
	
	Long board_idx;
	String board_type;
	String title;
	String contents;
	String link_url;
	String file_id;
	Long view_cnt;
	String reg_dt;
	String reg_id;
	String chg_id;
	String chg_dt;
	String searchDate;
	String board_start_date;
	String board_end_date;
	String gubun1;
	String category1_name;
	String category2_name;
	String category3_name;
	int category1_key;
	int category2_key;
	int category3_key;
	String notice_yn;
	
	public Long getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(Long board_idx) {
		this.board_idx = board_idx;
	}
	
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getLink_url() {
		return link_url;
	}
	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public Long getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(Long view_cnt) {
		this.view_cnt = view_cnt;
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
	
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	
	public String getBoard_start_date() {
		return board_start_date;
	}
	public void setBoard_start_date(String board_start_date) {
		this.board_start_date = board_start_date;
	}
	public String getBoard_end_date() {
		return board_end_date;
	}
	public void setBoard_end_date(String board_end_date) {
		this.board_end_date = board_end_date;
	}
	
	public String getGubun1() {
		return gubun1;
	}
	public void setGubun1(String gubun1) {
		this.gubun1 = gubun1;
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
	public String getNotice_yn() {
		return notice_yn;
	}
	public void setNotice_yn(String notice_yn) {
		this.notice_yn = notice_yn;
	}

}
