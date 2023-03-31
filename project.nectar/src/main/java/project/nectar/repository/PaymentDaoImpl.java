package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
    public List<PaymentDto> selectByUserEmail(String user_email) throws Exception{
        return session.selectList(namespace+"selectByUserEmail", user_email);
    }

    @Override
    public List<PaymentDto> selectByBizEmail(String bizAccount_email) throws Exception{
        return session.selectList(namespace+"selectByBizEmail", bizAccount_email);
    }

    @Override
    public List<PaymentDto> selectByHotdeal(String hotdeal_NUM) throws Exception{
        return session.selectList(namespace+"selectByHotdeal", hotdeal_NUM);
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
