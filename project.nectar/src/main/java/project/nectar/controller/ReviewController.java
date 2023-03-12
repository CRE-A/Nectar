package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.ReviewDto;
import project.nectar.service.ReviewService;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    ReviewService reviewService;

    @PostMapping("/write")
    public String write(ReviewDto reviewDto) throws UnsupportedEncodingException {

        try {
//            throw new Exception(); // 강제로 오류 발생시켜서 catch 반응 확인
            reviewService.write(reviewDto);
            return  "redirect:/restr/read?restr_NUM="+reviewDto.getRestr_NUM();

        } catch (Exception e) {
            e.printStackTrace();
            String comment = URLEncoder.encode(reviewDto.getReview_comment(),"utf-8");
            String queryString = "?restr_NUM="+reviewDto.getRestr_NUM()+"&review_comment="+comment
                    +"&review_picture="+reviewDto.getReview_picture()+"&review_star="+reviewDto.getReview_star();

            return "redirect:/restr/read"+queryString;
        }
    }


    @PostMapping("/delete")
    public String delete(ReviewDto reviewDto){

        try {
//            throw new Exception(); // 강제로 오류 발생시켜서 catch 반응 확인
            reviewService.delete(reviewDto);
            return "redirect:/restr/read?restr_NUM="+reviewDto.getRestr_NUM();

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/restr/read?restr_NUM="+reviewDto.getRestr_NUM();
        }
    }


    @PostMapping("/modify")
    public String modify(ReviewDto reviewDto) throws UnsupportedEncodingException {
        try {
//            throw new Exception(); // 강제로 오류 발생시켜서 catch 반응 확인
            reviewService.modify(reviewDto);
            return  "redirect:/restr/read?restr_NUM="+reviewDto.getRestr_NUM();

        } catch (Exception e) {
            String comment = URLEncoder.encode(reviewDto.getReview_comment(),"utf-8");
            String queryString = "?restr_NUM="+reviewDto.getRestr_NUM()+"&review_comment="+comment
                    +"&review_picture="+reviewDto.getReview_picture()+"&review_star="+reviewDto.getReview_star();
            return "redirect:/restr/read"+queryString;
        }
    }

}
