package project.nectar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import project.nectar.auth.SnsLogin;
import project.nectar.auth.SnsValue;
import project.nectar.repository.AdminDao;
import project.nectar.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.repository.BizAccountDao;
import project.nectar.repository.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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


    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @GetMapping("/login")
    public String loginForm(Model m, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

        System.out.println(" ======================================================================================");
        System.out.println(" GET방식 login/login 지나감 ");


        // 로그인 페이지로 이동하기 전 URL 기억, (로그인 이후 원래 있던 페이지로 이동하기 위해)
        String referrer = request.getHeader("Referer"); // 이전 경로
        if(session.getAttribute("prevPage")==null){
            session.setAttribute("prevPage",referrer);
        }


        // 만약 로그인이 되어 있으면, 돌아가
        if (isAuthenticated()) {
            System.out.println("로그인 되어 있으니까 원래 있던 페이지로 돌아가");
            response.sendRedirect(referrer);
        }

        System.out.println(" ======================================================================================");


        // Google Code 발행을 위한 URL 생성
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        m.addAttribute("google_url", url);


        return "loginForm";
    }


    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }


    @PostMapping("/processing")
    public void login(String _csrf, String error) {

        logger.info("login-processing!");
        logger.info("err : "+ error);
        logger.info("_csrf : "+ _csrf);
    }



    @GetMapping("/auth/google/callback")
    public String snsLoginCallback(Model m, @RequestParam String code, HttpSession session, String toURL) throws Exception{

        SnsLogin snsLogin = new SnsLogin(googleSns);                                       // google 소셜 로그인
        UserDto snsUser = snsLogin.getUserProfile(code);                                   // code 를 이용해서 access_token 받기  >>>  access_token 을 이용해서 사용자 profile 정보 받아오기

        String email = snsUser.getUser_email();
        session.setAttribute("sns_email",email);

        if (!isValidEmail(email)) {                                                        // 가입되어 있지 않은 email 이면, 회원가입 시키고 로그인
            UserDto userDto = new UserDto(email, email, snsUser.getUser_name(), snsUser.getUser_phone(), snsUser.getUser_picture());
            m.addAttribute("userDto", userDto);
            return "registerFormSNS";
        }

        return "redirect:/login/login";
    }

    private boolean isValidEmail(String email) {
        return userDao.select(email)!=null;
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("logout complete");
        return "redirect:/";
    }



}

