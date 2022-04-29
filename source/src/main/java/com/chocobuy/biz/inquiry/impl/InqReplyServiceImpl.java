package com.chocobuy.biz.inquiry.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.inquiry.InqReplyService;
import com.chocobuy.biz.inquiry.InqReplyVO;


@Service("inqReplyService")
public class InqReplyServiceImpl implements InqReplyService {
	
	@Autowired
	private InqReplyDAOMybatis inqReplyDAO;

	@Override
	public List<InqReplyVO> getInqReplyList(InqReplyVO inqReplyVo) {
		return inqReplyDAO.getInqReplyList(inqReplyVo);
	}
	
	@Override
	public void insertInqReply(InqReplyVO inqReplyVo) {
		inqReplyDAO.insertInqReply(inqReplyVo);
	}
	
//	@Override
//	public void updateInqReply(InqReplyVO inqReplyVo) {
//		inqReplyDAO.updateInqReply(inqReplyVo);
//	}

	@Override
	public void deleteInqReply(InqReplyVO inqReplyVo) {
		inqReplyDAO.deleteInqReply(inqReplyVo);
	}
}
