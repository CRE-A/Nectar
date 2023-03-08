package project.nectar.repository;

import project.nectar.domain.ReviewDto;

import java.util.List;

public interface ReviewDao {
    int count(int restr_NUM) throws Exception;

    List<ReviewDto> selectAll(int restr_NUM) throws Exception;

    ReviewDto select(int review_NUM) throws Exception;

    List<ReviewDto> selectMyReviews(String user_email)throws Exception;

    int insert(ReviewDto reviewDto) throws Exception;

    int deleteAll(int restr_NUM) throws Exception;

    int delete(ReviewDto reviewDto) throws Exception;

    int update(ReviewDto reviewDto) throws Exception;

    float getAvgStar(int restr_NUM) throws Exception;
}
