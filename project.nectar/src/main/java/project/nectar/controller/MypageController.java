package project.nectar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

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
