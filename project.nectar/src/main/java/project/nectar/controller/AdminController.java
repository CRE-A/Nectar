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
import project.nectar.service.RestrService;

import java.util.HashMap;
import java.util.List;
// 이하 MYPAGE 의 ADMIN 에 관한 모든 내용
@Controller
@RequestMapping("/mypage/admin")
public class AdminController {
    @Autowired
    UserDao userDao;
    @Autowired
    BizAccountDao bizAccountDao;
    @Autowired
    Request_RestrDao request_restrDao;
    @Autowired
    Request_HotdealDao request_hotdealDao;
    @Autowired
    QNADao qnaDao;
    @Autowired
    RestrService restrService;
    @Autowired
    RestrMenuDao restrMenuDao;
    @Autowired
    HotdealService hotdealService;
    @Autowired
    QnaCommentDao qnaCommentDao;


    @GetMapping("/main")
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

            List<Request_RestrDto> request_restrDto = request_restrDao.selectAll();
            m.addAttribute("request_restrDto",request_restrDto);
            // 사업자가 등록 요청한 레스토랑에 대한 data

            List<Request_HotdealDto> request_hotdealDto = request_hotdealDao.selectAll();
            m.addAttribute("request_hotdealDto",request_hotdealDto);
            // 사업자가 등록 요청한 핫딜에 대한 data

            List<QNADto> QNADto = qnaDao.selectAll();
            m.addAttribute("QNADto",QNADto);
            // 요청/문의사항을 담은 QNA 에 대한 data


            //ADMIN도 결제 정보에 대한 DATA를 가지고 있어야할 듯

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/admin";
    }



    @PostMapping("/profile/delete")
    public String deleteAccount(String user_email){
        userDao.delete(user_email);                 // 계정 삭제. 강퇴
        return "redirect:/mypage/admin/main";
    }


    // state_code
    //  0 : 사이트 모든 기본 기능 사용 가능(default)
    // -1 : 댓글 금지,
    // -2 : 결제 금지,

    // b_state_code
    // ~

    @PostMapping("/account/Management")
    public String accountManagement(UserDto userDto){
        userDao.updateStateCode(userDto);
        return "redirect:/mypage/admin/main";
    }

//    @PostMapping("/accountManagement/biz")
//    public String accountManagement_Biz(BizAccountDto bizAccountDto) {
//        bizAccountDao.updateStateCode(bizAccountDto);
//        return "redirect:/mypage/admin/main";
//    }
}


//    @PostMapping("/admin/stateCode")
    // post 방식으로 state code 0 -1 -2 로 변경


