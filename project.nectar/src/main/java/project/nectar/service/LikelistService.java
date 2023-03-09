package project.nectar.service;

import org.springframework.transaction.annotation.Transactional;
import project.nectar.domain.LikelistDto;

import java.util.List;

public interface LikelistService {
    LikelistDto select(Integer restr_NUM) throws Exception // 유저가 로그인 해서 게시물 들어갔을 때, 좋아요 누른 게시물인지 확인용
    ;

    List<LikelistDto> getMyLikeList(String user_email) throws Exception // MyPage 에서 selectAll 하면 내가 좋아요 누른 모든 가게가 나옴
    ;

    @Transactional(rollbackFor = Exception.class)
    int addLike(LikelistDto likelistDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int cancelLike(LikelistDto likelistDto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    void removeMyLikeList(String user_email) throws Exception // MyPage 에서 removeMyLikeList 하면 내가 좋아요 누른 모든 가게가 모두 삭제
    ;
}
