package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.BrowserHistoryDto;
import project.nectar.domain.PageHandler;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.BrowserHistoryDao;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    BrowserHistoryDao browserHistoryDao;

    @RequestMapping("/")
    public String get_TopSearchKeyword(Model m) {

        try {
//            List<BrowserHistoryDto> browserHistoryDto = browserHistoryDao.select_TopSearchKeyword();
//            m.addAttribute("browserHistoryDto", browserHistoryDto);
        } catch (Exception e) {
            e.printStackTrace();
//            return "redirect:/errpage";
            return "home"; // 데이터가 없어서 sql 에러뜸. 일단은 home으로 보내놓겠음.
        }

        return "home";
    }


}
