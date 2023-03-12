package project.nectar.controller;

import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import project.nectar.auth.SnsLogin;
import project.nectar.auth.SnsValue;
import project.nectar.repository.AdminDao;
import project.nectar.domain.AdminDto;
import project.nectar.domain.BizAccountDto;
import project.nectar.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.repository.BizAccountDao;
import project.nectar.repository.UserDao;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserDao userDao;
    @Autowired
    BizAccountDao bizAccountDao;
    @Autowired
    AdminDao adminDao;
    @Autowired(required = false)
    SnsValue googleSns;

    @Autowired(required = false)
    GoogleConnectionFactory googleConnectionFactory;

    @Autowired(required = false)
    OAuth2Parameters googleOAuth2Parameters;

    @GetMapping("/login")
    public String loginForm(Model m) {
        // Google Code 발행을 위한 URL 생성
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        m.addAttribute("google_url", url);

        return "loginForm";
    }

    @PostMapping("/login")
    public String login(String email, String pwd, boolean rememberEmailPwd, String toURL, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException {

        String result = loginCheck(email, pwd);                                            //    loginCheck() 실행결과  "Admin","Biz","User","LoginFail" 중 하나 반환
        if (result.equals("LoginFail")){                                                   // 1. loginCheck() 실패 시, 회원가입 시킨 후 메인페이지로 이동시킨다.
            String msg = URLEncoder.encode("email 또는 pwd를 잘못 입력했습니다.", "utf-8");
            return "redirect:/login/login?msg=" + msg;
        }
        session.setAttribute(result + "_email", email);                                 // 2. loginCheck() 성공 시, 세션에 ("Admin_email",email)  ("Biz_email",email)  ("User_email",email) 중 하나 추가
        System.out.println("session check = " + result+"계정으로 로그인");
        System.out.println("session id = " + session.getAttribute(result+"_email"));


        if (rememberEmailPwd) {
            Cookie cookieEmail = new Cookie("email", email);
            Cookie cookiePwd = new Cookie("pwd", pwd);
            response.addCookie(cookieEmail);
            response.addCookie(cookiePwd);
        } else {
            Cookie cookieEmail = new Cookie("email", email);
            Cookie cookiePwd = new Cookie("pwd", pwd);
            cookieEmail.setMaxAge(0);
            cookiePwd.setMaxAge(0);
            response.addCookie(cookieEmail);
            response.addCookie(cookiePwd);
        }
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
    }


    @GetMapping("/auth/google/callback")
    public String snsLoginCallback(Model m, @RequestParam String code, HttpSession session, String toURL) throws Exception{

        SnsLogin snsLogin = new SnsLogin(googleSns);                                       // google 소셜 로그인
        UserDto snsUser = snsLogin.getUserProfile(code);                                   // code 를 이용해서 access_token 받기  >>>  access_token 을 이용해서 사용자 profile 정보 받아오기
//        System.out.println("snsUser = " + snsUser);

        String result = loginCheck(snsUser.getUser_email(), snsUser.getUser_pwd());        //    loginCheck() 실행결과  "Admin","Biz","User","LoginFail" 중 하나 반환
        if (result.equals("LoginFail")){                                                   // 1. loginCheck() 실패 시, 회원가입 시킨 후 메인페이지로 이동시킨다.
            userDao.insert(snsUser);
            return "redirect:/";
        }
        session.setAttribute(result + "_email", snsUser.getUser_email());               // 2. loginCheck() 성공 시, 세션에 ("Admin_email",email)  ("Biz_email",email)  ("User_email",email) 중 하나 추가
        System.out.println("session check = " + result+"계정으로 로그인");
        System.out.println("session id = " + session.getAttribute(result+"_email"));

        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("logout complete");
        return "redirect:/";
    }


    @GetMapping("/beforeReview")
    private String LoginBeforeReview(Integer restr_NUM){
        String toURL = "/restr/read?restr_NUM="+restr_NUM;
        return "redirect:/login/login?toURL="+toURL;
    }
    // restr.jsp에서 리뷰를 작성하기 전 로그인이 되어있지 않으면, 로그인 할 지를 물어보고 동의하면 /login/beforeReview 로 보낸다.
    // toURL에 /restr/read 를 담고, 로그인 성공 후 toURL로 이동한다.



    private String loginCheck(String email, String pwd) {
        if(loginCheck_Admin(email, pwd)){return "Admin" ;}       // 입력한 정보가 관리자(Admin) 계정인지 check
        if(loginCheck_BizAccount(email, pwd)){return "Biz" ;}    // 입력한 정보가 사업자(BizAccount) 계정인지 check
        if(loginCheck_User(email, pwd)){return "User" ;}         // 입력한 정보가 사용자(User) 계정인지 check
        return "LoginFail";                                      // 해당 사항이 없을 시, "LoginFail"
    }


    private boolean loginCheck_Admin(String email, String pwd) {
        AdminDto admin = null;
        try {
            admin = adminDao.select(email);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return admin != null && admin.getAdmin_pwd().equals(pwd);
    }


    private boolean loginCheck_BizAccount(String email, String pwd) {
        BizAccountDto biz = null;
        try {
            biz = bizAccountDao.select(email);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return biz != null && biz.getBizAccount_pwd().equals(pwd);
    }


    private boolean loginCheck_User(String email, String pwd) {
        UserDto user = null;
        try {
            user = userDao.select(email);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return user != null && user.getUser_pwd().equals(pwd);
    }

}

