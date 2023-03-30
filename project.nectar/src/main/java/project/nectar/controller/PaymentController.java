package project.nectar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.PaymentDto;

@Controller
@RequestMapping("/pay")
public class PaymentController {

//    @GetMapping("/success")
//    public String paymentForm(){
//        return "hotdealPage/payment";
//    }



    @PostMapping("/proceed")
    public String buy(@RequestBody PaymentDto paymentDto){
        System.out.println("paymentDto = " + paymentDto);
        // payment 테이블에 결제 정보를 추가해준다.
        // @seivice 에서 tx로 묶어서

        return "redirect:/pay/success";
    }

    @PostMapping("/cancel")
    public String cancel(){
        // 환불
        return "";
    }


    @GetMapping("/success")
    public String Success(){
        return "paymentSuccess";
    }

    @GetMapping("/fail")
    public String fail(){
        return "paymentFail";
    }

}
