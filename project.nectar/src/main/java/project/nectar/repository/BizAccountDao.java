package project.nectar.repository;

import project.nectar.domain.BizAccountDto;

public interface BizAccountDao {
    int insert(BizAccountDto bizAccountDto);

    BizAccountDto select(String bizAccount_email);

    int update(BizAccountDto bizAccountDto);

    int delete(String bizAccount_email);

    int deleteAll();

    int count();
}
