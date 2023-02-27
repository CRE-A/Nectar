package project.nectar.service;

import project.nectar.domain.CafeDto;
import project.nectar.domain.SearchCondition;

import java.util.List;

public interface CafeService {
    int SearchResultCnt(SearchCondition sc) throws Exception;

    List<CafeDto> SearchResultPage(SearchCondition sc) throws Exception;
}
