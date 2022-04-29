package com.chocobuy.biz.inquiry;

import java.util.List;

public interface InqReplyService {

	//댓글조회
	List<InqReplyVO> getInqReplyList(InqReplyVO inqReplyVo);
	
	//댓글작성
	void insertInqReply(InqReplyVO inqReplyVo);
	
	//댓글수정
//	void updateInqReply(InqReplyVO inqReplyVo);
	
	//댓글삭제
	void deleteInqReply(InqReplyVO inqReplyVo);


}