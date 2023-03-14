package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.*;
import project.nectar.repository.RestrMenuDao;
import project.nectar.repository.UserDao;
import project.nectar.service.LikelistService;
import project.nectar.service.RestrService;
import project.nectar.service.ReviewService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/restr")
public class RestrController {
    @Autowired
    RestrService restrService;
    @Autowired
    ReviewService reviewService;
    @Autowired
    LikelistService likelistService;
    @Autowired
    UserDao userDao;
    @Autowired
    RestrMenuDao restrMenuDao;

    @GetMapping("/list")
    public String list(Model m, SearchCondition sc) {

        try {
            int totalCnt = restrService.SearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(sc,totalCnt);
            m.addAttribute("ph", pageHandler);
            // 페이징에 대한 data

            List<RestrDto> restrDto = restrService.SearchResultPage(sc);
            m.addAttribute("restrDto", restrDto);
            // 검색 조건에 부합하는 레스토랑 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage/searchERR";
//          SQL ERROR. 입력값이 없으면 가져오질 못함.
//          나중에 에러 컨트롤러 만들 예정
        }

        return "restrList";
    }


    @GetMapping("/read")
    public String read(LikelistDto likeDto, Integer restr_NUM, SearchCondition sc, Model m, HttpSession session){
        String User_email = (String)session.getAttribute("User_email");
        likeDto.setUser_email(User_email);

        try {
            RestrDto restrDto = restrService.read(restr_NUM);
            m.addAttribute("restrDto", restrDto);
            // 레스토랑에 대한 data

            List<RestrMenuDto> restrMenuDto = restrMenuDao.selectAllMenu(restr_NUM);
            m.addAttribute("restrMenuDto",restrMenuDto);
            // 레스토랑 메뉴에 대한 data

            List<ReviewDto> reviewDto = reviewService.selectAll(restr_NUM);
            m.addAttribute("reviewDto", reviewDto);
            // 리뷰에 대한 data

            LikelistDto likelistDto = likelistService.select(likeDto);
            m.addAttribute("likelistDto",likelistDto);
            // 로그인 했다면, 로그인 계정(유저)가 누른 좋아요에 대한 data
            
            UserDto userDto = userDao.select(User_email);
            m.addAttribute("userDto",userDto);
            // 로그인 했다면, 로그인 계정(유저)에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/restr/list"+sc.getQueryString();
        }

        return "restr";
    }



    // 아래부터는 (관리자)admin 계정만 접근 가능한 Delete, Write, Modify

    @PostMapping("/delete")
    public String delete(Integer restr_NUM, RedirectAttributes rattr, SearchCondition sc){
        try {
            restrService.delete(restr_NUM);
//            throw new Exception("delete failed");

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR"); //
            return "redirect:/";
        }

        return "redirect:/restr/list"+sc.getQueryString();
    }



    //

//    @PostMapping("/write")
//    public String write(BoardDto boardDto, HttpSession session, RedirectAttributes rattr, Model m){
//
//        try {
//            String writer = (String) session.getAttribute("id");
//            boardDto.setWriter(writer);
//            boardService.insert(boardDto);
//            rattr.addFlashAttribute("msg","WRT_OK");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            rattr.addFlashAttribute("msg","WRT_ERR");
//            m.addAttribute("BoardDto", boardDto);
////            return "redirect:/board/read";
//            return "board";
//        }
//
//        return "redirect:/board/list";
////        return "boardList_JH";
//    }
//
//    @PostMapping("/modify")
//    public String modify(Integer page, Integer pageSize, BoardDto boardDto, RedirectAttributes rattr,Model m, HttpSession session){
//
//        try {
//            String writer = (String)session.getAttribute("id");
//            boardDto.setWriter(writer);
//            int rowCnt=boardService.update(boardDto);
//            System.out.println("rowCnt = " + rowCnt);
//            rattr.addFlashAttribute("msg","MOD_OK");
//            m.addAttribute("page",page);
//            m.addAttribute("pageSize",pageSize);
//
//            if(rowCnt!=1){
//                throw new Exception("modify failed");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            rattr.addFlashAttribute("msg","MOD_ERR");
//            m.addAttribute("BoardDto", boardDto);
//            return "board";
//        }
//        System.out.println("boardDto = " + boardDto);
//        System.out.println("ALL GOOD ");
//        return "redirect:/board/list";
//    }




}