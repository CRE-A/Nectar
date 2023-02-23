package teamProject.service;

import teamProject.domain.BoardDto;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
    int count() throws Exception;

    List<BoardDto> selectAll() throws Exception;

    List<BoardDto> selectPage(HashMap map) throws Exception;

    BoardDto select(int bno) throws Exception;

    int insert(BoardDto boardDto) throws Exception;

    int deleteAll() throws Exception;

    int delete(HashMap map) throws Exception;

    int update(BoardDto boardDto) throws Exception;
}
