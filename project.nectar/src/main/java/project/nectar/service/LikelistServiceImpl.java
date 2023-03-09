package project.nectar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.LikelistDto;
import project.nectar.repository.LikelistDao;
import project.nectar.repository.RestrDao;

import java.util.List;

@Service
public class LikelistServiceImpl implements LikelistService {
    @Autowired
    LikelistDao likelistDao;
    @Autowired
    RestrDao restrDao;

    @Override
    public LikelistDto select(Integer restr_NUM) throws Exception{
        return likelistDao.select(restr_NUM);
    } // 유저가 로그인 해서 게시물 들어갔을 때, 좋아요 누른 게시물인지 확인용

    @Override
    public List<LikelistDto> getMyLikeList(String user_email) throws Exception{
        return likelistDao.selectAll(user_email);
    } // MyPage 에서 selectAll 하면 내가 좋아요 누른 모든 가게가 나옴


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addLike(LikelistDto likelistDto) throws Exception{
        restrDao.updateLikeCnt(likelistDto.getRestr_NUM(),1);
        return likelistDao.insert(likelistDto);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int cancelLike(LikelistDto likelistDto) throws Exception{
        restrDao.updateLikeCnt(likelistDto.getRestr_NUM(),-1);
        return likelistDao.delete(likelistDto);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void removeMyLikeList(String user_email) throws Exception {
//        likelistDao.deleteAll(likelistDto.getUser_email());

        List<LikelistDto> getRestrList = likelistDao.selectAll(user_email);
        for(LikelistDto likelistDto :getRestrList){
            cancelLike(likelistDto);
        }
    } // MyPage 에서 removeMyLikeList 하면 내가 좋아요 누른 모든 가게가 모두 삭제



    // likelistMapper에서 count() 와 deleteAll()은 쓰이지 않음.
}
