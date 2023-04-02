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
import project.nectar.domain.QNADto;
import project.nectar.repository.QNADao;
import project.nectar.repository.QnaCommentDao;

import java.util.List;

@Controller
@RequestMapping("/mypage")
public class QNAController {
    @Autowired
    QNADao qnaDao;
    @Autowired
    QnaCommentDao qnaCommentDao;


    Authentication authentication;
    UserDetails userDetails = (UserDetails)authentication.getPrincipal();
    String writer = userDetails.getUsername();



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
    public String ReadQNA_user(Integer qna_NUM, Model m) {


        try {
            QNADto qnaDto = qnaDao.selectByWriter(qna_NUM, writer);
            m.addAttribute("qnaDto",qnaDto);
            // User 가 문의 한 Q&A 에 대한 data

            List<QNADto> qnaCommentDto = qnaCommentDao.selectAll(qna_NUM);
            m.addAttribute("qnaCommentDto",qnaCommentDto);
            // Admin 이 답변을 단 Q&A comment 에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/qnaForm";
    }



    @PostMapping("/biz/QNA/write")
    public String writeQNA_biz(QNADto qnaDto, RedirectAttributes rattr, Model m){

        try {
            qnaDao.insert(qnaDto);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","QNA_WRT_ERR");
            return "redirect:/mypage/biz/main";

        }

        m.addAttribute("qnaDto",qnaDto);
        return "mypage/successPage/qnaWrtOk";
    }

    @GetMapping("/biz/QNA/read")
    public String ReadQNA_biz(Integer qna_NUM, Model m) {


        try {
            QNADto qnaDto = qnaDao.selectByWriter(qna_NUM, writer);
            m.addAttribute("qnaDto",qnaDto);
            // BizAccount 가 문의 한 Q&A 에 대한 data

            List<QNADto> qnaCommentDto = qnaCommentDao.selectAll(qna_NUM);
            m.addAttribute("qnaCommentDto",qnaCommentDto);
            // Admin 이 답변을 단 Q&A comment 에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/qnaForm";
    }




    @GetMapping("/admin/QNA/read")
    public String ReadQNA(Integer qna_NUM, Model m) {


        try {
            QNADto qnaDto = qnaDao.select(qna_NUM);
            m.addAttribute("qnaDto",qnaDto);
            // User, BizAccount 가 문의 한 Q&A 에 대한 data

            List<QNADto> qnaCommentDto = qnaCommentDao.selectAll(qna_NUM);
            m.addAttribute("qnaCommentDto",qnaCommentDto);
            // Admin 이 답변을 단 Q&A comment 에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/qnaForm";

    }


    @PostMapping("/QNA/addComment")
    public String addComment(Integer qna_NUM, String qna_comment, String qna_commenter){

        try {
            qnaCommentDao.insertComment(qna_NUM,qna_comment, qna_commenter);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/admin/main";
    };


    @PostMapping("/QNA/removeComment")
    public String removeComment(Integer qna_comment_NUM, String qna_commenter){

        try {
            qnaCommentDao.deleteComment(qna_comment_NUM, qna_commenter);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/admin/main";

    }



}
