package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.RestrDto;
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
    public String write(ReviewDto reviewDto, RestrDto restrDto, RedirectAttributes rattr) throws UnsupportedEncodingException {
        System.out.println("reviewDto = " + reviewDto);
        System.out.println("restrDto = " + restrDto);
        try {
//            throw new Exception(); // 강제로 오류 발생시켜서 catch 반응 확인
            reviewService.write(reviewDto, restrDto);
//            rattr.addFlashAttribute("msg","WRT_OK");
            return "redirect:/restr/read?restr_NUM="+restrDto.getRestr_NUM();
        } catch (Exception e) {
            e.printStackTrace();
//            rattr.addFlashAttribute("msg","WRT_ERR");
            String comment = URLEncoder.encode(reviewDto.getReview_comment(),"utf-8");
            String queryString = "?restr_NUM="+restrDto.getRestr_NUM()+"&review_comment="+comment
                    +"&review_picture="+reviewDto.getReview_picture()+"&review_star="+reviewDto.getReview_star();
            return "redirect:/restr/read"+queryString;
//            return "redirect:/restr/read?restr_NUM="+restrDto.getRestr_NUM();
//            return "restr"; //에러 발생시 에러전담 페이지로?
        }
    }

    @PostMapping("/delete")
    public String delete(ReviewDto reviewDto, RestrDto restrDto, RedirectAttributes rattr){
//        System.out.println("reviewDto = " + reviewDto);
//        System.out.println("restrDto = " + restrDto);
        try {
            reviewService.delete(reviewDto,restrDto);
            rattr.addFlashAttribute("msg","DEL_OK");
            return "redirect:/restr/read?restr_NUM="+restrDto.getRestr_NUM();
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
            return "restr"; //에러 발생시 에러전담 페이지로?
        }
    }

    @PostMapping("/modify")
    public String modify(ReviewDto reviewDto, RestrDto restrDto, RedirectAttributes rattr, Model m){
//        System.out.println("reviewDto = " + reviewDto);
//        System.out.println("restrDto = " + restrDto);
        try {
            reviewService.modify(reviewDto,restrDto);
            rattr.addFlashAttribute("msg","MOD_OK");
            return "redirect:/restr/read?restr_NUM="+restrDto.getRestr_NUM();
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","MOD_ERR");
            m.addAttribute("reviewDto",reviewDto);
            return "restr"; //에러 발생시 에러전담 페이지로?
        }
    }

}
