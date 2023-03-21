package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.LikelistDto;
import project.nectar.service.LikelistService;

@Controller
@RequestMapping("/likelist")
public class LikelistController {
    @Autowired
    LikelistService likelistService;

    @PostMapping("/add")
    public String addLike(LikelistDto likelistDto) {

        try {
            likelistService.addLike(likelistDto);
            return "redirect:/restr/read?restr_NUM=" + likelistDto.getRestr_NUM();

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/restr/read?restr_NUM=" + likelistDto.getRestr_NUM();
        }
    }


    @PostMapping("/cancel")
    public String cancelLike(LikelistDto likelistDto) {

        try {
            likelistService.cancelLike(likelistDto);
            return "redirect:/restr/read?restr_NUM=" + likelistDto.getRestr_NUM();

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/restr/read?restr_NUM=" + likelistDto.getRestr_NUM();
        }
    }

    @PostMapping("/cancelAll")
    public String removeMyLikeList(String user_email){

        try {
            likelistService.removeMyLikeList(user_email);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/mypage/user/main";
    }  // 이건 나중에 /mypage/user 로 위치변경 가능



}
