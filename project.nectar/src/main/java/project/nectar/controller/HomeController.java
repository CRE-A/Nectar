package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.nectar.domain.BrowserHistoryDto;
import project.nectar.domain.UserDto;
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



        } catch (Exception e) {
            e.printStackTrace();
//            return "redirect:/errpage";
            return "matListPage/restrList"; // 데이터가 없어서 sql 에러뜸. 일단은 home으로 보내놓겠음.
        }

        return "home";
    }



}
