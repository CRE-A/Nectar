package project.nectar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.nectar.domain.CafeDto;
import project.nectar.domain.PageHandler;
import project.nectar.domain.SearchCondition;
import project.nectar.service.CafeService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    CafeService cafeService;

    @RequestMapping("/")
        public String list(Model m, SearchCondition sc, HttpServletRequest request) {

            try {
                int totalCnt = cafeService.SearchResultCnt(sc);
                PageHandler pageHandler = new PageHandler(totalCnt, sc);
                m.addAttribute("ph", pageHandler);

            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("msg", "LIST_ERR");
            }

            return "index";
    }
}
