package project.nectar.repository;

import project.nectar.domain.HotdealDto;

import java.util.List;

public interface Request_HotdealDao {
    List<HotdealDto> selectAll();

    HotdealDto select(Integer request_hotdeal_NUM);

    int insert(HotdealDto hotdealDto);

    int delete(Integer request_hotdeal_NUM);
}
