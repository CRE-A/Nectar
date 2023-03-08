//package project.nectar.controller;
//
//import project.nectar.domain.BoardDto;
//import project.nectar.domain.PageHandler;
//import project.nectar.service.BoardServiceImpl;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.util.HashMap;
//import java.util.List;
//
//@Controller
//@RequestMapping("/board")
//public class BoardController {
//    @Autowired
//    BoardServiceImpl boardService;
//    @GetMapping("/list")
//    public String list(HttpServletRequest request, HttpSession session, Model m,@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize) {
//
//        if (!loginCheck(session)) {
//            return "redirect:/login/login?toURL=" + request.getRequestURL();
//        }
//
////      1. pagehandler 객체 생성,   2. boardService.selectPage(bno)
//        try {
//            Integer totalCnt = boardService.count();
//            PageHandler pageHandler = new PageHandler(page, pageSize, totalCnt);
//
//            HashMap map = new HashMap();
//            map.put("offset", (page-1)*pageSize);
//            map.put("pageSize", pageSize);
//            List<BoardDto> selectPage = boardService.selectPage(map);
//
//            m.addAttribute("ph",pageHandler);
//            m.addAttribute("page",page);
//            m.addAttribute("pageSize",pageSize);
//            m.addAttribute("selectPage",selectPage);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "boardList";
//    }
//
//
//    private boolean loginCheck(HttpSession session){
//        return session.getAttribute("id")!=null;
//    }
//
//
//    @GetMapping("/read")
//    public String read(Integer bno, Integer page, Integer pageSize, Model m){
//
//        try {
//            BoardDto boardDto = boardService.select(bno);
//            m.addAttribute("page", page);
//            m.addAttribute("pageSize", pageSize);
//            m.addAttribute("dto", boardDto);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "board";
//    }
//
//    @PostMapping("/delete")
//    public String delete(Integer bno, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr){
//        try {
//            String writer = (String) session.getAttribute("id");
//            System.out.println("writer = " + writer);
//            HashMap map = new HashMap();
//            map.put("bno",bno);
//            map.put("writer",writer);
//
//            int rowCnt = boardService.delete(map);
//            System.out.println("DEL_rowCnt = " + rowCnt);
//            if(rowCnt!=1){
//                throw new Exception("delete failed");
//            }
//
//            m.addAttribute("page",page);
//            m.addAttribute("pageSize",pageSize);
//            rattr.addFlashAttribute("msg","DEL_OK");
//        } catch (Exception e) {
//            e.printStackTrace();
//            rattr.addFlashAttribute("msg","DEL_ERR");
//            return "board";
//        }
//
//        return "redirect:/board/list";
//    }
//
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
//            return "redirect:/board/list";
//    }
//
//
//
//}
//
//
//
