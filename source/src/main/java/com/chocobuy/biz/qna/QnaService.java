package com.chocobuy.biz.qna;

import java.util.List;

import com.chocobuy.biz.qna.QnaVO;



public interface QnaService {
	//글 등록
	void insertQna(QnaVO vo);

	//글수정
	void updateQna(QnaVO vo);

	//글삭제
	void deleteQna(QnaVO vo);

	//글상세 조회
	QnaVO getQna(QnaVO vo);

	//글목록 조회
	List<QnaVO> QnaList(QnaVO vo);
	
	//게시물 총 갯수
		int countQna(QnaVO vo);

	
}
