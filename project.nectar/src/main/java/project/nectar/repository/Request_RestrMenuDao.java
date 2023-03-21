package project.nectar.repository;

import project.nectar.domain.RestrMenuDto;

import java.util.List;

public interface Request_RestrMenuDao {
    List<RestrMenuDto> selectAll(Integer request_restr_NUM);

    int insert(RestrMenuDto restrMenuDto);

    int delete(Integer request_restr_NUM);
}
