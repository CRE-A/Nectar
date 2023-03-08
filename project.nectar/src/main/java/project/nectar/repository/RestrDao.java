package project.nectar.repository;

import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;

import java.util.List;

public interface RestrDao {
    int searchResultCnt(SearchCondition sc) throws Exception;

    List<RestrDto> SearchResultPage(SearchCondition sc) throws Exception;

    RestrDto select(int restr_NUM) throws Exception;

    int count() throws Exception;

    int deleteAll() throws Exception;

    int delete(RestrDto restrDto) throws Exception;

    int insertAll(RestrDto restrDto) throws Exception;

    int update(RestrDto restrDto) throws Exception;

    int updateViewCnt(Integer restr_NUM) throws Exception;

    int updateReviewCnt(Integer restr_NUM, int cnt) throws Exception;

    int updateLikeCnt(Integer restr_NUM, int cnt) throws Exception;

    int updateStar(RestrDto restrDto) throws Exception;
}
