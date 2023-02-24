package teamProject.controller;

import teamProject.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    //git branch test
    @GetMapping("/login")
    public String loginForm(){
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pwd, boolean rememberIdPwd, String toURL, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        if(!loginCheck(id, pwd)){
            String msg = URLEncoder.encode("id 또는 pwd를 잘못 입력했습니다.","utf-8");
            return "redirect:/login/login?msg="+msg;
        }
        //로그인 체크를 통과하면,
        //세션, 쿠키 처리
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        session.setAttribute("pwd", pwd);

        if(rememberIdPwd) {
            Cookie cookieId = new Cookie("id",id);
            Cookie cookiePwd = new Cookie("pwd",pwd);
            response.addCookie(cookieId);
            response.addCookie(cookiePwd);
        }else{
            Cookie cookieId = new Cookie("id",id);
            Cookie cookiePwd = new Cookie("pwd",pwd);
            cookieId.setMaxAge(0);
            cookiePwd.setMaxAge(0);
            response.addCookie(cookieId);
            response.addCookie(cookiePwd);
        }
        toURL = toURL==null || toURL.equals("")? "/" : toURL;
        return "redirect:"+toURL;
    }


    private boolean loginCheck(String id, String pwd) {
        return "asdf".equals(id) &&"1234".equals(pwd);
    }


}
