package project.nectar.repository;

import project.nectar.domain.LikelistDto;

import java.util.List;

public interface LikelistDao {
    int count(Integer restr_NUM) throws Exception;

    List<LikelistDto> selectAll(String user_email) throws Exception;

    LikelistDto select(Integer restr_NUM) throws Exception;

    int insert(LikelistDto likelistDto) throws Exception;

    int deleteAll(String user_email) throws Exception;

    int delete(LikelistDto likelistDto) throws Exception;
}
