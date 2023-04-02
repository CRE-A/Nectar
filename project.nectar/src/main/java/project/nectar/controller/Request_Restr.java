package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.Request_RestrDto;
import project.nectar.domain.RestrDto;
import project.nectar.repository.Request_RestrDao;
import project.nectar.service.RestrService;

@Controller
@RequestMapping("/mypage")
public class Request_Restr {
    @Autowired
    Request_RestrDao request_restrDao;
    @Autowired
    RestrService restrService;


    @PostMapping("/biz/reqRestr/write")
    public String request_Restaurant_registration(Request_RestrDto request_restrDto, RedirectAttributes rattr, Model m){

        try {
            request_restrDao.insertAll(request_restrDto);           // 레스토랑 정보 작성 후 (관리자에게) 심사요청
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "RESTR_WRT_ERR");
            return "redirect:/mypage/biz/main";
        }

        m.addAttribute("restrDto",request_restrDto);
        return "mypage/successPage/restrWrtOk";
    }


    @GetMapping("/admin/reqRestr/read")
    public String read_reqRestr(Integer request_restr_NUM, Model m){

        Request_RestrDto request_restrDto = request_restrDao.select(request_restr_NUM);
        m.addAttribute("request_restrDto",request_restrDto);
        // 사업자가 등록 요청한 레스토랑에 대한 data

        return "mypage/restrReqForm";
    }


    @PostMapping("/admin/reqRestr/register")
    public String register_Permitted(RestrDto restrDto){

        try {
            restrService.insertAll(restrDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }

        return "redirect:/mypage/admin/main";
    }


    @GetMapping("/admin/reqRestr/deny")
    public String register_Denied(Request_RestrDto request_restrDto){

        try {
            // request_restr 테이블의 (request_restr)의 심사코드(evaluate code)를 반려상태(-1) 로 만든다.
            request_restrDto.setEvaluate_code(-1);
            request_restrDto.setEvaluate_msg(request_restrDto.getEvaluate_msg());
            request_restrDao.updateState(request_restrDto);

        } catch (Exception e) {
            e.printStackTrace();

        }

        return "redirect:/mypage/admin/main";
    }



}
