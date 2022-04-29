package com.chocobuy.biz.pay.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.pay.PayVO;

@Repository
public class PayDAOmybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// insert
	public void insertPay(PayVO vo) {
		System.out.println("===> Mybatis로 insertPay() 기능 처리");
		mybatis.insert("PayDAO.insertPay",vo);
	}
	// update
	public void updatePay(PayVO vo) {
		System.out.println("===> Mybatis로 updatePay() 기능 처리");
		mybatis.update("PayDAO.updatePay",vo);
	}
	// delete
	public void deletePay(PayVO vo) {
		mybatis.delete("PayDAO.deletePay",vo);
	}
	// get
	public PayVO getPay(PayVO vo) {
		System.out.println("===> Mybatis로 getPay() 기능 처리");
		return (PayVO)mybatis.selectOne("PayDAO.getPay",vo);
	}
	// list
	public List<PayVO> getPayList(PayVO vo) {
		System.out.println("===> Mybatis로 getPayList() 기능 처리");
		return mybatis.selectList("PayDAO.getPayList",vo);
	}
	
}
