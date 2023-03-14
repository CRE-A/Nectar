package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.LikelistDto;
import project.nectar.domain.ReviewDto;
import project.nectar.domain.UserDto;
import project.nectar.repository.LikelistDao;
import project.nectar.repository.ReviewDao;
import project.nectar.repository.UserDao;
import project.nectar.service.HotdealService;
import project.nectar.service.LikelistService;
import project.nectar.service.ReviewService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    @Autowired
    ReviewService reviewService;
    @Autowired
    LikelistService likelistService;
    @Autowired
    HotdealService hotdealService;
    @Autowired
    UserDao userDao;

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

            List<LikelistDto> likelistDto = likelistService.getMyLikeList(User_email);
            m.addAttribute("likelistDto", likelistDto);
            // 사용자(User)가 '좋아요' 눌렀던 모든 like 에 대한 data

//            List<Payment> payment = paymentService.getMyPayments(User_email);
//            m.addAttribute("paymentService",paymentService);
            // 사용자(User)가 구매한 모든 구매내역에 대한 data

            UserDto userDto = userDao.select(User_email);
            m.addAttribute("userDto",userDto);
            // 로그인 했다면, 로그인 계정(유저)에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/user";
    }

    @GetMapping("/biz")
    public String BizMyPage(HttpSession session, Model m){
        String User_email = (String)session.getAttribute("Biz_email");

        try {
            // 곧 채워넣겠습니다.

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/biz";
    }
    // 핫딜 목록, 본인 가게, (핫딜 판매 목록 - payment)

    @GetMapping("/admin")
    public String AdminMyPage(HttpSession session, Model m){
        String User_email = (String)session.getAttribute("Admin_email");

        try {
            //  곧 채워넣겠습니다.

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/admin";
    }

}
