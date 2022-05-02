package com.chocobuy.biz.inquiry.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.inquiry.InqVO;
import com.chocobuy.biz.user.UserVO;

@Repository
public class InqDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	//CRUD 기능의 메소드 구현
	//글등록
	public void insertInq(InqVO inqVo) {
		System.out.println("===>JDBC로 insertInq() 기능처리");
		mybatis.insert("InqDAO.insertInq", inqVo);
	}
	
	//글수정
	public void updateInq(InqVO inqVo) {
		System.out.println("===>JDBC로 updateInq() 기능처리");
		mybatis.update("InqDAO.updateInq", inqVo);
	}
	
	//글삭제
	public void deleteInq(InqVO inqVo) {
		System.out.println("===>JDBC로 deleteInq() 기능처리");
		mybatis.delete("InqDAO.deleteInq", inqVo);
	}
	
	//글상세 조회
	public InqVO getInq(InqVO inqVo) {
		System.out.println("===>JDBC로 getInq() 기능처리");
//		mybatis.update("InqDAO.updateInqCnt", inqVo);
		return (InqVO) mybatis.selectOne("InqDAO.getInq", inqVo);
	}
	
	//글목록 조회
	public List<InqVO> getInqList(InqVO inqVo) {
		System.out.println("===>JDBC로 getInqList() ");
		
		return mybatis.selectList("InqDAO.getInqList", inqVo);
	}
	
	//전체 페이지 수 조회
	public int countInq(InqVO inqVo) {
		return mybatis.selectOne("InqDAO.countInq", inqVo);
	}
	
	//관리자 체크
	public UserVO getVo_ck(UserVO vo) {
		System.out.println("===>JDBC로 getInqRole() 기능처리");
		return (UserVO) mybatis.selectOne("InqDAO.getVo_ck", vo);
	}

}
