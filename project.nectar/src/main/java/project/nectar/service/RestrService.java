package project.nectar.service;

import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;

import java.util.List;

public interface RestrService {
    int SearchResultCnt(SearchCondition sc) throws Exception;

    List<RestrDto> SearchResultPage(SearchCondition sc) throws Exception;

    RestrDto read(int restr_NUM) throws Exception;

    int deleteAll() throws Exception;

    int delete(Integer restr_NUM) throws Exception;

    int insertAll(RestrDto restrDto) throws Exception;

    int update(RestrDto restrDto) throws Exception;
}
