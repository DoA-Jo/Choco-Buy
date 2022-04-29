package com.chocobuy.biz.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.inquiry.InqVO;
import com.chocobuy.biz.service.ServiceVO;

@Repository
public class ServiceDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	//글 등록 
	public void insertService(ServiceVO vo) {
		System.out.println("===>JDBC로 insertService() 기능처리");
		mybatis.insert("ServiceDAO.insertService", vo);
	}
	//글 수정
	public void updateService(ServiceVO vo) {
		System.out.println("===>JDBC로 updateService() 기능처리");
		mybatis.update("ServiceDAO.updateService", vo);
	}
	//글 삭제
	public void deleteService(ServiceVO vo) {
		System.out.println("===>JDBC로 deleteService() 기능처리");
		mybatis.delete("ServiceDAO.deleteService", vo);
	}
	//글 상세 조회
	public ServiceVO getService(ServiceVO vo) {
		System.out.println("===>JDBC로 getService() 기능처리");
//		mybatis.update("ServiceDAO.updateCnt", vo);
		return (ServiceVO) mybatis.selectOne("ServiceDAO.getService", vo);
	}
	
	//글 목록 조회
	public List<ServiceVO> getServiceList(ServiceVO vo) {
		System.out.println("===>JDBC로 getServiceList() ");
		return mybatis.selectList("ServiceDAO.getServiceList", vo);
	}
	
	//전체 페이지 수 조회
		public int countService(ServiceVO vo) {
			return mybatis.selectOne("ServiceDAO.countService", vo);
		}
}

























