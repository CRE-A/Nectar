package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.nectar.domain.UserDetailsDto;
import project.nectar.repository.UserDao;

@Service
public class UserDetailService implements UserDetailsService {
    @Autowired
    private UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String user_email) throws UsernameNotFoundException {
        UserDetailsDto userDetailsDto = userDao.selectByUserEmail(user_email);
        if(userDetailsDto == null){
            throw new UsernameNotFoundException("username"+user_email+" not found");
        }
        System.out.println("=================Found User==============================");
        System.out.println("user_email : "+userDetailsDto.getUsername());
        System.out.println("=================email은 일치하네==============================");

        return userDetailsDto;
    }
}
