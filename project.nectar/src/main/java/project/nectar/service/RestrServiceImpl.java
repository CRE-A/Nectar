package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.BrowserHistoryDto;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.BrowserHistoryDao;
import project.nectar.repository.LikelistDao;
import project.nectar.repository.RestrDao;
import project.nectar.repository.ReviewDao;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class RestrServiceImpl implements RestrService {
    @Autowired
    RestrDao restrDao;
    @Autowired
    ReviewDao reviewDao;
    @Autowired
    LikelistDao likelistDao;

    @Autowired
    BrowserHistoryDao browserHistoryDao;



    @Override
    public int SearchResultCnt(SearchCondition sc) throws Exception {
        return restrDao.searchResultCnt(sc);
    }





    // 약점. 아무것도 검색 안해도 restr/list로 이동 가능하다면, keyword 가 null도 들어온다. // 해결

    // SearchResultPage() : 검색 결과를 가져온다?(검색한다)
    //2. [browser history 테이블]에 검색어(sc)를 insert
    //3. [restr 테이블]에서 검색어(sc)에 해당하는 모든 레스토랑을 select

        HttpSession session;
    @Override
    public List<RestrDto> SearchResultPage(SearchCondition sc, BrowserHistoryDto browserHistoryDto) throws Exception {
        browserHistoryDao.insertKeyword(browserHistoryDto);
        return restrDao.SearchResultPage(sc);
    }



    // read() : 게시글물을 들어가서 본다?(조회한다)
    //1. [browser history 테이블]에 조회한 게시물 번호(restr_NUM)를 insert
    //2. [restr 테이블]에 (restr_NUM)번의 조회수(viewCnt)를 +1 update
    //3. [restr 테이블]에서 (restr_NUM)번에 해당하는 레스토랑 정보를 select

    @Override
    @Transactional(rollbackFor = Exception.class)
    public RestrDto read(Integer restr_NUM, BrowserHistoryDto browserHistoryDto) throws Exception {
        browserHistoryDao.insertRestrNUM(browserHistoryDto);
        restrDao.updateViewCnt(restr_NUM);  // 게시물을 읽으면, 조회수 +1
        return restrDao.select(restr_NUM);
    }



    // Delete() : 게시글을 삭제한다?
    //1. [review 테이블]에서 (restr_NUM)번에 해당하는 모든 리뷰를 delete
    //2. [likelist 테이블]에 (restr_NUM)번에 해당하는 모든 like를 delete
    //3. [restr 테이블]에 (restr_NUM)번의 게시글을 delete

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int delete(Integer restr_NUM) throws Exception {
        reviewDao.deleteAll(restr_NUM);
        likelistDao.deleteRestr(restr_NUM);
        return restrDao.delete(restr_NUM);
    }



    @Override
    public int insertAll(RestrDto restrDto) throws Exception {
        return restrDao.insertAll(restrDto);
    } // TDD


    @Override
    public int update(RestrDto restrDto) throws Exception {
        return restrDao.update(restrDto);
    } // TDD

}




