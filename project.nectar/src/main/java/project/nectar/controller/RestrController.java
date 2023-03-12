package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.*;
import project.nectar.repository.UserDao;
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
    @Autowired
    UserDao userDao;

    @GetMapping("/list")
    public String list(Model m, SearchCondition sc) {

        try {
            int totalCnt = restrService.SearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(sc,totalCnt);
            m.addAttribute("ph", pageHandler);

            List<RestrDto> list = restrService.SearchResultPage(sc);
            m.addAttribute("list", list);

            //m.addAtrrivute("hotdealDto",hotdealDto); // 핫딜 이벤트 진행여부
        } catch (Exception e) {
            e.printStackTrace();
            return "searchERR";
//          SQL ERROR. 입력값이 없으면 가져오질 못함.
//          나중에 에러 컨트롤러 만들 예정
        }
        return "restrList";
    }



    @GetMapping("/read")
    public String read(LikelistDto likeDto, Integer restr_NUM, SearchCondition sc, Model m, HttpSession session){
            likeDto.setUser_email((String) session.getAttribute("User_email"));

        try {
            RestrDto restrDto = restrService.read(restr_NUM);
            m.addAttribute("restrDto", restrDto);
            // 레스토랑에 대한 모든 data

            List<ReviewDto> reviewDto = reviewService.selectAll(restr_NUM);
            m.addAttribute("reviewDto", reviewDto);
            // 리뷰에 대한 모든 data

            UserDto userDto = userDao.select((String) session.getAttribute("User_email"));
            m.addAttribute("UserDto",userDto);
            // 로그인 했다면, 로그인 계정(유저)에 대한 data

            LikelistDto likelistDto = likelistService.select(likeDto);
            m.addAttribute("likelistDto",likelistDto);
            // 로그인 했다면, 로그인 계정(유저)가 누른 좋아요에 대한 data



            //m.addAtrrivute("restrMenu",restrMenuDto); // 메뉴
            //m.addAtrrivute("hotdealDto",hotdealDto); // 핫딜 이벤트 진행여부


        } catch (Exception e) {
            e.printStackTrace();
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




//    AccessCode 같은게 필요가 없음. 언제 어디서든 loginEmail을 알 수 있음.
//    즉, User_email != null 이면 (User로 로그인 되어 있으면) . . . 이런식으로 그냥 해당 페이지에서 바로 진행 해
//    귀찮게 엑세스코드 만들고 모델에 담아 보내고. 이딴거 번거롭게 만들지 말고.

//    private void loginCheck(HttpSession session, Model m) {
//        String loginEmail = session.getAttribute("Admin_email") != null ? "Admin" : (session.getAttribute("User_email") != null ? "User" : "");
//        if(loginEmail.equals("")){return;}               //로그인이 안되있으면, 지나가
//        SetAccessCode(m, loginEmail);                    //로그인 되어있으면, Model에 AccessCode 추가해서 넘겨줘.
//    }                                                    // (AccessCode, Admin) 또는 (AccessCode, User)
//
//    private void SetAccessCode(Model m, String loginEmail) {
//       m.addAttribute("AccessCode",loginEmail);
//    }


}