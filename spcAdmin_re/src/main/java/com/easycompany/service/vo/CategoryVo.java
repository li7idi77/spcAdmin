package com.easycompany.service.vo;

public class CategoryVo extends MemberVo 
{
  int category1_key;
  String category1_name;
  int category2_key;
  String category2_name;
  int category3_key;
  String category3_name;
  String gubun1;
  String gubun2;
  String categoryName;
  String reg_dt;
  String reg_id;
  String chg_id;
  String chg_dt;
  String file_uuid;
  String file_name;
  String file_full_path;
  int file_seq;
  String category3_cont;
  long file_size;
  String edu_name;
  String edu_start_date;
  String edu_end_date;
  String edu_org_name;
  String edu_target;
  int edu_number;
  String edu_teac_name;
  int edu_key;
  int code_cd;
  String code_name;
  String gubun3;
  String checkdstr;
  String checkdate;
  String site;
  int edu_no;
  int edu_sub_no;
  String edu_site;
  String edu_ver;
 // String coper_nm;
  String train_s_date;
  String train_e_date;
  String app_e_date;
  String app_s_date;
  String edu_cont;
  String edu_method;
  String edu_time;
  String edu_garden;
  String edu_status;
  String exp_use_yn;
  String edu_notice;
  String edu_intro;
  String edu_goals;
  String edu_curr1;
  String edu_curr2;
  String edu_curr3;
  String inst_nm;
  String set_use_yn;
  String[] edu_curr1_arr;
  String[] edu_curr2_arr;
  String[] edu_curr3_arr;
  String fileExit;
  String coper_nm_auto;
  String coper_id;
  String coper_check;
  int    file_key;
  String cd_no;
  String up_cd_no;
  String cd;
  String user_id;
  String area_cd;
  String edu_auth_cd;
  String sort_ordr;
  //String instructor_coper_nm;
  String cd_nm;
  String coper_nm1;
  int    totCnt;
  int cour_no;
  int basket_no;
  private String cour_finish;
  private String category3_name1;
  private int cnt;
  private int schedule_no;
  
  private String edu_datetime;
  private String edu_place;
  
  public String getCoper_nm_auto()
  {
    return this.coper_nm_auto;
  }

  public void setCoper_nm_auto(String coper_nm_auto) {
    this.coper_nm_auto = coper_nm_auto;
  }

  public String getCoper_id() {
    return this.coper_id;
  }

  public void setCoper_id(String coper_id) {
    this.coper_id = coper_id;
  }

  public String getCoper_check() {
    return this.coper_check;
  }

  public void setCoper_check(String coper_check) {
    this.coper_check = coper_check;
  }

  public String getSet_use_yn() {
    return this.set_use_yn;
  }

  public void setSet_use_yn(String set_use_yn) {
    this.set_use_yn = set_use_yn;
  }

  public String getInst_nm() {
    return this.inst_nm;
  }

  public void setInst_nm(String inst_nm) {
    this.inst_nm = inst_nm;
  }

  public int getFile_key() {
	return file_key;
}

public void setFile_key(int file_key) {
	this.file_key = file_key;
}

public String getSite() {
    return this.site;
  }

  public void setSite(String site) {
    this.site = site;
  }

  public String getCheckdate()
  {
    return this.checkdate;
  }

  public void setCheckdate(String checkdate) {
    this.checkdate = checkdate;
  }

  public String getCheckdstr() {
    return this.checkdstr;
  }

  public void setCheckdstr(String checkdstr) {
    this.checkdstr = checkdstr;
  }

  public String getGubun3() {
    return this.gubun3;
  }

  public void setGubun3(String gubun3) {
    this.gubun3 = gubun3;
  }

  public int getCode_cd() {
    return this.code_cd;
  }

  public void setCode_cd(int code_cd) {
    this.code_cd = code_cd;
  }

  public String getCode_name() {
    return this.code_name;
  }

  public void setCode_name(String code_name) {
    this.code_name = code_name;
  }

  public int getCategory1_key() {
    return this.category1_key;
  }

  public void setCategory1_key(int category1_key) {
    this.category1_key = category1_key;
  }

  public String getCategory1_name() {
    return this.category1_name;
  }

  public void setCategory1_name(String category1_name) {
    this.category1_name = category1_name;
  }

  public int getCategory2_key() {
    return this.category2_key;
  }

  public void setCategory2_key(int category2_key) {
    this.category2_key = category2_key;
  }

  public String getCategory2_name() {
    return this.category2_name;
  }

  public void setCategory2_name(String category2_name) {
    this.category2_name = category2_name;
  }

  public int getCategory3_key() {
    return this.category3_key;
  }

  public void setCategory3_key(int category3_key) {
    this.category3_key = category3_key;
  }

  public String getCategory3_name() {
    return this.category3_name;
  }

  public void setCategory3_name(String category3_name) {
    this.category3_name = category3_name;
  }

  public String getGubun1() {
    return this.gubun1;
  }

  public void setGubun1(String gubun1) {
    this.gubun1 = gubun1;
  }

  public String getGubun2() {
    return this.gubun2;
  }

