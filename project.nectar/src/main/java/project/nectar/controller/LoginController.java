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

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String email, String pwd, boolean rememberEmailPwd, String toURL, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String result = loginCheck(email, pwd);                              // loginCheck() 실행결과  "Admin","Biz","User","LoginFail" 중 하나 반환
        if (result.equals("LoginFail")){
            String msg = URLEncoder.encode("email 또는 pwd를 잘못 입력했습니다.", "utf-8");
            return "redirect:/login/login?msg=" + msg;
        }
        //로그인 체크 통과 못하면, 로그인화면으로 다시 돌아가
        //로그인 체크를 통과 하면, 세션 쿠키 처리

        //공통 코드 시작//
        HttpSession session = request.getSession();
        session.setAttribute(result + "_email", email);                   //세션 id, (Admin_email) or (Biz_email) or (User_email)
        session.setAttribute(result + "_pwd", pwd);

        System.out.println("session id = " + result+"_email");


        if (rememberEmailPwd) {
            Cookie cookieEmail = new Cookie(result + "_email", email); //쿠키, (Admin_email, ~~~) or (Biz_email, ~~) or (User_email, ~~)
            Cookie cookiePwd = new Cookie(result + "_pwd", pwd);
            response.addCookie(cookieEmail);
            response.addCookie(cookiePwd);
        } else {
            Cookie cookieEmail = new Cookie(result + "_email", email);
            Cookie cookiePwd = new Cookie(result + "_pwd", pwd);
            cookieEmail.setMaxAge(0);
            cookiePwd.setMaxAge(0);
            response.addCookie(cookieEmail);
            response.addCookie(cookiePwd);
        }
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
        //공통 코드 끝//
    }


    private String loginCheck(String email, String pwd) {
        if(loginCheck_Admin(email, pwd)){return "Admin" ;}       // (관리자)Admin으로 logincheck 성공시
        if(loginCheck_BizAccount(email, pwd)){return "Biz" ;}    // (사업자)BizAccount로 logincheck 성공시
        if(loginCheck_User(email, pwd)){return "User" ;}         // (사용자)User로 logincheck 성공시
        return "LoginFail";                                      // logincheck 실패시
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




    @GetMapping("/auth/google/callback")
    public String snsLoginCallback(Model m, @RequestParam String code, HttpServletRequest request) throws Exception{

        // 1. code를 이용해서 access_token 받기
        // 2. access_token 을 이용해서 사용자 profile 정보 받아오기

        SnsLogin snsLogin = new SnsLogin(googleSns);
        UserDto snsUser = snsLogin.getUserProfile(code); // 받아온 사용자 정보
        System.out.println("User profile = " + snsUser);

        // 3. DB에 해당 유저가 존재하는지 확인 (이거 loginCheck 쓰면됨)

        UserDto user = userDao.select(snsUser.getUser_email());
        System.out.println("user = " + user);
        if(user==null){

            // 4-1. 존재하지 않으면 가입시킨 후, 메인페이지로 이동시킨다.
            userDao.insert(snsUser);
            return "redirect:/";

        }else{

            // 4. 존재하면 강제 로그인시킨다.
//            HttpSession session = request.getSession();
//            session.setAttribute("id", user.getUser_email());

            String result = loginCheck(snsUser.getUser_email(), snsUser.getUser_pwd());   // loginCheck() 실행결과  "Admin","Biz","User","LoginFail" 중 하나 반환

            HttpSession session = request.getSession();
            session.setAttribute(result + "_email", snsUser.getUser_email());          // 세션 id, (Admin_email) or (Biz_email) or (User_email)
            session.setAttribute(result + "_pwd", snsUser.getUser_pwd());
            System.out.println("session id = " + result+"_email");
        }

        return "redirect:/";

    }

}


