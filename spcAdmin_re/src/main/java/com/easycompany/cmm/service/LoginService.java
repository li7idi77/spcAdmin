package com.easycompany.cmm.service;

import com.easycompany.cmm.vo.Account;
import com.easycompany.cmm.vo.LoginVo;

public interface LoginService {
	
	public Account authenticate(String id, String password);	
	public LoginVo checkPassword(LoginVo loginVo);		
	public int signUpInsert(LoginVo loginVo);		
	public LoginVo userLogin(LoginVo loginVo);		
	
}
