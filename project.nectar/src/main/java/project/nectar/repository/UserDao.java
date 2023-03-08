package project.nectar.repository;

import project.nectar.domain.UserDto;

public interface UserDao {
    int insert(UserDto userDto);

    UserDto select(String user_email);

    int update(UserDto userDto);

    int delete(String user_email);

    int deleteAll();

    int count();
}
