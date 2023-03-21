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

            List<RestrDto> request_restrDto = request_restrDao.selectAll();
            m.addAttribute("request_restrDto",request_restrDto);
            // 사업자가 등록 요청한 레스토랑에 대한 data

            List<HotdealDto> request_hotdealDto = request_hotdealDao.selectAll();
            m.addAttribute("request_hotdealDto",request_hotdealDto);
            // 사업자가 등록 요청한 핫딜에 대한 data

            List<QNADto> QNADto = qnaDao.selectAll();
            m.addAttribute("QNADto",QNADto);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/admin";
    }


    @GetMapping("/restr/read")
    public String ReadRestr(Integer request_restr_NUM, Model m){

        RestrDto request_restrDto = request_restrDao.select(request_restr_NUM);
        m.addAttribute("request_restrDto",request_restrDto);
        // 사업자가 등록 요청한 레스토랑에 대한 data

        List<RestrMenuDto> request_restrMenuDto = request_restrMenuDao.selectAll(request_restr_NUM);
        m.addAttribute("request_restrMenuDto",request_restrMenuDto);
        // 사업자가 등록 요청한 레스토랑 메뉴에 대한 data

        return "mypage/restrReqForm";
    }


    @PostMapping("/restr/register")
    public String register(RestrDto restrDto, RestrMenuDto restrMenuDto){

        try {
            restrDao.insertAll(restrDto);
            restrMenuDao.insert(restrMenuDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "redirect:/mypage/admin/main"; // + 사업자에게 등록되었다고 메세지 가게 해야지
    }

    @GetMapping("/restr/deny")
    public String RestrDenied(){
        // ???? 아무일도 일어나지 않음.
        //// + 사업자에게 거절 되었다고 메세지 가게 해야지
        return "redirect:/mypage/admin/main";
    }


    @GetMapping("/hotdeal/read")
    public  String ReadHotdeal(Integer request_hotdeal_NUM, Model m) {

        HotdealDto request_hotdealDto = request_hotdealDao.select(request_hotdeal_NUM);
        m.addAttribute("request_hotdealDto",request_hotdealDto);
        // 사업자가 등록 요청한 핫딜 대한 data

        return "mypage/hotdealReqForm";

    }


    @PostMapping("/hotdeal/register")
    public String register(HotdealDto hotdealDto) {

        try {
            hotdealService.insert(hotdealDto); // Service 에서 TX 묶어서 처리해야함
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "redirect:/mypage/admin/main"; // + 사업자에게 등록되었다고 메세지 가게 해야지
    }

    @GetMapping("/hotdeal/deny")
    public String HotdealDenied() {
        // ???? 아무일도 일어나지 않음.
        //// + 사업자에게 거절 되었다고 메세지 가게 해야지
        return "redirect:/mypage/admin/main";
    }

    @GetMapping("/QNA/read")
    public String ReadQNA(Integer qna_NUM, Model m) {

        QNADto qnaDto = qnaDao.select(qna_NUM);
        m.addAttribute("qnaDto",qnaDto);
        // User, BizAccount 가 문의 한 Q&A 에 대한 data

        return "mypage/qnaForm";

    }

    @PostMapping("/profile/delete")
    public String deleteAccount(String user_email){
        userDao.delete(user_email);                 // 계정 삭제. 강퇴
        return "redirect:/mypage/admin/main";
    }




//    @GetMapping("/account/management")
//    public String
//    // 졸려요 나중에 할게요...                        // 계정 페널티 부여.
//
}











//    @PostMapping("/admin/stateCode")
    // post 방식으로 state code 0 -1 -2 로 변경


