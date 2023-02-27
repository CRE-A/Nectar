package project.nectar.repository;

import project.nectar.domain.CafeDto;
import project.nectar.domain.SearchCondition;

import java.util.List;

public interface CafeDao {
    int searchResultCnt(SearchCondition sc) throws Exception // T selectOne(String statement, Object parameter)
    ;

    List<CafeDto> searchSelectPage(SearchCondition sc) throws Exception // List<E> selectList(String statement, Object parameter)
    ;
}
