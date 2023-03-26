package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.*;
import project.nectar.repository.*;
import project.nectar.service.HotdealService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage/biz")
public class BizController {
    @Autowired
    RestrDao restrDao;
    @Autowired
    HotdealService hotdealService;
    @Autowired
    BizAccountDao bizAccountDao;
    @Autowired
    QNADao qnaDao;
    @Autowired
    Request_RestrDao request_restrDao;
    @Autowired
    Request_RestrMenuDao request_restrMenuDao;
    @Autowired
    Request_HotdealDao request_hotdealDao;
    @Autowired
    RestrMenuDao restrMenuDao;


    @GetMapping("/main")
    public String BizMyPage(Model m, Authentication authentication){
            UserDetails userDetails = (UserDetails)authentication.getPrincipal();
            String Biz_email = userDetails.getUsername();
            System.out.println("Biz_email = " + Biz_email);

        try {
            RestrDto restrDto = restrDao.selectByBiz_email(Biz_email);
            m.addAttribute("restrDto",restrDto);
            // 사업자(BizAccount)가 운영중인 레스토랑에 대한 data

            List<HotdealDto> hotdealDto = hotdealService.selectMyHotdeals(Biz_email);
            m.addAttribute("hotdealDto",hotdealDto);
            // 사업자가 진행한 모든 핫딜에 대한 data

//            List<RestrMenuDto> restrMenuDto = restrMenuDao.selectAllMenu(restrDto.getRestr_NUM());
//            m.addAttribute("restrMenuDto",restrMenuDto);
//            // 사업자가 운영중인 레스토랑 메뉴에 대한 data

            BizAccountDto bizAccountDto = bizAccountDao.select(Biz_email);
            m.addAttribute("bizAccountDto",bizAccountDto);
            // 사업자에 대한 data

//            List<Payment> paymentDto = paymentService.getMyPayments(User_email);
//            m.addAttribute("paymentDto",paymentDto);
            // 사업자가 진행한 핫딜의 결제정보(payment)에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "mypage/biz";
    }


    @PostMapping("/profile/modify")
    public String modifyProfile(BizAccountDto bizAccountDto){
        bizAccountDao.update(bizAccountDto);
        return "redirect:/mypage/biz/main";
    }

    @PostMapping("/profile/delete")
    public String deleteProfile(String email, HttpSession session){
        bizAccountDao.delete(email);  // 계정 삭제
        session.invalidate();         // 세션 종료
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


    @PostMapping("/restr/write")
    public String registerRestaurant(Request_RestrDto request_restrDto, RedirectAttributes rattr, Model m){

        try {
            request_restrDao.insertAll(request_restrDto);           // 레스토랑 정보 작성 후 (관리자에게) 심사요청
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "RESTR_WRT_ERR");
            return "redirect:/mypage/biz/main";              // 에러처리 해야지?
        }

        m.addAttribute("restrDto",request_restrDto);
        return "mypage/successPage/restrWrtOk";
    }

    @PostMapping("/hotdeal/write")
    public String registerHotdeal(Request_HotdealDto request_hotdealDto, RedirectAttributes rattr, Model m){


        try {
            request_hotdealDao.insert(request_hotdealDto);          // 핫딜 정보 작성 후 (관리자에게) 심사요청
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "Hotdeal_WRT_ERR");
            return "redirect:/mypage/biz/main";
        }

        m.addAttribute("request_hotdealDto",request_hotdealDto);
        return "mypage/successPage/hotdealWrtOk";
    }


}
