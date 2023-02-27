package project.nectar.service;

import project.nectar.repository.BoardDao;
import project.nectar.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;

    @Override
    public int count() throws Exception {
        return boardDao.count();
    }

    @Override
    public List<BoardDto> selectAll() throws Exception {
        return boardDao.selectAll();
    }

    @Override
    public List<BoardDto> selectPage(HashMap map) throws Exception {
        return boardDao.selectPage(map);
    }

    @Override
    public BoardDto select(int bno) throws Exception {
        boardDao.increaseViewCnt(bno);
        return boardDao.select(bno);
    }

    @Override
    public int insert(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    @Override
    public int deleteAll() throws Exception{
        return boardDao.deleteAll();
    }

    @Override
    public int delete(HashMap map) throws Exception{
        return boardDao.delete(map);
    }

    @Override
    public int update(BoardDto boardDto) throws Exception{
        return boardDao.update(boardDto);
    }

}
