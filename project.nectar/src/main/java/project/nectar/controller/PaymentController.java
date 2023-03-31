package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.nectar.domain.PaymentDto;
import project.nectar.service.PaymentService;

@Controller
@RequestMapping("/pay")
public class PaymentController {
    @Autowired
    PaymentService paymentService;



    @PostMapping("/process")
//    @ResponseBody
    public String pay(@RequestBody PaymentDto paymentDto, Model m) {


        try {
            paymentService.insert(paymentDto);
            m.addAttribute("paymentDto",paymentDto);

        } catch (Exception e) {
            e.printStackTrace();
            return "paymentFail";
        }

        return "paymentComplete";
    }




    @PostMapping("/cancel")
//    @ResponseBody
    public String cancel(@RequestBody PaymentDto paymentDto, Model m) {

        try {
            paymentService.delete(paymentDto);
            m.addAttribute("paymentDto",paymentDto);

        } catch (Exception e) {
            e.printStackTrace();
            return "refundFail";
        }

        return "refundComplete";
    }









//
//    @RequestMapping(value = "/insertPayCoupon.do")
//    @ResponseBody
//    public int pay(@RequestBody PaymentDto paymentDto) {
////        System.out.println("pvo.getMerchant_uid : " + pvo.getMerchant_uid());
//        System.out.println("여기까진옴");
//        int res = 1;
//        if (res == 1) {
////            Biz_memberVO bvo = memberSV.selectBizMember(pvo.getBiz_email());
////            bvo.setPay_coupon(bvo.getPay_coupon() + 5);
////            System.out.println("paycoupon: " + bvo.getPay_coupon());
////            res = paySV.updateBiz_pay(bvo);
//            res=1;
//            System.out.println("이상해");
//            if (res == 1)
//                System.out.println("biz_member pay coupon insert complete");
//        }
//
//        return res;
//    }














//
//
//    @ResponseBody
//    @PostMapping("/process")
//    public int pay(@RequestBody PaymentDto paymentDto) {
////        System.out.println("pvo.getMerchant_uid : " + pvo.getMerchant_uid());
//        System.out.println("paymentDto : " + paymentDto);
//        System.out.println(" 여기까지옴" );
////        int res = paySV.insert_pay(pvo);
//        int res = 1;
////        if(res == 1) {
////            Biz_memberVO bvo = memberSV.selectBizMember(pvo.getBiz_email());
////            bvo.setPay_coupon(bvo.getPay_coupon()+5);
////            System.out.println("paycoupon: " + bvo.getPay_coupon());
////            res = paySV.updateBiz_pay(bvo);
////            if(res == 1)
////                System.out.println("biz_member pay coupon insert complete");
////        }
//
//        return res;
//    }









//
//
//    @GetMapping("/process")
//    public String buy_RedirectURL(){
////        imp_uid = extract_GET_value_from_url('imp_uid') //GET query string으로부터 imp_uid확인
//////merchant_uid = extract_GET_value_from_url('merchant_uid') //또는, GET query string으로부터 merchant_uid확인
////
////        payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
////        amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid) //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리
////
////        IF payment_result.status == 'paid' AND payment_result.amount == amount_to_be_paid
////        success_post_process(payment_result) //결제까지 성공적으로 완료
////        ELSE IF payment_result.status == 'ready' AND payment.pay_method == 'vbank'
////        vbank_number_assigned(payment_result) //가상계좌 발급성공
////        ELSE
////        fail_post_process(payment_result) //결제실패 처리
//        // payment 테이블에 결제 정보를 추가해준다.
//        // @seivice 에서 tx로 묶어서
//
//        return "redirect:/pay/success";
//    }
//
//    @PostMapping("/process")
//    @ResponseBody
//    public String buy_Ajax(@RequestBody PaymentDto paymentDto){
//        System.out.println("paymentDto = " + paymentDto);
//        System.out.println("paymentDto.getMerchant_uid() = " + paymentDto.getMerchant_uid());
//        System.out.println("여기까지옴 = " );
//        // payment 테이블에 결제 정보를 추가해준다.
//        // @seivice 에서 tx로 묶어서
//
//        return "redirect:/pay/success";
//    }
//
//    @PostMapping("/cancel")
//    public String cancel(){
//        // 환불
//        return "";
//    }


    @GetMapping("/success")
    public String Success(){
        return "paymentSuccess";
    }

    @GetMapping("/fail")
    public String fail(){
        return "paymentFail";
    }

}
