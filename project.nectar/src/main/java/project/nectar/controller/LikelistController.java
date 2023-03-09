package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.LikelistDto;
import project.nectar.service.LikelistService;

@Controller
@RequestMapping("/likelist")
public class LikelistController {
    @Autowired
    LikelistService likelistService;

    @PostMapping("/add")
    public String addLike(LikelistDto likelistDto, RedirectAttributes rattr) {

        try {
            likelistService.addLike(likelistDto);
            rattr.addFlashAttribute("msg","ADD_OK");
            return "restr";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","ADD_ERR");
            return "restr"; //에러 발생시 에러전담 페이지로?
        }
    }

    @PostMapping("/cancel")
    public String cancelLike(LikelistDto likelistDto, RedirectAttributes rattr) {
        try {
            likelistService.cancelLike(likelistDto);
            rattr.addFlashAttribute("msg","CANCEL_OK");
            return "restr";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","CANCEL_ERR");
            return "restr"; //에러 발생시 에러전담 페이지로?
        }
    }
}
