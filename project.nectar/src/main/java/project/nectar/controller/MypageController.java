package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.*;
import project.nectar.repository.*;
import project.nectar.service.HotdealService;
import project.nectar.service.LikelistService;
import project.nectar.service.ReviewService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    @Autowired
    ReviewService reviewService;
    @Autowired
    LikelistService likelistService;
    @Autowired
    LikelistDao likelistDao;
    @Autowired
    HotdealService hotdealService;
    @Autowired
    UserDao userDao;
    @Autowired
    BizAccountDao bizAccountDao;


//    @Autowired
//    Payment payment;

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
    public String UserMyPage(HttpSession session, Model m){
        String User_email = (String)session.getAttribute("User_email");

        try {
            List<ReviewDto> reviewDto = reviewService.getMyReviews(User_email);
            m.addAttribute("reviewDto",reviewDto);
            // 사용자(User)가 작성한 모든 리뷰에 데한 data

            List<RestrDto> getMyLikeList = likelistDao.selectMyLikeList(User_email);
            m.addAttribute("getMyLikeList",getMyLikeList);
            // 사용자(User)가 like 눌렀던 모든 게시물(레스토랑)에 대한 data

            UserDto userDto = userDao.select(User_email);
            m.addAttribute("userDto",userDto);
            // 사용자(User)에 대한 data


//            List<Payment> payment = paymentService.getMyPayments(User_email);
//            m.addAttribute("paymentService",paymentService);
            // 사용자(User)가 구매한 모든 구매내역에 대한 data


        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/user";
    }


    @GetMapping("/biz")
    public String BizMyPage(HttpSession session, Model m){
        String Biz_email = (String)session.getAttribute("Biz_email");

        try {
            List<HotdealDto> hotdealDto = hotdealService.selectMyHotdeals(Biz_email);
            m.addAttribute("hotdealDto",hotdealDto);
            // 사업자(BizAccount)가 진행한 모든 핫딜에 대한 data

            BizAccountDto bizAccountDto = bizAccountDao.select(Biz_email);
            m.addAttribute("bizAccountDto",bizAccountDto);
            // 사업자(BizAccount)에 대한 data

//            List<Payment> payment = paymentService.getMyPayments(User_email);
//            m.addAttribute("paymentService",paymentService);
            // 사업자(BizAccount)가 판매한 핫딜의 모든 거래내역(payment)에 대한 data


            // ...

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/biz";
    }
    // 핫딜 목록, 본인 가게, (핫딜 판매 목록 - payment)


    @GetMapping("/admin")
    public String AdminMyPage(HttpSession session, Model m){

        try {

            UserDto userDto = userDao.select((String)session.getAttribute("User_email"));
            m.addAttribute("userDto",userDto);
            // 사용자(User)에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/admin";
    }

//    @PostMapping("/admin/stateCode")

}
