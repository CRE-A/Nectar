package project.nectar.repository;

import project.nectar.domain.PaymentDto;

import java.util.List;

public interface PaymentDao {
    Integer count(PaymentDto paymentDto) throws Exception;

    List<PaymentDto> selectByUserEmail(String user_email) throws Exception;

    List<PaymentDto> selectByBizEmail(String bizAccount_email) throws Exception;

    List<PaymentDto> selectByHotdeal(String hotdeal_NUM) throws Exception;

    Integer insert(PaymentDto paymentDto) throws Exception;

    Integer delete(PaymentDto paymentDto) throws Exception;
}
