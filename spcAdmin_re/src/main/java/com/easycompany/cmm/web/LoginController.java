package com.easycompany.cmm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.easycompany.cmm.service.LoginService;
import com.easycompany.cmm.service.SampleService;
import com.easycompany.cmm.util.EgovFileScrty;
import com.easycompany.cmm.vo.Account;
import com.easycompany.cmm.vo.LoginVo;
import  com.easycompany.cmm.util.StringUtil;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private SampleService sampleService;

    /**
     * 사용자로 부터 아이디, 패스워드를 입력받아 인증 성공이면 세션 객체에 계정정보를 담고 사원정보리스트 페이지로 포워딩한다. 인증에
     * 실패하면 로그인 페이지로 다시 리턴한다.
     */
    @RequestMapping("/loginProcess.do")
    public String login(HttpServletRequest request, @RequestParam("id") String id,
            @RequestParam("password") String password) {

        // TODO [Step 4-1-01] LoginService의 authenticate메소드를 이용하여 
    	// 로긴여부 체크 Account 객체를 리턴 받는다.
    	Account account = (Account) loginService.authenticate(id, password);

        /*
         * TODO [Step 4-1-03] 가져온 account 객체가 null 아닌 경우
         * request.getSession() 메소드를 통해 Session을 구해 UserAccount 이름으로 Session 에
         * Attribute로 저장한다. 그리고 "redirect:/loginSuccess.do" 값을 반환한다. null 인경우
         * "login" 반환한다.
         */
//    	return null;
    	
        if (account != null) {
            request.getSession().setAttribute("UserAccount", account);
            return "redirect:/loginSuccess.do";
        } else {
            return "login";
        }
    	
    } 

    // TODO [Step 4-1-04] loginSuccess.do 로 호출된 처리
    // (@RequestMapping(value="/loginSuccess.do", method=RequestMethod.GET) 를 위한
    // 메소드(loginSuccess) 를 void 타입의 public 메소드를 만들어라.
    @RequestMapping(value = "/loginSuccess.do", method = RequestMethod.GET)
    public void loginSuccess() {
    }
    

    @RequestMapping("/exception.do")
    public String invokeException(@RequestParam("id") String id ) throws Exception {
        
        sampleService.invokeMethodAException();
        
        return null;
    }
    
    
    /**   로그인  **/   
   @RequestMapping("/login.do")
    public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  return "login";
    }
    
    /** 로그아웃  **/   
    @RequestMapping("/logout.do")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        try {
			HttpSession session = request.getSession();
			session.invalidate();
			session = null;
		} catch (Exception e) {
			  return "logout";
		}
		return "logout";
    }
    
	/** 로그인 Check */
	@RequestMapping(value = "/loginUserCheckProcess.do")
	@ResponseBody
	public LoginVo loginUserCheckProcess(HttpServletRequest request, LoginVo loginVo) throws Exception {
			
		try {
			
			loginVo.setUser_id(loginVo.getUserId());
			loginVo.setSesion_id(loginVo.getSesionId());
			
			String shaPassword = EgovFileScrty.encryptPassword(loginVo.getPassword(), loginVo.getId());
			loginVo.setShaPassword(shaPassword);
			LoginVo loginVo1 = (LoginVo)loginService.userLogin(loginVo);
			
			if (loginVo1 == null) {
				loginVo.setResult( "FAIL") ;	
			}else {
				request.getSession().setAttribute("UserAccount", loginVo1);
				if(loginVo1.getUser_group_cd().equals("0003")) {
					request.getSession().setAttribute("AdminAccount", loginVo1);
				}				
				loginVo.setResult( "SUCCESS") ;	
			}
			
		} catch (Exception e) {
			loginVo.setResult( "FAIL") ;	
		}
		
		
		return loginVo;
	}
	
	
	/** 로그인 Check */
	@RequestMapping(value = "/loginUser.do")
	@ResponseBody
	public LoginVo loginUser(HttpServletRequest request, LoginVo loginVo) throws Exception {
			
		try {
			
			loginVo.setUser_id(loginVo.getUserId());
			loginVo.setSesion_id(loginVo.getSesionId());
			
			String shaPassword = EgovFileScrty.encryptPassword(loginVo.getPassword(), loginVo.getId());
			loginVo.setShaPassword(shaPassword);
			LoginVo loginVo1 = (LoginVo)loginService.userLogin(loginVo);
			
			if (loginVo1 == null) {
				loginVo.setResult( "FAIL") ;	
			}else {
				
				//기관 관리자
				if(!StringUtil.isEmpty(loginVo1.getOrg_manage_yn())  && "Y".equals(loginVo1.getOrg_manage_yn())) {
					loginVo1.setInstLmsAdmin(true);
				}
				
				//기관 여부
				if(!StringUtil.isEmpty(loginVo1.getUser_gu())  && "1".equals(loginVo1.getUser_gu())) {
					loginVo1.setInstLm(true);
				}
		
				//LMS 관리자
				if(loginVo1.getUser_group_cd().equals("0003")) {
					loginVo1.setLmsAdmin(true);
		
					request.getSession().setAttribute("AdminAccount", loginVo1);
				}		
				
				request.getSession().setAttribute("UserAccount", loginVo1);
				loginVo.setResult( "SUCCESS") ;	
			}
			
		} catch (Exception e) {
			loginVo.setResult( "FAIL") ;	
		}
		
		ModelAndView modelAndView = new ModelAndView("redirect:/user/");			
		throw new ModelAndViewDefiningException(modelAndView);

	}
	
	/** 로그인 Check */
	@RequestMapping(value = "/loginAdminCheckProcess.do")
	@ResponseBody
	public LoginVo loginAdminCheckProcess(HttpServletRequest request, LoginVo loginVo) throws Exception {
			
		try {
			
			loginVo.setUser_id(loginVo.getUserId());
			loginVo.setSesion_id(loginVo.getSesionId());
			
			String shaPassword = EgovFileScrty.encryptPassword(loginVo.getPassword(), loginVo.getId());
			loginVo.setShaPassword(shaPassword);
			LoginVo loginVo1 = (LoginVo)loginService.checkPassword(loginVo);
			
			if (loginVo1 == null) {
				loginVo.setResult( "FAIL") ;	
			}else {
				request.getSession().setAttribute("UserAccount", loginVo1);
				request.getSession().setAttribute("AdminAccount", loginVo1);
				loginVo.setResult( "SUCCESS") ;	
			}
			
		} catch (Exception e) {
			loginVo.setResult( "FAIL") ;	
		}
		return loginVo;
	}
	
	
	/** 로그인 - 센톡 */
	@RequestMapping(value = "/loginCheckProcessbak.do")
	public String loginCheckProcessbak(HttpServletRequest request, LoginVo loginVo) throws Exception {
			
		try {
			
			String shaPassword = EgovFileScrty.encryptPassword(loginVo.getPassword(), loginVo.getId());
			loginVo.setShaPassword(shaPassword);
			LoginVo loginVo1 = (LoginVo)loginService.checkPassword(loginVo);
			
			if (loginVo1 == null) {
				return "login";
			}else {
				request.getSession().setAttribute("AdminAccount", loginVo);
				return "redirect:/member/memberList.do";
			}
			
		} catch (Exception e) {
			return "login";
		}
	}
	/****
	 * 회원가입 
	 * **/ 
	@RequestMapping("/signup.do")
	public String signup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "signup";
    }
	
	/**  회원 가입 - 센톡 */
	@RequestMapping(value = "/signupProcess.do")
	@ResponseBody
	public LoginVo signupProcess(HttpServletRequest request, LoginVo loginVo) throws Exception {
			
		try {
			
			String shaPassword = EgovFileScrty.encryptPassword(loginVo.getPassword(), loginVo.getId());
			loginVo.setShaPassword(shaPassword);
			
			LoginVo loginVo1 = (LoginVo)loginService.checkPassword(loginVo);
			if (loginVo1 != null) {
				loginVo.setResult("EXIST");
				return loginVo;
			}
			
			int resultCnt = loginService.signUpInsert(loginVo);
			loginVo.setResult(resultCnt > 0 ? "SUCCESS" : "FAIL") ;			
			
		} catch (Exception e) {
			loginVo.setResult("FAIL");
		}
		
		return loginVo;
	}
}
