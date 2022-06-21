package com.easycompany.cmm.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


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
            SSH_SESSION = jsch.getSession("ncloud", "223.130.173.101", 22);
            SSH_SESSION.setPassword("todaudwhswnd12!@");
            SSH_SESSION.setConfig(config);
            SSH_SESSION.connect();
            SSH_SESSION.setPortForwardingL(3366, "172.20.3.6", 3306);
        } catch (JSchException e) {
            e.printStackTrace();
        }
    }
}