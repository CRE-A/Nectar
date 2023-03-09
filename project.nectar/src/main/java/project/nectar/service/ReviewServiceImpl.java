package project.nectar.service;

import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.RestrDto;
import project.nectar.domain.ReviewDto;
import project.nectar.repository.RestrDao;
import project.nectar.repository.ReviewDao;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    RestrDao restrDao;
    @Autowired
    ReviewDao reviewDao;


    @Override
    public int count(int restr_NUM) throws Exception {
        return reviewDao.count(restr_NUM);
    }

    @Override
    public List<ReviewDto> selectAll(int restr_NUM) throws Exception{
        return reviewDao.selectAll(restr_NUM);
    }

    @Override
    public ReviewDto select(int review_NUM) throws Exception {
        return reviewDao.select(review_NUM);
    }

    @Override
    public List<ReviewDto> getMyReviews(String user_email) throws Exception{
         return reviewDao.selectMyReviews(user_email);
    }

//    public int deleteAll(int restr_NUM) throws Exception{
//        return reviewDao.deleteAll(restr_NUM);
//    }


    // Write() : 리뷰를 작성한다?
    //1. [restr 테이블]에 reviewCnt +1  를 update
    //2. [review 테이블]에 작성한 리뷰(content, star)를 insert
    //3. [review 테이블]에서 avg(review_star)를 select
    //4. [restr 테이블]에 avg(review_star)를 update

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(ReviewDto reviewDto, RestrDto restrDto) throws Exception {
         restrDao.updateReviewCnt(restrDto.getRestr_NUM(), 1);
         reviewDao.insert(reviewDto);
         float avgStar = reviewDao.getAvgStar(restrDto.getRestr_NUM());
         restrDto.setRestr_star(avgStar);
         return restrDao.updateStar(restrDto);
     }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int delete(ReviewDto reviewDto, RestrDto restrDto) throws Exception{
        restrDao.updateReviewCnt(restrDto.getRestr_NUM(), -1);
        reviewDao.delete(reviewDto);
        float avgStar = reviewDao.getAvgStar(restrDto.getRestr_NUM());
        restrDto.setRestr_star(avgStar);
        return restrDao.updateStar(restrDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int modify(ReviewDto reviewDto, RestrDto restrDto) throws Exception{
        reviewDao.update(reviewDto);
        float avgStar = reviewDao.getAvgStar(restrDto.getRestr_NUM());
        restrDto.setRestr_star(avgStar);
        return restrDao.updateStar(restrDto);
    }

}
