package project.nectar.service;

import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.RestrDto;
import project.nectar.domain.ReviewDto;

import java.util.List;

public interface ReviewService {
    int count(int restr_NUM) throws Exception;

    List<ReviewDto> selectAll(int restr_NUM) throws Exception;

    ReviewDto select(int review_NUM) throws Exception;

    List<ReviewDto> readMyReviews(String user_email) throws Exception;

    // Write() : 리뷰를 작성한다?
    //1. [restr 테이블]에 reviewCnt +1  를 update
    //2. [review 테이블]에 작성한 리뷰(content, star)를 insert
    //3. [review 테이브]에서 avg(review_star)를 select
    //4. [restr 테이블]에 avg(review_star)를 update
    @Transactional(rollbackFor = Exception.class)
    int write(ReviewDto reviewDto, RestrDto restrDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int delete(ReviewDto reviewDto, RestrDto restrDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int modify(ReviewDto reviewDto, RestrDto restrDto) throws Exception;
}
