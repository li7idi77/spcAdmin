package com.easycompany.service.vo;

import com.easycompany.cmm.vo.DefaultVO;

/**
 * 설 명 : MemberVo
 * @author 홍길동
 * @since 2019. 2. 1.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자              수정내용
 *  -------       --------    ---------------------------
 *  2019. 2. 1.     bjh                최초 생성
 * </pre>
 */
public class MemberVo extends DefaultVO {
	
	private String user_id;/* 유저ID */
	private String user_nm;/* 유저명 */
	private String password;/* 비밀번호 */
	private String password_chg_dt;/* 비밀번호변경일시 */
	private String user_group_cd;/* 유저그룹코드 */
	private String user_sttus_cd;/* 유저상태코드 */
	private String rjct_prvonsh_cn;/* 반려사유내용 */
	private String sesion_id;/* 세션ID */
	private int lgn_failr_cnt;/* 로그인실패수 */
	private String user_ip;/* 유저IP */
	private String job_cd;/* 직업_코드 */
	private String dept_nm;/* 부서명 */
	private String jbgd_nm;/* 직급명 */
	private String eml_cert_cd;/* 이메일인증코드 */
	private String eml_cert_yn;/* 이메일인증여부 */
	private String eml_addr;/* 이메일주소 */
	private String user_ncm_nm;/* 유저별칭명 */
	private String telno;/* 전화번호 */
	private String mbl_telno;/* 휴대전화번호 */
	private String prvc_agre_yn;/* 개인정보동의여부 */
	private String rm_cn;/* 비고내용 */
	private String reg_dt;/* 등록일시 */
	private String rgtr_id;/* 등록자ID */
	private String chg_dt;/* 변경일시 */
	private String changer_id;/* 변경자ID */
	private String news_email_yn;/* 재단소식지 신청 여부 */
	private String sms_yn;/* 따뜻한작별 문자서비스 신청여부 */
	private String pg_yn;/* 인증프로그램 유무 */
	private String birth_ymd;/* 생년월일 */
	private String coper_no;/* 사업자등록번호 */
	private String master_nm;/* 담당자 */
	private String zip_code;/* 우편번호 */
	private String juso;/* 주소 */
	private String juso_detail;/* 상세주소 */
	private String user_sex;/* 성별 */
	private String coper_gu_cd;/* 기관종류 */
	private String user_gu;/* 회원구분 개인/기업  */
	private String nickname_nm;/* 닉네임 */
	private String brvd_join_yn;/* 유가족지원서비스 가입여부 */
	private String brvd_rltn_cd;/* 고인과의관계 */
	private String brvd_death_ymd;/* 고인사망시기 */
	private String officer_yn;/* 실무자권한 신청여부 */
	private String officer_sttus_cd;/* 실무자권한 신청상태코드 */
	private String officer_org_cd;/* 실무자소속기관_코드 */
	private String guard_yn;/* 지켜줌인 신청여부 */
	private String guard_sttus_cd;/* 지켜줌인 신청상태코드 */
	private String guard_license;/* 지켜줌인 수료증번호 */
	private String volunteer_yn;/* 활동가 신청여부 */
	private String volunteer_sttus_cd;/* 활동가  신청상태코드 */
	private String volunteer_license;/* 활동가 위촉장번호 */
	private String instructor_yn;/* 강사 신청여부 */
	private String instructor_sttus_cd;/* 강사 신청상태코드 */
	private String instructor_license;/* 강사 수료증번호 */
	private String coper_nm;/* 기관명 */
	private String faxno;/* 팩스번호 */
	private String area_cd;/* 지역_코드 */
	private String edu_auth_cd;/* 교육권한_코드 */
	private String instructor_coper_nm;/* 강사_기관및 업체명 */
	
	private String user_group_cd_nm; /* 권한코드명 */
	private String login_dt;
	private String password_chg_dt_nm;
	private String userId;
	private String sesionId;
	private String edu_auth_cd_nm;
	private String org_manage_yn;        // 기관관리자 신청여부
	private String org_manage_sttus_cd;  // 기관관리자 신청상태코드
	private boolean isInstLmsAdmin;      // LMS 기관 관리자 여부
	private boolean isLmsAdmin;          // LMS 관리자 여부
	private boolean isInstLm;            // LMS 기관  여부
	
