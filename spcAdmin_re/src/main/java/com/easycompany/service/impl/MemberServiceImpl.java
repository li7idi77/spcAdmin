package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.mapper.MemberMapper;
import com.easycompany.service.MemberService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("memberService")
public  class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;	
	
	public List<LoginVo> getMemberList(DefaultVO searchVO) throws Exception{
		return memberMapper.getMemberList(searchVO);
	}
	
	public int getMemberCount(DefaultVO searchVO) {
		return memberMapper.getMemberCount(searchVO);
	}
	
	public LoginVo getMemberView(LoginVo loginVo) {
		return memberMapper.getMemberView(loginVo);
	}
	public int updateMember(LoginVo loginVo) {
		return memberMapper.updateMember(loginVo);
	}
}
