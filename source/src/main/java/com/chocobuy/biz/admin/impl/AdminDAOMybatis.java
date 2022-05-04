package com.chocobuy.biz.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.admin.AdminChatRoomVO;
import com.chocobuy.biz.admin.AdminInquiryVO;
import com.chocobuy.biz.admin.AdminMsgVO;
import com.chocobuy.biz.admin.AdminPayVO;
import com.chocobuy.biz.admin.AdminServiceVO;
import com.chocobuy.biz.admin.AdminTradeVO;
import com.chocobuy.biz.admin.AdminUserVO;

@Repository
public class AdminDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminUserVO> getAdminUserList(AdminUserVO vo) {
		return mybatis.selectList("AdminDAO.getAdminUserList", vo);
	}
	
	public List<AdminTradeVO> getAdminTradeList(AdminTradeVO vo) {
		return mybatis.selectList("AdminDAO.getAdminTradeList", vo);
	}
	
	public List<AdminPayVO> getAdminPayList(AdminPayVO vo) {
		return mybatis.selectList("AdminDAO.getAdminPayList", vo);
	}
	
	public List<AdminServiceVO> getAdminServiceList(AdminServiceVO vo) {
		return mybatis.selectList("AdminDAO.getAdminServiceList", vo);
	}
	
	public List<AdminInquiryVO> getAdminInquiryList(AdminInquiryVO vo) {
		return mybatis.selectList("AdminDAO.getAdminInquiryList", vo);
	}
	
	public List<AdminChatRoomVO> getChatroomList(AdminChatRoomVO vo) {
		return mybatis.selectList("AdminDAO.getAdminChatRoomList", vo);
	}
	
	public List<AdminMsgVO> getMsgList(AdminMsgVO vo) {
		return mybatis.selectList("AdminDAO.getAdminChatMsgList", vo);
	}
	
	public void insertUser(AdminUserVO vo) {
		mybatis.insert("AdminDAO.insertUser", vo);
	}
	
	public AdminUserVO getUser(AdminUserVO vo) {
		return (AdminUserVO)mybatis.selectOne("AdminDAO.getUser", vo);
	}
	
	public AdminChatRoomVO getChatRoom(AdminChatRoomVO vo) {
		return (AdminChatRoomVO)mybatis.selectOne("AdminDAO.getChatRoom", vo);
	}
	
	public void updateUser(AdminUserVO vo) {
		mybatis.update("AdminDAO.updateUser", vo);
	}
	
	public int countUser(AdminUserVO vo) {
		return mybatis.selectOne("AdminDAO.countUser", vo);
	}
	
	public int countTrade(AdminTradeVO vo) {
		return mybatis.selectOne("AdminDAO.countTrade", vo);
	}

	public int countPay(AdminPayVO vo) {
		return mybatis.selectOne("AdminDAO.countPay", vo);
	}

	public int countService(AdminServiceVO vo) {
		return mybatis.selectOne("AdminDAO.countService", vo);
	}
	
	public int countChatRoom(AdminChatRoomVO vo) {
		return mybatis.selectOne("AdminDAO.countChatRoom", vo);
	}

	public int countInquiry(AdminInquiryVO vo) {
		return mybatis.selectOne("AdminDAO.countInquiry", vo);
	}
	
	public void hideTrade(AdminTradeVO vo) {
		mybatis.update("AdminDAO.hideTrade", vo);
	}
	
	public void showTrade(AdminTradeVO vo) {
		mybatis.update("AdminDAO.showTrade", vo);
	}
	
	public void hideService(AdminServiceVO vo) {
		mybatis.update("AdminDAO.hideService", vo);
	}
	
	public void showService(AdminServiceVO vo) {
		mybatis.update("AdminDAO.showService", vo);
	}
	
	public void hideInquiry(AdminInquiryVO vo) {
		mybatis.update("AdminDAO.hideInquiry", vo);
	}
	
	public void showInquiry(AdminInquiryVO vo) {
		mybatis.update("AdminDAO.showInquiry", vo);
	}
	
	public void doneInquiry(AdminInquiryVO vo) {
		mybatis.update("AdminDAO.doneInquiry", vo);
	}
	
	public void undoneInquiry(AdminInquiryVO vo) {
		mybatis.update("AdminDAO.undoneInquiry", vo);
	}
}
