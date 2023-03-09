package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.*;
import project.nectar.service.LikelistService;
import project.nectar.service.RestrService;
import project.nectar.service.ReviewService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
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

    @GetMapping("/list")
    public String list(Model m, SearchCondition sc, HttpSession session) {
        loginCheck(session, m);
        // loginCheck()로 관리자계정(Admin)임을 확인하면, 모델에 (AccessCode,Admin)을 담아 보낸다.
        // restrList.jsp에서 관리자계정(Admin)만 보고 누를 수 있는 버튼(수정,삭제)이 표시되도록
        try {

            int totalCnt = restrService.SearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(sc,totalCnt);
            m.addAttribute("ph", pageHandler);

            List<RestrDto> list = restrService.SearchResultPage(sc);
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }
        return "restrList";
    }

    private void loginCheck(HttpSession session, Model m) {
        String loginEmail = session.getAttribute("Admin_email") != null ? "Admin" : (session.getAttribute("User_email") != null ? "User" : "");
        if(loginEmail.equals("")){return;}               //로그인이 안되있으면, 지나가
        SetAccessCode(m, loginEmail);                    //로그인 되어있으면, Model에 AccessCode 추가해서 넘겨줘.
    }

    private void SetAccessCode(Model m, String loginEmail) {
       m.addAttribute("AccessCode",loginEmail);
    }



    @GetMapping("/read")
    public String read(Integer restr_NUM, SearchCondition sc, Model m, RedirectAttributes rattr, HttpSession session){
        loginCheck(session, m);

        try {
            RestrDto restrDto = restrService.read(restr_NUM);
            m.addAttribute("restrDto", restrDto);
            // 레스토랑에 대한 모든 정보

            List<ReviewDto> reviewDto = reviewService.selectAll(restr_NUM);
            m.addAttribute("reviewDto", reviewDto);
            // 리뷰에 대한 모든 정보

            LikelistDto likelistDto = likelistService.select(restr_NUM);
            m.addAttribute("likelistDto",likelistDto);
            // 유저가 로그인 해서 게시물 들어갔을 때, 좋아요 누른 게시물인지 확인용
            //${not empty likelistDto.restr_NUM ? "checked" : ""} 값이 존재하면 하트(체크박스)에 체크되서 빨간색 불 들어옴

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","READ_ERR");
            return "redirect:/restr/list"+sc.getQueryString();
        }
        return "restr";
    }




    // 아래부터는 (관리자)admin 계정만 접근 가능한 Delete, Write, Modify


    @PostMapping("/delete")
    public String delete(Integer restr_NUM, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr){
        try {
//            Mapper Dao Service 의 restrDto -> restr_NUM 으로 수정해주세요
            System.out.println("restr_NUM = " + restr_NUM);
            int rowCnt = restrService.delete(restr_NUM);
            System.out.println("DEL_rowCnt = " + rowCnt);
            if(rowCnt!=1){
                throw new Exception("delete failed");
            }
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);
            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
            return "redirect:/restr/list";
        }

        return "redirect:/restr/list";
    }
//    @GetMapping("/write")
//    public String write(Model m){
//        m.addAttribute("mode","new");
//        return "board";
//    }
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
//

}