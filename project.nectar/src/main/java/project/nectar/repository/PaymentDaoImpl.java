package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.HotdealPlusDto;
import project.nectar.domain.PaymentDto;

import java.util.List;

@Repository
public class PaymentDaoImpl implements PaymentDao {
    @Autowired
    SqlSession session;
    private String namespace = "project.nectar.repository.PaymentMapper.";



    @Override
    public Integer count(PaymentDto paymentDto)throws Exception{
        return session.selectOne(namespace+"count", paymentDto);
    }

    @Override
    public List<HotdealPlusDto> PaymentAndHotdeal_byUser(String user_email) throws Exception{
        return session.selectList(namespace+"select_PaymentAndHotdeal_byUser", user_email);
    }

    @Override
    public List<HotdealPlusDto> PaymentAndHotdeal_byBiz(String bizAccount_email) throws Exception{
        return session.selectList(namespace+"select_PaymentAndHotdeal_byBiz", bizAccount_email);
    }


    @Override
    public Integer insert(PaymentDto paymentDto) throws Exception{
        return session.insert(namespace+"insert", paymentDto);
    }

    @Override
    public Integer delete(PaymentDto paymentDto) throws  Exception{
        return session.delete(namespace+"delete", paymentDto);
    }


}
