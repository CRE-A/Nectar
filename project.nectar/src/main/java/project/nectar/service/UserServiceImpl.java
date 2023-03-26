package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import project.nectar.domain.BizAccountDto;
import project.nectar.domain.UserDto;
import project.nectar.repository.BizAccountDao;
import project.nectar.repository.UserDao;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    BizAccountDao bizAccountDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    // 회원이 입력한 pwd 를 암호화해서 db에 저장
    @Override
    public int RegisterUser(UserDto userDto) throws Exception{
        String encodedPassword = bCryptPasswordEncoder.encode(userDto.getUser_pwd());
        userDto.setUser_pwd(encodedPassword);
        System.out.println("userDto = " + userDto);
        return userDao.insert(userDto);
    }

    @Override
    public int RegisterBiz(BizAccountDto bizAccountDto) throws Exception{
        String encodedPassword = bCryptPasswordEncoder.encode(bizAccountDto.getBizAccount_pwd());
        bizAccountDto.setBizAccount_pwd(encodedPassword);
        System.out.println("userDto = " + bizAccountDto);
        return bizAccountDao.insert(bizAccountDto);
    }




}