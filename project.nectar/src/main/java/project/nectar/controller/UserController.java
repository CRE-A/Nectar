package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.QNADto;
import project.nectar.domain.RestrDto;
import project.nectar.domain.ReviewPlusDto;
import project.nectar.domain.UserDto;
import project.nectar.repository.LikelistDao;
import project.nectar.repository.QNADao;
import project.nectar.repository.UserDao;
import project.nectar.service.ReviewService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage/user")
public class UserController {
    @Autowired
    ReviewService reviewService;
    @Autowired
    LikelistDao likelistDao;
    @Autowired
    UserDao userDao;
    @Autowired
    QNADao qnaDao;


    @GetMapping("/main")
    public String UserMyPage(HttpSession session, Model m, Authentication authentication){
//        String user_email= "";
//        if(isAuthenticated()){       // 로그인이(인증)이 된 경우
//            UserDetails userDetails = (UserDetails)authentication.getPrincipal();
//            user_email = userDetails.getUsername();
//            System.out.println("user_email = " + user_email);
//        }

        System.out.println("============================================================");
        System.out.println("mypage/user/maim 지나감");
            UserDetails userDetails = (UserDetails)authentication.getPrincipal();
            String user_email = userDetails.getUsername();
            System.out.println("user_email = " + user_email);
        System.out.println("============================================================");

        try {
            List<ReviewPlusDto> reviewDto = reviewService.getMyReviews(user_email);
            m.addAttribute("reviewDto",reviewDto);
            // 사용자(User)가 작성한 모든 리뷰에 데한 data

            List<RestrDto> getMyLikeList = likelistDao.selectMyLikeList(user_email);
            m.addAttribute("getMyLikeList",getMyLikeList);
            // 사용자(User)가 like 눌렀던 모든 게시물(레스토랑)에 대한 data

            UserDto userDto = userDao.select(user_email);
            m.addAttribute("userDto",userDto);
            // 사용자(User)에 대한 data


//            List<Payment> payment = paymentService.getMyPayments(User_email);
//            m.addAttribute("paymentService",paymentService);
//             사용자(User)가 구매한 모든 구매내역에(핫딜) 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/user";
    }

    @PostMapping("/profile/modify")
    public String modifyProfile(UserDto userDto){
        userDao.update(userDto);
        return "redirect:/mypage/user/main";
    }

    @PostMapping("/profile/delete")
    public String deleteProfile(String email, HttpSession session){
        userDao.delete(email);  // 계정 삭제
        session.invalidate();   // 세션 종료
        return "redirect:/";
    }


    @PostMapping("/QNA/write")
    public String QNA(QNADto qnaDto, RedirectAttributes rattr, Model m){

        try {
            qnaDao.insert(qnaDto);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_WRT_ERR");
            return "redirect:/mypage/user/main";

        }

        m.addAttribute("qnaDto",qnaDto);
        return "mypage/successPage/qnaWrtOk";
    }


    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }

    @GetMapping("/home")
    public String home(){
        return "redirect:/";
    }


}
