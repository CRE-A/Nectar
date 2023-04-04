package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.nectar.domain.BizAccountDetailsDto;
import project.nectar.domain.BizAccountDto;
import project.nectar.domain.QNADto;
import project.nectar.domain.UserDto;
import project.nectar.repository.BizAccountDao;
import project.nectar.repository.QNADao;
import project.nectar.repository.QnaCommentDao;
import project.nectar.repository.UserDao;

import java.util.List;

@Controller
@RequestMapping("/mypage")
public class QNAController {
    @Autowired
    QNADao qnaDao;
    @Autowired
    QnaCommentDao qnaCommentDao;

    @Autowired
    BizAccountDao bizAccountDao;

    @Autowired
    UserDao userDao;

    @GetMapping("/user/QNA/write")
    public String writeQNA_user(Model m,Authentication authentication){

        UserDetails userDetails = (UserDetails)authentication.getPrincipal();
        String user_email = userDetails.getUsername();

        try {
            UserDto userDto = userDao.select(user_email);
            m.addAttribute("userDto",userDto);
            m.addAttribute("mode", "new");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return  "mypage/qnaForm";
    }

    @PostMapping("/user/QNA/write")
    public String writeQNA_user(QNADto qnaDto, RedirectAttributes rattr, Model m){

        try {
            qnaDao.insert(qnaDto);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_WRT_ERR");
            return "redirect:/mypage/user/main";
        }

        m.addAttribute("qnaDto",qnaDto);
        return "mypage/successPage/qnaWrtOk";
    }


    @GetMapping("/user/QNA/read")
    public String ReadQNA_user(Integer qna_NUM, Model m, Authentication auth, RedirectAttributes rattr) {

        try {
            QNADto qnaDto = qnaDao.selectByWriter(qna_NUM, getWriter(auth));
            m.addAttribute("qnaDto",qnaDto);
            // User 가 문의 한 Q&A 에 대한 data

            List<QNADto> qnaCommentDto = qnaCommentDao.selectAll(qna_NUM);
            m.addAttribute("qnaCommentDto",qnaCommentDto);
            // Admin 이 답변을 단 Q&A comment 에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_READ_ERR");
            return "redirect:/mypage/user/main";
        }
        return "mypage/qnaForm";
    }


    @GetMapping("/biz/QNA/write")
    public String writeQNA_biz(Model m, Authentication authentication){
        UserDetails userDetails = (UserDetails)authentication.getPrincipal();
        String Biz_email = userDetails.getUsername();

        try {
            BizAccountDto bizAccountDto = bizAccountDao.select(Biz_email);
            m.addAttribute("bizAccountDto",bizAccountDto);
            m.addAttribute("mode", "new");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "mypage/qnaForm";
    }

    @PostMapping("/biz/QNA/write")
    public String writeQNA_biz(QNADto qnaDto, RedirectAttributes rattr, Model m){

        try {
            qnaDao.insert(qnaDto);
            m.addAttribute("mode", "new");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_WRT_ERR");
            return "redirect:/mypage/biz/main";

        }

        m.addAttribute("qnaDto",qnaDto);
        return "mypage/successPage/qnaWrtOk";
    }


    @GetMapping("/biz/QNA/read")
    public String ReadQNA_biz(Integer qna_NUM, Model m, Authentication auth, RedirectAttributes rattr) {

        try {
            QNADto qnaDto = qnaDao.selectByWriter(qna_NUM, getWriter(auth));
            m.addAttribute("qnaDto",qnaDto);
            // BizAccount 가 문의 한 Q&A 에 대한 data

            List<QNADto> qnaCommentDto = qnaCommentDao.selectAll(qna_NUM);
            m.addAttribute("qnaCommentDto",qnaCommentDto);
            // Admin 이 답변을 단 Q&A comment 에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_READ_ERR");
            return "redirect:/mypage/biz/main";
        }

        return "mypage/qnaForm";
    }



    @GetMapping("/admin/QNA/read")
    public String ReadQNA_admin(Integer qna_NUM, Model m, Authentication auth, RedirectAttributes rattr) {

        try {
            QNADto qnaDto = qnaDao.select(qna_NUM);
            m.addAttribute("qnaDto",qnaDto);
            // 웹사이트 이용자들이 문의/요청 한 Q&A 에 대한 data

            List<QNADto> qnaCommentDto = qnaCommentDao.selectAll(qna_NUM);
            m.addAttribute("qnaCommentDto",qnaCommentDto);
            // Admin 이 답변을 단 Q&A comment 에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_READ_ERR");
            return "redirect:/mypage/admin/main";
        }

        return "mypage/qnaForm";
    }



    public String getWriter(Authentication auth){
        UserDetails userDetail = (UserDetails)auth.getPrincipal();
        return userDetail.getUsername();
    }


}