  public void setGubun2(String gubun2) {
    this.gubun2 = gubun2;
  }

  public String getCategoryName() {
    return this.categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  public String getReg_dt() {
    return this.reg_dt;
  }

  public void setReg_dt(String reg_dt) {
    this.reg_dt = reg_dt;
  }

  public String getReg_id() {
    return this.reg_id;
  }

  public void setReg_id(String reg_id) {
    this.reg_id = reg_id;
  }

  public String getChg_id() {
    return this.chg_id;
  }

  public void setChg_id(String chg_id) {
    this.chg_id = chg_id;
  }

  public String getChg_dt() {
    return this.chg_dt;
  }

  public void setChg_dt(String chg_dt) {
    this.chg_dt = chg_dt;
  }

  public String getFile_uuid() {
    return this.file_uuid;
  }

  public void setFile_uuid(String file_uuid) {
    this.file_uuid = file_uuid;
  }

  public String getFile_name() {
    return this.file_name;
  }

  public void setFile_name(String file_name) {
    this.file_name = file_name;
  }

  public String getFile_full_path() {
    return this.file_full_path;
  }

  public void setFile_full_path(String file_full_path) {
    this.file_full_path = file_full_path;
  }

  public int getFile_seq() {
    return this.file_seq;
  }

  public void setFile_seq(int file_seq) {
    this.file_seq = file_seq;
  }

  public String getTrain_e_date() {
    return this.train_e_date;
  }

  public void setTrain_e_date(String train_e_date) {
    this.train_e_date = train_e_date;
  }

  public String getApp_s_date() {
    return this.app_s_date;
  }

  public void setApp_s_date(String app_s_date) {
    this.app_s_date = app_s_date;
  }

  public String getCategory3_cont() {
    return this.category3_cont;
  }

  public void setCategory3_cont(String category3_cont) {
    this.category3_cont = category3_cont;
  }

  public long getFile_size() {
    return this.file_size;
  }

  public void setFile_size(long file_size) {
    this.file_size = file_size;
  }

  public String getEdu_name() {
    return this.edu_name;
  }

  public void setEdu_name(String edu_name) {
    this.edu_name = edu_name;
  }

  public String getEdu_start_date() {
    return this.edu_start_date;
  }

  public void setEdu_start_date(String edu_start_date) {
    this.edu_start_date = edu_start_date;
  }

  public String getEdu_end_date() {
    return this.edu_end_date;
  }

  public void setEdu_end_date(String edu_end_date) {
    this.edu_end_date = edu_end_date;
  }

  public String getEdu_org_name() {
    return this.edu_org_name;
  }

  public void setEdu_org_name(String edu_org_name) {
    this.edu_org_name = edu_org_name;
  }

  public String getEdu_target() {
    return this.edu_target;
  }

  public void setEdu_target(String edu_target) {
    this.edu_target = edu_target;
  }

  public int getEdu_number() {
    return this.edu_number;
  }

  public void setEdu_number(int edu_number) {
    this.edu_number = edu_number;
  }

  public String getEdu_teac_name() {
    return this.edu_teac_name;
  }

  public void setEdu_teac_name(String edu_teac_name) {
    this.edu_teac_name = edu_teac_name;
  }

  public int getEdu_key() {
    return this.edu_key;
  }

  public void setEdu_key(int edu_key) {
    this.edu_key = edu_key;
  }

  public int getEdu_no() {
    return this.edu_no;
  }

  public void setEdu_no(int edu_no) {
    this.edu_no = edu_no;
  }

  public int getEdu_sub_no() {
    return this.edu_sub_no;
  }

  public void setEdu_sub_no(int edu_sub_no) {
    this.edu_sub_no = edu_sub_no;
  }

  public String getEdu_site() {
    return this.edu_site;
  }

  public void setEdu_site(String edu_site) {
    this.edu_site = edu_site;
  }

  public String getEdu_ver() {
    return this.edu_ver;
  }

  public void setEdu_ver(String edu_ver) {
    this.edu_ver = edu_ver;
  }

//  public String getCoper_nm() {
//    return this.coper_nm;
//  }
//
//  public void setCoper_nm(String coper_nm) {
//    this.coper_nm = coper_nm;
//  }

  public String getTrain_s_date() {
    return this.train_s_date;
  }

  public void setTrain_s_date(String train_s_date) {
    this.train_s_date = train_s_date;
  }

  public String getApp_e_date() {
    return this.app_e_date;
  }

  public void setApp_e_date(String app_e_date) {
    this.app_e_date = app_e_date;
  }

  public String getEdu_cont() {
    return this.edu_cont;
  }

  public void setEdu_cont(String edu_cont) {
    this.edu_cont = edu_cont;
  }

  public String getEdu_method() {
    return this.edu_method;
  }

  public void setEdu_method(String edu_method) {
    this.edu_method = edu_method;
  }

  public String getEdu_time() {
    return this.edu_time;
  }

  public void setEdu_time(String edu_time) {
    this.edu_time = edu_time;
  }

  public String getEdu_garden() {
    return this.edu_garden;
  }

  public void setEdu_garden(String edu_garden) {
    this.edu_garden = edu_garden;
  }

  public String getEdu_status() {
    return this.edu_status;
  }

  public void setEdu_status(String edu_status) {
    this.edu_status = edu_status;
  }

  public String getExp_use_yn() {
    return this.exp_use_yn;
  }

  public void setExp_use_yn(String exp_use_yn) {
    this.exp_use_yn = exp_use_yn;
  }

  public String getEdu_notice() {
    return this.edu_notice;
  }

  public void setEdu_notice(String edu_notice) {
    this.edu_notice = edu_notice;
  }

  public String getEdu_intro() {
    return this.edu_intro;
  }

  public void setEdu_intro(String edu_intro) {
    this.edu_intro = edu_intro;
  }

  public String getEdu_goals() {
    return this.edu_goals;
  }

  public void setEdu_goals(String edu_goals) {
    this.edu_goals = edu_goals;
  }

  public String getEdu_curr1() {
    return this.edu_curr1;
  }

  public void setEdu_curr1(String edu_curr1) {
    this.edu_curr1 = edu_curr1;
  }

  public String getEdu_curr2() {
    return this.edu_curr2;
  }

  public void setEdu_curr2(String edu_curr2) {
    this.edu_curr2 = edu_curr2;
  }

  public String getEdu_curr3() {
    return this.edu_curr3;
  }

  public void setEdu_curr3(String edu_curr3) {
    this.edu_curr3 = edu_curr3;
  }

  public String[] getEdu_curr1_arr() {
    return this.edu_curr1_arr;
  }

  public void setEdu_curr1_arr(String[] edu_curr1_arr) {
    this.edu_curr1_arr = edu_curr1_arr;
  }

  public String[] getEdu_curr2_arr() {
    return this.edu_curr2_arr;
  }

  public void setEdu_curr2_arr(String[] edu_curr2_arr) {
    this.edu_curr2_arr = edu_curr2_arr;
  }

  public String[] getEdu_curr3_arr() {
    return this.edu_curr3_arr;
  }

  public void setEdu_curr3_arr(String[] edu_curr3_arr) {
    this.edu_curr3_arr = edu_curr3_arr;
  }

  public String getFileExit() {
    return this.fileExit;
  }

  public void setFileExit(String fileExit) {
    this.fileExit = fileExit;
  }

public String getCd_no() {
	return cd_no;
}

public void setCd_no(String cd_no) {
	this.cd_no = cd_no;
}

public String getUp_cd_no() {
	return up_cd_no;
}

public void setUp_cd_no(String up_cd_no) {
	this.up_cd_no = up_cd_no;
}

public String getCd() {
	return cd;
}

public void setCd(String cd) {
	this.cd = cd;
}

public String getCd_nm() {
	return cd_nm;
}

public void setCd_nm(String cd_nm) {
	this.cd_nm = cd_nm;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getArea_cd() {
	return area_cd;
}

public void setArea_cd(String area_cd) {
	this.area_cd = area_cd;
}

public String getEdu_auth_cd() {
	return edu_auth_cd;
}

public void setEdu_auth_cd(String edu_auth_cd) {
	this.edu_auth_cd = edu_auth_cd;
}

public String getSort_ordr() {
	return sort_ordr;
}

public void setSort_ordr(String sort_ordr) {
	this.sort_ordr = sort_ordr;
}

//public String getInstructor_coper_nm() {
//	return instructor_coper_nm;
//}
//
//public void setInstructor_coper_nm(String instructor_coper_nm) {
//	this.instructor_coper_nm = instructor_coper_nm;
//}

public String getCoper_nm1() {
	return coper_nm1;
}

public void setCoper_nm1(String coper_nm1) {
	this.coper_nm1 = coper_nm1;
}

public int getTotCnt() {
	return totCnt;
}

public void setTotCnt(int totCnt) {
	this.totCnt = totCnt;
}

public int getCour_no() {
	return cour_no;
}

public void setCour_no(int cour_no) {
	this.cour_no = cour_no;
}

public int getBasket_no() {
	return basket_no;
}

public void setBasket_no(int basket_no) {
	this.basket_no = basket_no;
}

public String getCour_finish() {
	return cour_finish;
}

public void setCour_finish(String cour_finish) {
	this.cour_finish = cour_finish;
}

public String getCategory3_name1() {
	return category3_name1;
}

public void setCategory3_name1(String category3_name1) {
	this.category3_name1 = category3_name1;
}

/**
 * @return the cnt
 */
public int getCnt() {
	return cnt;
}

/**
 * @param cnt the cnt to set
 */
public void setCnt(int cnt) {
	this.cnt = cnt;
}

public String getEdu_datetime() {
	return edu_datetime;
}

public void setEdu_datetime(String edu_datetime) {
	this.edu_datetime = edu_datetime;
}

public String getEdu_place() {
	return edu_place;
}

public void setEdu_place(String edu_place) {
	this.edu_place = edu_place;
}

public int getSchedule_no() {
	return schedule_no;
}

public void setSchedule_no(int schedule_no) {
	this.schedule_no = schedule_no;
}
}