	private boolean isAdmin; // 관리자 여부
	
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public boolean getIsAdmin() {
		return isAdmin;
	}
	public boolean isInstLmsAdmin() {
		return isInstLmsAdmin;
	}
	public boolean getIsInstLmsAdmin() {
		return isInstLmsAdmin;
	}
	public void setInstLmsAdmin(boolean isInstLmsAdmin) {
		this.isInstLmsAdmin = isInstLmsAdmin;
	}
	public boolean isLmsAdmin() {
		return isLmsAdmin;
	}
	public boolean getIsLmsAdmin() {
		return isLmsAdmin;
	}
	public void setLmsAdmin(boolean isLmsAdmin) {
		this.isLmsAdmin = isLmsAdmin;
	}
	public boolean isInstLm() {
		return isInstLm;
	}
	public boolean getIsInst() {
		return isInstLm;
	}
	public void setInstLm(boolean isInstLm) {
		this.isInstLm = isInstLm;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_chg_dt() {
		return password_chg_dt;
	}
	public void setPassword_chg_dt(String password_chg_dt) {
		this.password_chg_dt = password_chg_dt;
	}
	public String getUser_group_cd() {
		return user_group_cd;
	}
	public void setUser_group_cd(String user_group_cd) {
		this.user_group_cd = user_group_cd;
	}
	public String getUser_sttus_cd() {
		return user_sttus_cd;
	}
	public void setUser_sttus_cd(String user_sttus_cd) {
		this.user_sttus_cd = user_sttus_cd;
	}
	public String getRjct_prvonsh_cn() {
		return rjct_prvonsh_cn;
	}
	public void setRjct_prvonsh_cn(String rjct_prvonsh_cn) {
		this.rjct_prvonsh_cn = rjct_prvonsh_cn;
	}
	public String getSesion_id() {
		return sesion_id;
	}
	public void setSesion_id(String sesion_id) {
		this.sesion_id = sesion_id;
	}
	public int getLgn_failr_cnt() {
		return lgn_failr_cnt;
	}
	public void setLgn_failr_cnt(int lgn_failr_cnt) {
		this.lgn_failr_cnt = lgn_failr_cnt;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	public String getJob_cd() {
		return job_cd;
	}
	public void setJob_cd(String job_cd) {
		this.job_cd = job_cd;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getJbgd_nm() {
		return jbgd_nm;
	}
	public void setJbgd_nm(String jbgd_nm) {
		this.jbgd_nm = jbgd_nm;
	}
	public String getEml_cert_cd() {
		return eml_cert_cd;
	}
	public void setEml_cert_cd(String eml_cert_cd) {
		this.eml_cert_cd = eml_cert_cd;
	}
	public String getEml_cert_yn() {
		return eml_cert_yn;
	}
	public void setEml_cert_yn(String eml_cert_yn) {
		this.eml_cert_yn = eml_cert_yn;
	}
	public String getEml_addr() {
		return eml_addr;
	}
	public void setEml_addr(String eml_addr) {
		this.eml_addr = eml_addr;
	}
	public String getUser_ncm_nm() {
		return user_ncm_nm;
	}
	public void setUser_ncm_nm(String user_ncm_nm) {
		this.user_ncm_nm = user_ncm_nm;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getMbl_telno() {
		return mbl_telno;
	}
	public void setMbl_telno(String mbl_telno) {
		this.mbl_telno = mbl_telno;
	}
	public String getPrvc_agre_yn() {
		return prvc_agre_yn;
	}
	public void setPrvc_agre_yn(String prvc_agre_yn) {
		this.prvc_agre_yn = prvc_agre_yn;
	}
	public String getRm_cn() {
		return rm_cn;
	}
	public void setRm_cn(String rm_cn) {
		this.rm_cn = rm_cn;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getRgtr_id() {
		return rgtr_id;
	}
	public void setRgtr_id(String rgtr_id) {
		this.rgtr_id = rgtr_id;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}
	public String getChanger_id() {
		return changer_id;
	}
	public void setChanger_id(String changer_id) {
		this.changer_id = changer_id;
	}
	public String getNews_email_yn() {
		return news_email_yn;
	}
	public void setNews_email_yn(String news_email_yn) {
		this.news_email_yn = news_email_yn;
	}
	public String getSms_yn() {
		return sms_yn;
	}
	public void setSms_yn(String sms_yn) {
		this.sms_yn = sms_yn;
	}
	public String getPg_yn() {
		return pg_yn;
	}
	public void setPg_yn(String pg_yn) {
		this.pg_yn = pg_yn;
	}
	public String getBirth_ymd() {
		return birth_ymd;
	}
	public void setBirth_ymd(String birth_ymd) {
		this.birth_ymd = birth_ymd;
	}
	public String getCoper_no() {
		return coper_no;
	}
	public void setCoper_no(String coper_no) {
		this.coper_no = coper_no;
	}
	public String getMaster_nm() {
		return master_nm;
	}
	public void setMaster_nm(String master_nm) {
		this.master_nm = master_nm;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public String getJuso_detail() {
		return juso_detail;
	}
	public void setJuso_detail(String juso_detail) {
		this.juso_detail = juso_detail;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getCoper_gu_cd() {
		return coper_gu_cd;
	}
	public void setCoper_gu_cd(String coper_gu_cd) {
		this.coper_gu_cd = coper_gu_cd;
	}
	public String getUser_gu() {
		return user_gu;
	}
	public void setUser_gu(String user_gu) {
		this.user_gu = user_gu;
	}
	public String getNickname_nm() {
		return nickname_nm;
	}
	public void setNickname_nm(String nickname_nm) {
		this.nickname_nm = nickname_nm;
	}
	public String getBrvd_join_yn() {
		return brvd_join_yn;
	}
	public void setBrvd_join_yn(String brvd_join_yn) {
		this.brvd_join_yn = brvd_join_yn;
	}
	public String getBrvd_rltn_cd() {
		return brvd_rltn_cd;
	}
	public void setBrvd_rltn_cd(String brvd_rltn_cd) {
		this.brvd_rltn_cd = brvd_rltn_cd;
	}
	public String getBrvd_death_ymd() {
		return brvd_death_ymd;
	}
	public void setBrvd_death_ymd(String brvd_death_ymd) {
		this.brvd_death_ymd = brvd_death_ymd;
	}
	public String getOfficer_yn() {
		return officer_yn;
	}
	public void setOfficer_yn(String officer_yn) {
		this.officer_yn = officer_yn;
	}
	public String getOfficer_sttus_cd() {
		return officer_sttus_cd;
	}
	public void setOfficer_sttus_cd(String officer_sttus_cd) {
		this.officer_sttus_cd = officer_sttus_cd;
	}
	public String getOfficer_org_cd() {
		return officer_org_cd;
	}
	public void setOfficer_org_cd(String officer_org_cd) {
		this.officer_org_cd = officer_org_cd;
	}
	public String getGuard_yn() {
		return guard_yn;
	}
	public void setGuard_yn(String guard_yn) {
		this.guard_yn = guard_yn;
	}
	public String getGuard_sttus_cd() {
		return guard_sttus_cd;
	}
	public void setGuard_sttus_cd(String guard_sttus_cd) {
		this.guard_sttus_cd = guard_sttus_cd;
	}
	public String getGuard_license() {
		return guard_license;
	}
	public void setGuard_license(String guard_license) {
		this.guard_license = guard_license;
	}
	public String getVolunteer_yn() {
		return volunteer_yn;
	}
	public void setVolunteer_yn(String volunteer_yn) {
		this.volunteer_yn = volunteer_yn;
	}
	public String getVolunteer_sttus_cd() {
		return volunteer_sttus_cd;
	}
	public void setVolunteer_sttus_cd(String volunteer_sttus_cd) {
		this.volunteer_sttus_cd = volunteer_sttus_cd;
	}
	public String getVolunteer_license() {
		return volunteer_license;
	}
	public void setVolunteer_license(String volunteer_license) {
		this.volunteer_license = volunteer_license;
	}
	public String getInstructor_yn() {
		return instructor_yn;
	}
	public void setInstructor_yn(String instructor_yn) {
		this.instructor_yn = instructor_yn;
	}
	public String getInstructor_sttus_cd() {
		return instructor_sttus_cd;
	}
	public void setInstructor_sttus_cd(String instructor_sttus_cd) {
		this.instructor_sttus_cd = instructor_sttus_cd;
	}
	public String getInstructor_license() {
		return instructor_license;
	}
	public void setInstructor_license(String instructor_license) {
		this.instructor_license = instructor_license;
	}
	public String getCoper_nm() {
		return coper_nm;
	}
	public void setCoper_nm(String coper_nm) {
		this.coper_nm = coper_nm;
	}
	public String getFaxno() {
		return faxno;
	}
	public void setFaxno(String faxno) {
		this.faxno = faxno;
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
	public String getInstructor_coper_nm() {
		return instructor_coper_nm;
	}
	public void setInstructor_coper_nm(String instructor_coper_nm) {
		this.instructor_coper_nm = instructor_coper_nm;
	}
	public String getUser_group_cd_nm() {
		return user_group_cd_nm;
	}
	public void setUser_group_cd_nm(String user_group_cd_nm) {
		this.user_group_cd_nm = user_group_cd_nm;
	}
	public String getLogin_dt() {
		return login_dt;
	}
	public void setLogin_dt(String login_dt) {
		this.login_dt = login_dt;
	}
	public String getPassword_chg_dt_nm() {
		return password_chg_dt_nm;
	}
	public void setPassword_chg_dt_nm(String password_chg_dt_nm) {
		this.password_chg_dt_nm = password_chg_dt_nm;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSesionId() {
		return sesionId;
	}
	public void setSesionId(String sesionId) {
		this.sesionId = sesionId;
	}
	
	public String getEdu_auth_cd_nm() {
		return edu_auth_cd_nm;
	}
	public void setEdu_auth_cd_nm(String edu_auth_cd_nm) {
		this.edu_auth_cd_nm = edu_auth_cd_nm;
	}
	public String getOrg_manage_yn() {
		return org_manage_yn;
	}
	public void setOrg_manage_yn(String org_manage_yn) {
		this.org_manage_yn = org_manage_yn;
	}
	public String getOrg_manage_sttus_cd() {
		return org_manage_sttus_cd;
	}
	public void setOrg_manage_sttus_cd(String org_manage_sttus_cd) {
		this.org_manage_sttus_cd = org_manage_sttus_cd;
	}

	
	
	
	
	
	

}