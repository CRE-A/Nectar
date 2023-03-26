package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.BizAccountDto;
import project.nectar.domain.UserDto;
import project.nectar.repository.UserDao;
import project.nectar.service.UserService;

import java.net.URLEncoder;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    UserService userService;

    @GetMapping("/addUser")
    public String registerForm() {
        return "registerForm";
    }

    @PostMapping("/addUser")

    public String register(String id, String pwd, UserDto userDto, Model m) throws Exception {

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
//        userDto.setAuthority("ROLE_USER");
//        userDto.setAuthority("ROLE_USER, ROLE_BIZ, ROLE_ADMIN");
        System.out.println("userDto = " + userDto);
        userService.RegisterUser(userDto);



//        // 가입된 아이디가 없다면 가입 진행하기
//        int rowCnt = userDao.insert(userDto);
//        System.out.println("userDto = " + userDto);  // db에는 등록날짜가 저장되어 있는데 registerController 에는 null값이 들어옴 -> 별로 상관 없는 것 같기도함

        // 로그인 페이지로 넘겨주기
        // 혹은 회원가입을 축하하는 jsp, 그리고 로그인 링크 남겨주기. 도 나쁘진 않고
        return "redirect:/";

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
//        userDto.setAuthority("ROLE_USER");
//        userDto.setAuthority("ROLE_USER, ROLE_BIZ, ROLE_ADMIN");
        System.out.println("userDto = " + bizAccountDto);
        userService.RegisterBiz(bizAccountDto);
        return "redirect:/";


    }





}
