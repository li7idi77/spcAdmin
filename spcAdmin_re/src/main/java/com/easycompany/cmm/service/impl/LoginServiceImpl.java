package com.easycompany.cmm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easycompany.cmm.service.LoginService;
import com.easycompany.cmm.vo.Account;
import com.easycompany.cmm.vo.LoginVo;
import com.easycompany.mapper.LoginMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    public Account authenticate(String id, String password) {
    	return loginMapper.authenticate(id, password);
    }
    
    public LoginVo checkPassword(LoginVo loginVo) {
    	return loginMapper.checkPassword(loginVo);
    }
    
    public int signUpInsert(LoginVo loginVo) {
    	return loginMapper.signUpInsert(loginVo);
    }
    
    public LoginVo userLogin(LoginVo loginVo) {
    	return loginMapper.userLogin(loginVo);
    }

}
 