package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.nectar.domain.CafeDto;
import project.nectar.domain.SearchCondition;
import project.nectar.repository.CafeDao;

import java.util.List;

@Service
public class CafeServiceImpl implements CafeService {
    @Autowired
    CafeDao cafeDao;
    @Override
    public int SearchResultCnt(SearchCondition sc) throws Exception {
        return cafeDao.searchResultCnt(sc);
    }

    @Override
    public List<CafeDto> SearchResultPage(SearchCondition sc) throws Exception {
        return cafeDao.searchSelectPage(sc);
    }
}


