package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.repository.QnaCommentDao;

@Controller
@RequestMapping("/mypage")
public class QNACommentController{
    @Autowired
    QnaCommentDao qnaCommentDao;



    @PostMapping("/user/QNA/addComment")
    public String addComment_user(Integer qna_NUM, String qna_comment, String user_email){

        try {
            qnaCommentDao.insertComment(qna_NUM,qna_comment, user_email);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/user/main";
    };


    @PostMapping("/user/QNA/removeComment")
    public String removeComment_user(Integer qna_comment_NUM, String user_email){

        try {
            qnaCommentDao.deleteComment(qna_comment_NUM, user_email);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/user/main";

    }


    @PostMapping("/biz/QNA/addComment")
    public String addComment_biz(Integer qna_NUM, String qna_comment, String biz_email){

        try {
            qnaCommentDao.insertComment(qna_NUM,qna_comment, biz_email);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/biz/main";
    };


    @PostMapping("/biz/QNA/removeComment")
    public String removeComment_biz(Integer qna_comment_NUM, String biz_email){

        try {
            qnaCommentDao.deleteComment(qna_comment_NUM, biz_email);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/biz/main";

    }


    @PostMapping("/admin/QNA/addComment")
    public String addComment_admin(Integer qna_NUM, String qna_comment, String admin_email){

        try {
            qnaCommentDao.insertComment(qna_NUM,qna_comment, admin_email);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/admin/main";
    };


    @PostMapping("/admin/QNA/removeComment")
    public String removeComment_admin(Integer qna_comment_NUM, String admin_email){

        try {
            qnaCommentDao.deleteComment(qna_comment_NUM, admin_email);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/admin/main";

    }


}
