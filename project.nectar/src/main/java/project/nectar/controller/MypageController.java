package project.nectar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    @GetMapping("/main")
    public String mypage(HttpSession session, HttpServletRequest request){
        if (session.getAttribute("User_email")!=null) {
            return "redirect:/mypage/user";
        }else if(session.getAttribute("Biz_email")!=null){
            return "redirect:/mypage/biz";
        }else if(session.getAttribute("Admin_email")!=null){
            return "redirect:/mypage/admin";
        } // 로그인 안되있니?
        return "redirect:/login/login?toURL=" + request.getRequestURL();
    }

    @GetMapping("/user")
    public String UserMyPage(){
        return "mypage/user";
    }

    @GetMapping("/biz")
    public String BizMyPage(){
        return "mypage/biz";
    }

    @GetMapping("/admin")
    public String AdminMyPage(){
        return "mypage/admin";
    }

}
