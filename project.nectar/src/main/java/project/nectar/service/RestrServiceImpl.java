package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.RestrDao;

import java.util.List;

@Service
public class RestrServiceImpl implements RestrService {
    @Autowired
    RestrDao restrDao;

    @Override
    public int SearchResultCnt(SearchCondition sc) throws Exception {
        return restrDao.searchResultCnt(sc);
    }

    @Override
    public List<RestrDto> SearchResultPage(SearchCondition sc) throws Exception {
        return restrDao.SearchResultPage(sc);
    }

    @Override
    public RestrDto read(int restr_NUM) throws Exception {
        restrDao.updateViewCnt(restr_NUM);
        return restrDao.select(restr_NUM);
    }

    @Override
    public int deleteAll() throws Exception {
        return restrDao.deleteAll();
    }

    @Override
    public int delete(RestrDto restrDto) throws Exception {
        return restrDao.delete(restrDto);
    }

    @Override
    public int insertAll(RestrDto restrDto) throws Exception {
        return restrDao.insertAll(restrDto);
    }

    @Override
    public int update(RestrDto restrDto) throws Exception {
        return restrDao.update(restrDto);
    }
}