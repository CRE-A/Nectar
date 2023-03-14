package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.nectar.domain.HotdealDto;
import project.nectar.repository.HotdealDao;

import java.util.List;

@Service
public class HotdealServiceImpl implements HotdealService {
    @Autowired
    HotdealDao hotdealDao;

    @Override
    public List<HotdealDto> selectMyHotdeals(String bizAccount_email) throws Exception{
        return hotdealDao.selectMyHotdeals(bizAccount_email);
    }

    @Override
    public List<HotdealDto> selectAll() throws Exception{
        return hotdealDao.selectAll();
    }

    @Override
    public HotdealDto select(Integer hotdeal_NUM) throws Exception{
        return hotdealDao.select(hotdeal_NUM);
    }

    @Override
    public int delete(Integer hotdeal_NUM) throws Exception{
        return hotdealDao.delete(hotdeal_NUM);
    }

    @Override
    public int update(HotdealDto hotdealDto) throws Exception{
        return hotdealDao.update(hotdealDto);
    }

    @Override
    public int insert(HotdealDto hotdealDto) throws Exception{
        return hotdealDao.insert(hotdealDto);
    }


}
