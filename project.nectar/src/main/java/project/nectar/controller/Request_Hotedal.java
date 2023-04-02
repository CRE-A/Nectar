package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.HotdealDto;
import project.nectar.domain.Request_HotdealDto;
import project.nectar.repository.Request_HotdealDao;
import project.nectar.service.HotdealService;

@Controller
@RequestMapping("/mypage")
public class Request_Hotedal {
    @Autowired
    Request_HotdealDao request_hotdealDao;
    @Autowired
    HotdealService hotdealService;


    @PostMapping("/biz/reqHotdeal/write")
    public String request_Hotdeal_registration(Request_HotdealDto request_hotdealDto, RedirectAttributes rattr, Model m){

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

    @GetMapping("/biz/reqHotdeal/retrial")
    public String apply_for_retrial(Integer request_hotdeal_NUM){

        try {
            // 재심 요청 시
            // request_hotdeal 테이블의 (request_hotdeal)의 심사코드(evaluate code)를 심사대기 상태(0) 로 만든다.
            Request_HotdealDto request_hotdealDto = request_hotdealDao.select(request_hotdeal_NUM);
            request_hotdealDto.setEvaluate_code(0);
            request_hotdealDao.updateState(request_hotdealDto);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "mypage/successPage/hotdealWrtOk";
    }



    @GetMapping("/admin/reqHotdeal/read")
    public  String read_reqHotdeal(Integer request_hotdeal_NUM, Model m) {

        Request_HotdealDto request_hotdealDto = request_hotdealDao.select(request_hotdeal_NUM);
        m.addAttribute("request_hotdealDto",request_hotdealDto);
        // 사업자가 등록 요청한 핫딜 대한 data

        return "mypage/hotdealReqForm";

    }


    @PostMapping("/admin/reqHotdeal/register")
    public String register_Permitted(HotdealDto hotdealDto) {

        try {
            hotdealService.insert(hotdealDto);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "redirect:/mypage/admin/main";
    }

    @GetMapping("/admin/reqHotdeal/deny")
    public String register_Denied(Request_HotdealDto request_hotdealDto) {

        try {
            // request_hotdeal 테이블의 (request_hotdeal)의 심사코드(evaluate code)를 반려상태(-1) 로 만든다.
            request_hotdealDto.setEvaluate_code(-1);
            request_hotdealDto.setEvaluate_msg(request_hotdealDto.getEvaluate_msg());
            request_hotdealDao.updateState(request_hotdealDto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/mypage/admin/main";
    }




}
