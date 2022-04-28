package com.easycompany.mapper;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.easycompany.cmm.vo.DefaultVO;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.service.vo.BoardVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("memberMapper")
public class MemberMapper extends EgovAbstractMapper{

	//private static final Logger LOGGER = LoggerFactory.getLogger(BoardMapper.class);
	
	String nameSpace = "com.easycompany.mapper.MemberMapper";
	
	public List<LoginVo> getMemberList(DefaultVO searchVO) throws DataAccessException {
		return selectList(nameSpace + "." +"getMemberList", searchVO);
	}

	public int getMemberCount(DefaultVO searchVO) {
		return (Integer)selectOne(nameSpace + "." +"getMemberCount", searchVO);
	}
	
	public LoginVo getMemberView(LoginVo loginVo) {
		return selectOne(nameSpace + "." +"getMemberView", loginVo);
	}
	
	public int updateMember(LoginVo loginVo) {
		return update(nameSpace + "." +"updateMember", loginVo);
	}
}
