package project.nectar.repository;

import project.nectar.domain.QNADto;

import java.util.List;

public interface QNADao {
    List<QNADto> selectAll();

    QNADto select(Integer qna_NUM);

    int insert(QNADto qnaDto);
}
