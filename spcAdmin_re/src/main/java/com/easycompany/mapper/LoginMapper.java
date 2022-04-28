package com.easycompany.mapper;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.easycompany.cmm.vo.Account;
import com.easycompany.cmm.vo.LoginVo;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("loginMapper")
public class LoginMapper extends EgovAbstractMapper{

	String nameSpace = "com.easycompany.mapper.LoginMapper";
	
	public Account authenticate(String id, String password) throws DataAccessException{
		Account account = new Account();
		account.setEmployeeid(id);
		account.setPassword(password);
		return (Account)selectOne("com.easycompany.mapper.EmpMapper.authenticate", account);
	}
	
	public LoginVo checkPassword(LoginVo loginVo) throws DataAccessException{
		return (LoginVo)selectOne(nameSpace + "." +"checkPassword", loginVo);
	}
	
	public int signUpInsert(LoginVo loginVo) throws DataAccessException{
		return insert(nameSpace + "." +"signUpInsert", loginVo);
	}
	
	public LoginVo userLogin(LoginVo loginVo) throws DataAccessException{
		return (LoginVo)selectOne(nameSpace + "." +"userLogin", loginVo);
	}
	
		
}
