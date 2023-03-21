package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.UserDto;
import project.nectar.repository.UserDao;

import java.net.URLEncoder;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    UserDao userDao;

    @GetMapping("/add")
    public String registerForm() {
        return "registerForm";
    }

    @PostMapping("/add")

    public String register(String id, String pwd, UserDto userDto, Model m) throws Exception {

        // 아이디 중복 체크 하기
        if (!duplicateCheck(id)) {
            String msg = URLEncoder.encode("duplicated id", "utf-8");

            return "redirect:/register/add?msg=" + msg;
        }

        // 비밀번호 등록 재확인 하기 ( pwd.equals(cPwd) )
        String cPwd = userDto.getUser_pwd();
        if (!pwd.equals(cPwd)) {
            String pmsg = URLEncoder.encode("pwd-error", "utf-8");

            return "redirect:/register/add?pmsg=" + pmsg;
        }

        // 가입된 아이디가 없다면 가입 진행하기
        int rowCnt = userDao.insert(userDto);
        System.out.println("userDto = " + userDto);  // db에는 등록날짜가 저장되어 있는데 registerController 에는 null값이 들어옴 -> 별로 상관 없는 것 같기도함

        // 로그인 페이지로 넘겨주기
        return "redirect:/login/login";

    }

    private boolean duplicateCheck(String id) {

        UserDto user = userDao.select(id);

        return user == null || user.equals("");

    }



///////////////////////////////////////////////////////////////////





}
