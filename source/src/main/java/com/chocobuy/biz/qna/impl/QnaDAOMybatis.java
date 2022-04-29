package com.chocobuy.biz.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.inquiry.InqVO;
import com.chocobuy.biz.qna.QnaVO;

@Repository
public class QnaDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	//글 등록 
	public void insertQna(QnaVO vo) {
		System.out.println("===>JDBC로 insertQna() 기능처리");
		mybatis.insert("QnaDAO.insertQna", vo);
	}
	//글 수정
	public void updateQna(QnaVO vo) {
		System.out.println("===>JDBC로 updateQna() 기능처리");
		mybatis.update("QnaDAO.updateQna", vo);
	}
	//글 삭제
	public void deleteQna(QnaVO vo) {
		System.out.println("===>JDBC로 deleteQna() 기능처리");
		mybatis.delete("QnaDAO.deleteQna", vo);
	}
	//글 상세 조회
	public QnaVO getQna(QnaVO vo) {
		System.out.println("===>JDBC로 getQna() 기능처리");
//		mybatis.update("QnaDAO.updateCnt", vo);
		return (QnaVO) mybatis.selectOne("QnaDAO.getQna", vo);
	}
	
	//글 목록 조회
	public List<QnaVO> QnaList(QnaVO vo) {
		System.out.println("===>JDBC로 getQnaList() ");
		return mybatis.selectList("QnaDAO.getQnaList", vo);
	}
	//전체 페이지 수 조회
		public int countQna(QnaVO qnaVo) {
			return mybatis.selectOne("QnaDAO.countQna", qnaVo);
		}
}

























