package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.nectar.repository.BrowserHistoryDao;

@Service
public class BrowserHistoryServiceImpl {
    @Autowired
    BrowserHistoryDao browserHistoryDao;




    //selectByJSESSIONID
    //selectByUser_email

    //tx 묶어서 처리해야함.
    //얘네 리스트로 (restr_NUM)를 가져오고, 그 리스트 하나 하나(restr_NUM)에 일치하는 (restr 정보)를 가져온다.
    // 이러지말고 list로 읽어온거, advanced for 로 돌려서 읽으면서 가게 1개 1개씩 읽어오면 되겠네
    // 이거 service 만들필요 없겠는데? 바로 controller에서 호출해

}
