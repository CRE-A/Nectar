package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.AdminDto;
import project.nectar.domain.BizAccountDto;
import project.nectar.domain.UserDto;
import project.nectar.repository.UserDao;
import project.nectar.service.UserService;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    UserService userService;

    @GetMapping("/addUser")
    public String registerForm() {return "registerForm";
    }

    @PostMapping("/addUser")

    public String register(UserDto userDto, HttpSession session) throws Exception {

//        // 아이디 중복 체크 하기
//        if (!duplicateCheck(id)) {
//            String msg = URLEncoder.encode("duplicated id", "utf-8");
//
//            return "redirect:/register/add?msg=" + msg;
//        }
//
//        // 비밀번호 등록 재확인 하기 ( pwd.equals(cPwd) )
//        String cPwd = userDto.getUser_pwd();
//        if (!pwd.equals(cPwd)) {
//            String pmsg = URLEncoder.encode("pwd-error", "utf-8");
//
//            return "redirect:/register/add?pmsg=" + pmsg;
//        }

        System.out.println("RegisterController, 방금 여기 지나감");
        System.out.println("userDto = " + userDto);
        userService.RegisterUser(userDto);


        if(session.getAttribute("sns_email")!=null){        // 소셜 로그인 유저의 회원가입이면, 가입 후 자동 로그인
            return "redirect:/login/login";
        }

        return "registerComplete";
    }




//    private boolean duplicateCheck(String id) {
//
//        UserDto user = userDao.select(id);
//
//        return user == null || user.equals("");
//
//    }



    @GetMapping("/addBiz")
    public String registerForm_Biz() {
        return "registerFormBiz";
    }

    @PostMapping("/addBiz")
    public String register_Biz(String id, String pwd, BizAccountDto bizAccountDto, Model m) throws Exception {


        System.out.println("RegisterController, 방금 여기 지나감");
        System.out.println("userDto = " + bizAccountDto);
        userService.RegisterBiz(bizAccountDto);
        return "redirect:/";


    }


//    @PostMapping("/addBiz")
//
//    public String register_Admin(String id, String pwd, AdminDto adminDto, Model m) throws Exception {
//
//
//        System.out.println("RegisterController, 방금 여기 지나감");
////        userDto.setAuthority("ROLE_USER");
////        userDto.setAuthority("ROLE_USER, ROLE_BIZ, ROLE_ADMIN");
//        System.out.println("adminDto = " + adminDto);
//        userService.RegisterAdmin(adminDto);
//        return "redirect:/";
//
//
//    }





}
