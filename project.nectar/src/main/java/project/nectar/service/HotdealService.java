package project.nectar.service;

import project.nectar.domain.HotdealDto;

import java.util.List;

public interface HotdealService {
    List<HotdealDto> selectMyHotdeals(String bizAccount_email) throws Exception;

    List<HotdealDto> selectAll() throws Exception;

    HotdealDto read(Integer hotdeal_NUM) throws Exception;

    int delete(Integer hotdeal_NUM) throws Exception;

    int update(HotdealDto hotdealDto) throws Exception;

    int insert(HotdealDto hotdealDto) throws Exception;
}
