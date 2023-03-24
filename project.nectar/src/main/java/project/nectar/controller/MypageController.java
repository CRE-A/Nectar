package project.nectar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {


    @GetMapping("/logincheck")
    public String loginCheck(HttpSession session, HttpServletRequest request){
        if (session.getAttribute("User_email")!=null) {
            return "redirect:/mypage/user/main";                                // UserController 에서 처리
        }else if(session.getAttribute("Biz_email")!=null){
            return "redirect:/mypage/biz/main";                                 // BizController 에서 처리
        }else if(session.getAttribute("Admin_email")!=null){
            return "redirect:/mypage/admin/main";                               // AdminController 에서 처리
        } // 로그인 안되있니?
        return "redirect:/login/login?toURL=" + request.getRequestURL();        // LoginController 에서 처리
    }



}



