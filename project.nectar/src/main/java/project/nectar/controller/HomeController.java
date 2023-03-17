package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.BrowserHistoryDto;
import project.nectar.domain.PageHandler;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.BrowserHistoryDao;
import project.nectar.repository.RestrDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    BrowserHistoryDao browserHistoryDao;
    @Autowired
    RestrDao restrDao;


    @RequestMapping("/")
    public String getTopSearchKeyword(Model m, HttpSession session) {
        BrowserHistoryDto bh = new BrowserHistoryDto(session.getId(), (String)session.getAttribute("User_email"));

        try {
            List<BrowserHistoryDto> topSearchKeywordList = browserHistoryDao.select_TopSearchKeyword();
            m.addAttribute("topSearchKeywordList", topSearchKeywordList);
            // 인기 검색어에 대한 data

//            List<BrowserHistoryDto> browserHistoryList = browserHistoryDao.selectByJSESSIONID(bh);
////            System.out.println("browserHistoryList = " + browserHistoryList);
//            List<RestrDto> restrDtoList = null;
//            for(BrowserHistoryDto browserHistoryDto: browserHistoryList){
////                System.out.println("browserHistoryDto = " + browserHistoryDto);
//                if(browserHistoryDto.getRestr_NUM()!=null){
//                    restrDtoList.add(restrDao.select(browserHistoryDto.getRestr_NUM()));
//                }
//            }
//            m.addAttribute("restrDtoList",restrDtoList);
//            // 최근에 본 레스토랑(게시물)에 대한 data

        } catch (Exception e) {
            e.printStackTrace();
//            return "redirect:/errpage";
            return "home"; // 데이터가 없어서 sql 에러뜸. 일단은 home으로 보내놓겠음.
        }

        return "home";
    }


}
