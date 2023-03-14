package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.LikelistDao;
import project.nectar.repository.RestrDao;
import project.nectar.repository.ReviewDao;

import java.util.List;

@Service
public class RestrServiceImpl implements RestrService {
    @Autowired
    RestrDao restrDao;
    @Autowired
    ReviewDao reviewDao;
    @Autowired
    LikelistDao likelistDao;


    @Override
    public int SearchResultCnt(SearchCondition sc) throws Exception {
        return restrDao.searchResultCnt(sc);
    }

    // SearchResultPage() : 검색 결과를 가져온다?
    //1. [restr 테이블]에서 검색어(sc)에 해당하는 모든 레스토랑을 select
    //2. [search record 테이블]에 검색어(sc)를 insert or update

    @Override
    public List<RestrDto> SearchResultPage(SearchCondition sc) throws Exception {
        // TX
        // searchRecord.insert(sc) or searchRecord.update(sc)
        return restrDao.SearchResultPage(sc);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public RestrDto read(int restr_NUM) throws Exception {
        restrDao.updateViewCnt(restr_NUM);  // 게시물을 읽으면, 조회수 +1
        return restrDao.select(restr_NUM);
    }


    // Delete() : 게시글을 삭제한다?
    //1. [restr 테이블]에 (restr_NUM)번의 게시글을 delete
    //2. [review 테이블]에서 (restr_NUM)번에 해당하는 모든 리뷰를 delete
    //3. [likelist 테이블]에 (restr_NUM)번에 해당하는 모든 like를 delete

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int delete(Integer restr_NUM) throws Exception {
        restrDao.delete(restr_NUM);
        reviewDao.deleteAll(restr_NUM);
        return likelistDao.deleteRestr(restr_NUM);
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