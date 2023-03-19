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
import java.util.HashMap;
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
    @Autowired
    RestrDao restrDao;


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
            // 사용자(User)가 구매한 모든 구매내역에(핫딜) 대한 data


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
            List<RestrDto> restrDto = restrDao.selectByBiz_email(Biz_email);
            m.addAttribute("restrDto",restrDto);
            // 사업자(BizAccount)가 운영중인 모든 레스토랑에 대한 data

            List<HotdealDto> hotdealDto = hotdealService.selectMyHotdeals(Biz_email);
            m.addAttribute("hotdealDto",hotdealDto);
            // 사업자(BizAccount)가 진행한 모든 핫딜에 대한 data

            BizAccountDto bizAccountDto = bizAccountDao.select(Biz_email);
            m.addAttribute("bizAccountDto",bizAccountDto);
            // 사업자(BizAccount)에 대한 data

//            List<Payment> payment = paymentService.getMyPayments(User_email);
//            m.addAttribute("paymentService",paymentService);
            // 사업자(BizAccount)가 판매한 핫딜의 모든 거래내역(payment)에 대한 data


            //BIZ 는 특정 양식(폼)에 레스토랑을 작성해서 올리면, 관리자가 '심사' 후 등록 또는 반려한다.



        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/biz";
    }


    @GetMapping("/admin")
    public String AdminMyPage(Model m, String option, String keyword){
        HashMap map = new HashMap();
        map.put("option",option);
        map.put("keyword",keyword);

        try {
            List<UserDto> SearchResultUserList = userDao.SearchResultUser(map);
            m.addAttribute("SearchResultUserList",SearchResultUserList);
            // 사용자(User)에 대한 data

            List<BizAccountDto> SearchResultBizAccountList = bizAccountDao.SearchResultBizAccount(map);
            m.addAttribute("SearchResultBizAccountList",SearchResultBizAccountList);
            // 사업자(bizAccountDao)에 대한 data



            // 사업자가 등록한 레스토랑 심사.(폼을 읽는것)


        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/admin";
    }


//    @PostMapping("/admin/account")
//    public String ManageAccount(Model m, String option, String keyword){
//        HashMap map = new HashMap();
//        map.put("option",option);
//        try {
//            List<UserDto> SearchResultUserList = userDao.SearchResultUser(map);
//            m.addAttribute("SearchResultUserList",SearchResultUserList);
//            // 사용자(User)에 대한 data

//            List<BizAccountDto> SearchResultBizAccountList = bizAccountDao.SearchResultBizAccount(map);
//            m.addAttribute("SearchResultBizAccountList",SearchResultBizAccountList);
//            // 사업자(bizAccountDao)에 대한 data



            // 사업자가 등록한 레스토랑 심사.(폼을 읽는것)

//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "redirect:/";
//        }
//
//        return "mypage/admin";
//    }
//



//    @PostMapping("/admin/stateCode")
    // post 방식으로 state code 0 -1 -2 로 변경

}
