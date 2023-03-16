package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.BrowserHistoryDto;
import project.nectar.domain.HotdealDto;
import project.nectar.repository.BrowserHistoryDao;
import project.nectar.repository.HotdealDao;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class HotdealServiceImpl implements HotdealService {
    @Autowired
    HotdealDao hotdealDao;
    @Autowired
    BrowserHistoryDao browserHistoryDao;

    HttpSession session;



    @Override
    public List<HotdealDto> selectMyHotdeals(String bizAccount_email) throws Exception{
        return hotdealDao.selectMyHotdeals(bizAccount_email);
    }

    @Override
    public List<HotdealDto> selectAll() throws Exception{
        return hotdealDao.selectAll();
    }



    // read() : 게시글물을 들어가서 본다?(조회한다)
    //1. [browser history 테이블]에 조회한 게시물 번호(hotdeal_NUM)를 insert
    //2. [hotdeal 테이블]에서 (restr_NUM)번에 해당하는 레스토랑 정보를 select

    @Override
    @Transactional(rollbackFor = Exception.class)
    public HotdealDto read(Integer hotdeal_NUM) throws Exception{
        BrowserHistoryDto browserHistoryDto = new BrowserHistoryDto(session.getId(), (String) session.getAttribute("User_email"), null, null, hotdeal_NUM);
        browserHistoryDao.insertHotdealNUM(browserHistoryDto);
        return hotdealDao.select(hotdeal_NUM);
    }


    @Override
    public int delete(Integer hotdeal_NUM) throws Exception{
        return hotdealDao.delete(hotdeal_NUM);
    }

    @Override
    public int update(HotdealDto hotdealDto) throws Exception{
        return hotdealDao.update(hotdealDto);
    }

    @Override
    public int insert(HotdealDto hotdealDto) throws Exception{
        return hotdealDao.insert(hotdealDto);
    }


}
