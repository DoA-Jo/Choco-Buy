package com.chocobuy.biz.inquiry;

import java.util.List;

import com.chocobuy.biz.user.UserVO;

public interface InqService {

	//CRUD 기능의 메소드 구현
	//글등록
	void insertInq(InqVO inqVo);

	//글수정
	void updateInq(InqVO inqVo);

	//글삭제
	void deleteInq(InqVO inqVo);

	//글상세 조회
	InqVO getInq(InqVO inqVo);

	//글목록 조회
	List<InqVO> getInqList(InqVO inqVo);
	
	//게시물 총 갯수
	int countInq(InqVO inqVo);
	
	
	//관리자 체크
	UserVO getVo_ck(UserVO vo);

}