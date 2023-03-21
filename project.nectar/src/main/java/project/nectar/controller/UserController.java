package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
import project.nectar.service.LikelistService;
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
    public String UserMyPage(HttpSession session, Model m){
        String User_email = (String)session.getAttribute("User_email");

        try {
            List<ReviewPlusDto> reviewDto = reviewService.getMyReviews(User_email);
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
            return "redirect:/mypage/biz/main";

        }

        m.addAttribute("qnaDto",qnaDto);
        return "mypage/successPage/qnaWrtOk";
    }


}
