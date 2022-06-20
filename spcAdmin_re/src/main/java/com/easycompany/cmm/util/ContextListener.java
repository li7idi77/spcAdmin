package com.easycompany.cmm.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class ContextListener implements ServletContextListener{
	static Session SSH_SESSION;
    static JSch jsch = new JSch();

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        if(SSH_SESSION != null){
            SSH_SESSION.disconnect();
        }
        if(jsch != null){
            jsch = null;
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {

        java.util.Properties config = new java.util.Properties();
        config.put("StrictHostKeyChecking", "no");

        try {
            SSH_SESSION = jsch.getSession("아이디", "접속할서버아이피", 포트번호);
            SSH_SESSION.setPassword("비밀번호");
            SSH_SESSION.setConfig(config);
            SSH_SESSION.connect();
            SSH_SESSION.setPortForwardingL(가상포트, "127.0.0.1", 사용할데이터베이스포트);
        } catch (JSchException e) {
            e.printStackTrace();
        }
    }
}