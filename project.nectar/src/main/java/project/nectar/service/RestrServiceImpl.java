package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.RestrDao;
import project.nectar.repository.ReviewDao;

import java.util.List;

@Service
public class RestrServiceImpl implements RestrService {
    @Autowired
    RestrDao restrDao;
    @Autowired
    ReviewDao reviewDao;

    @Override
    public int SearchResultCnt(SearchCondition sc) throws Exception {
        return restrDao.searchResultCnt(sc);
    }

    @Override
    public List<RestrDto> SearchResultPage(SearchCondition sc) throws Exception {
        return restrDao.SearchResultPage(sc);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public RestrDto read(int restr_NUM) throws Exception {
        restrDao.updateViewCnt(restr_NUM);
        return restrDao.select(restr_NUM);
    }

    @Override
    public int deleteAll() throws Exception {
        //TX
        return restrDao.deleteAll();
    } // 나중에 쓰일 때 tx로 몪어서 처리해야함.

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int delete(Integer restr_NUM) throws Exception {
        // 삭제하면, review table 에도 반영되서 restr_NUM에 속하는 모든 리뷰를 삭제되어야함.
        reviewDao.deleteAll(restr_NUM);
        return restrDao.delete(restr_NUM);
    }

    @Override
    public int insertAll(RestrDto restrDto) throws Exception {
        //TX
        return restrDao.insertAll(restrDto);
    }

    @Override
    public int update(RestrDto restrDto) throws Exception {
        //TX
        return restrDao.update(restrDto);
    }
}