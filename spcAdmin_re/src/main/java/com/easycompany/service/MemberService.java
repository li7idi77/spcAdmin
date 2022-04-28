package com.easycompany.service;

import java.util.List;
import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.cmm.vo.LoginVo;

public interface MemberService {
	
	
	public List<LoginVo> getMemberList(DefaultVO searchVO) throws Exception;
	public int getMemberCount(DefaultVO searchVO);
	public LoginVo getMemberView(LoginVo loginVo);
	public int updateMember(LoginVo loginVo);
	
	
}
