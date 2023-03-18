package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.BrowserHistoryDto;
import project.nectar.repository.BrowserHistoryDao;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    BrowserHistoryDao browserHistoryDao;


    @RequestMapping("/")
    public String getTopSearchKeyword(Model m, HttpSession session) {

        try {
            List<BrowserHistoryDto> topSearchKeywordList = browserHistoryDao.select_TopSearchKeyword();
            m.addAttribute("topSearchKeywordList", topSearchKeywordList);
            // 인기 검색어에 대한 data



//
//
////            안녕... 잘가... 내 향상된 포문이여... 아름다웠어... 기억할게..
//            List<RestrDto> getVisitedPageList = new ArrayList<>();
//            List<BrowserHistoryDto> viewBrowserHistoryList = browserHistoryDao.selectByJSESSIONID(bh);
//            for(BrowserHistoryDto dto: viewBrowserHistoryList){
//                getVisitedPageList.add(restrDao.select(dto.getRestr_NUM()));
//            }
//            m.addAttribute("getVisitedPageList",getVisitedPageList);
//            // 로그인 안한 이용자가, 최근에 본 게시물에 대한 data
//
//
//            List<RestrDto> getVisitedPageList_User = new ArrayList<>();
//            List<BrowserHistoryDto> viewBrowserHistoryList_User = browserHistoryDao.selectByUser_email(bh);
//            for(BrowserHistoryDto dto: viewBrowserHistoryList_User){
//                getVisitedPageList_User.add(restrDao.select(dto.getRestr_NUM()));
//            }
//            m.addAttribute("getVisitedPageList_User",getVisitedPageList_User);
////            // 로그인 한 User 가, 최근에 본 게시물에 대한 data


        } catch (Exception e) {
            e.printStackTrace();
//            return "redirect:/errpage";
            return "restrList"; // 데이터가 없어서 sql 에러뜸. 일단은 home으로 보내놓겠음.
        }

        return "home";
    }


}
