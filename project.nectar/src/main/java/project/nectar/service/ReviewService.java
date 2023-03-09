package project.nectar.service;

import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.RestrDto;
import project.nectar.domain.ReviewDto;

import java.util.List;

public interface ReviewService {
    int count(int restr_NUM) throws Exception;

    List<ReviewDto> selectAll(int restr_NUM) throws Exception;

    ReviewDto select(int review_NUM) throws Exception;

    List<ReviewDto> getMyReviews(String user_email) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int write(ReviewDto reviewDto, RestrDto restrDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int delete(ReviewDto reviewDto, RestrDto restrDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int modify(ReviewDto reviewDto, RestrDto restrDto) throws Exception;
}
