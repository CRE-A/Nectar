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
    Request_RestrMenuDao request_restrMenuDao;
    @Autowired
    Request_HotdealDao request_hotdealDao;
    @Autowired
    QNADao qnaDao;
    @Autowired
    RestrDao restrDao;
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


    @GetMapping("/reqRestr/read")
    public String ReadRestr(Integer request_restr_NUM, Model m){

        System.out.println("request_restr_NUM = " + request_restr_NUM);


        Request_RestrDto request_restrDto = request_restrDao.select(request_restr_NUM);
        m.addAttribute("request_restrDto",request_restrDto);
        // 사업자가 등록 요청한 레스토랑에 대한 data

//        List<RestrMenuDto> request_restrMenuDto = request_restrMenuDao.selectAll(request_restr_NUM);
//        m.addAttribute("request_restrMenuDto",request_restrMenuDto);
        // 사업자가 등록 요청한 레스토랑 메뉴에 대한 data

        return "mypage/restrReqForm";
    }


    @PostMapping("/reqRestr/register")
    public String register(Integer request_restr_NUM, RestrDto restrDto, RestrMenuDto restrMenuDto){

        try {
            restrDao.insertAll(restrDto);
            request_restrDao.delete(request_restr_NUM);

//            restrMenuDao.insert(restrMenuDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "redirect:/mypage/admin/main"; // + 사업자에게 등록되었다고 메세지 가게 해야지
    }

    @GetMapping("/reqRestr/deny")
    public String RestrDenied(){
        // ???? 아무일도 일어나지 않음.
        //// + 사업자에게 거절 되었다고 메세지 가게 해야지
        return "redirect:/mypage/admin/main";
    }


    @GetMapping("/reqHotdeal/read")
    public  String ReadHotdeal(Integer request_hotdeal_NUM, Model m) {

        Request_HotdealDto request_hotdealDto = request_hotdealDao.select(request_hotdeal_NUM);
        m.addAttribute("request_hotdealDto",request_hotdealDto);
        // 사업자가 등록 요청한 핫딜 대한 data

        return "mypage/hotdealReqForm";

    }


    @PostMapping("/reqHotdeal/register")
    public String register(HotdealDto hotdealDto) {

        try {
            hotdealService.insert(hotdealDto); // Service 에서 TX 묶어서 처리해야함
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "redirect:/mypage/admin/main"; // + 사업자에게 등록되었다고 메세지 가게 해야지
    }

    @GetMapping("/reqHotdeal/deny")
    public String HotdealDenied() {
        // ???? 아무일도 일어나지 않음.
        //// + 사업자에게 거절 되었다고 메세지 가게 해야지
        return "redirect:/mypage/admin/main";
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


