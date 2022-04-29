package com.chocobuy.biz.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.qna.QnaService;
import com.chocobuy.biz.qna.QnaVO;
import com.chocobuy.biz.service.ServiceVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAOMybatis QnaDAO;
	
	@Override
	public void insertQna(QnaVO vo) {
		QnaDAO.insertQna(vo);
	}

	@Override
	public void updateQna(QnaVO vo) {
		QnaDAO.updateQna(vo);
	}

	@Override
	public void deleteQna(QnaVO vo) {
		QnaDAO.deleteQna(vo);
	}

	@Override
	public QnaVO getQna(QnaVO vo) {
		return QnaDAO.getQna(vo);
	}
	@Override
	public List<QnaVO> QnaList(QnaVO vo) {
		// TODO Auto-generated method stub
		return QnaDAO.QnaList(vo);
	}

	@Override
	public int countQna(QnaVO vo) {
		// TODO Auto-generated method stub
		return QnaDAO.countQna(vo);
	}

	
	
	
	
}
