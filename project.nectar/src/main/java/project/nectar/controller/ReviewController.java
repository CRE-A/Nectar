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

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    ReviewService reviewService;

    @PostMapping("/write")
    public String write(ReviewDto reviewDto, RestrDto restrDto, RedirectAttributes rattr, Model m){

        try {
            //user_email을 안보내주면
            //String user_email = (String)session.getAttribute('User_id')
            //reviewDto.setUser_email(user_email);
            reviewService.write(reviewDto, restrDto);
            rattr.addFlashAttribute("msg","WRT_OK");
            return "restr";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","WRT_ERR");
            m.addAttribute("ReviewDto",reviewDto);
            return "restr";
        }
    }

    @PostMapping("/delete")
    public String delete(ReviewDto reviewDto, RestrDto restrDto, RedirectAttributes rattr){

        try {
            reviewService.delete(reviewDto,restrDto);
            rattr.addFlashAttribute("msg","DEL_OK");
            return "restr";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
            return "restr";
        }
    }

    @PostMapping("/modify")
    public String modify(ReviewDto reviewDto, RestrDto restrDto, RedirectAttributes rattr){
        try {
            reviewService.modify(reviewDto,restrDto);
            rattr.addFlashAttribute("msg","MOD_OK");
            return "restr";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","MOD_ERR");
            return "restr";
        }
    }

}