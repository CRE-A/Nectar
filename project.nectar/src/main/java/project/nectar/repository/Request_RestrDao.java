package project.nectar.repository;

import project.nectar.domain.RestrDto;

import java.util.List;

public interface Request_RestrDao {
    List<RestrDto> selectAll();

    RestrDto select(Integer request_restr_NUM);

    int insertAll(RestrDto restrDto);

    int delete(Integer request_restr_NUM);
}
