package com.chocobuy.biz.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.admin.AdminChatRoomVO;
import com.chocobuy.biz.admin.AdminInquiryVO;
import com.chocobuy.biz.admin.AdminMsgVO;
import com.chocobuy.biz.admin.AdminPayVO;
import com.chocobuy.biz.admin.AdminService;
import com.chocobuy.biz.admin.AdminServiceVO;
import com.chocobuy.biz.admin.AdminTradeVO;
import com.chocobuy.biz.admin.AdminUserVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAOMybatis mybatis;
	
	@Override
	public List<AdminUserVO> getUserList(AdminUserVO vo) {
		return mybatis.getAdminUserList(vo);
	}

	@Override
	public List<AdminTradeVO> getTradeList(AdminTradeVO vo) {
		return mybatis.getAdminTradeList(vo);
	}

	@Override
	public List<AdminPayVO> getPayList(AdminPayVO vo) {
		return mybatis.getAdminPayList(vo);
	}

	@Override
	public List<AdminServiceVO> getServiceList(AdminServiceVO vo) {
		return mybatis.getAdminServiceList(vo);
	}

	@Override
	public List<AdminInquiryVO> getInquiryList(AdminInquiryVO vo) {
		return mybatis.getAdminInquiryList(vo);
	}

	@Override
	public List<AdminMsgVO> getMsgList(AdminMsgVO vo) {
		return mybatis.getMsgList(vo);
	}

	@Override
	public void insertUser(AdminUserVO vo) {
		mybatis.insertUser(vo);
	}

	@Override
	public AdminUserVO getUser(AdminUserVO vo) {
		return mybatis.getUser(vo);
	}

	@Override
	public AdminChatRoomVO getChatRoom(AdminChatRoomVO vo) {
		return mybatis.getChatRoom(vo);
	}

	@Override
	public void updateUser(AdminUserVO vo) {
		mybatis.updateUser(vo);
	}

	@Override
	public int countUser(AdminUserVO vo) {
		return mybatis.countUser(vo);
	}

	@Override
	public int countTrade(AdminTradeVO vo) {
		return mybatis.countTrade(vo);
	}

	@Override
	public int countPay(AdminPayVO vo) {
		return mybatis.countPay(vo);
	}

	@Override
	public int countService(AdminServiceVO vo) {
		return mybatis.countService(vo);
	}

	@Override
	public int countInquiry(AdminInquiryVO vo) {
		return mybatis.countInquiry(vo);
	}

	@Override
	public void hideTrade(AdminTradeVO vo) {
		mybatis.hideTrade(vo);
	}

	@Override
	public void showTrade(AdminTradeVO vo) {
		mybatis.showTrade(vo);
	}

	@Override
	public void hideService(AdminServiceVO vo) {
		mybatis.hideService(vo);
	}

	@Override
	public void showService(AdminServiceVO vo) {
		mybatis.showService(vo);
	}

	@Override
	public void hideInquiry(AdminInquiryVO vo) {
		mybatis.hideInquiry(vo);
	}

	@Override
	public void showInquiry(AdminInquiryVO vo) {
		mybatis.showInquiry(vo);
	}

	@Override
	public void doneInquiry(AdminInquiryVO vo) {
		mybatis.doneInquiry(vo);
	}

	@Override
	public void undoneInquiry(AdminInquiryVO vo) {
		mybatis.undoneInquiry(vo);
	}

	@Override
	public List<AdminChatRoomVO> getChatRoomList(AdminChatRoomVO vo) {
		return mybatis.getChatroomList(vo);
	}

	@Override
	public int countChatRoom(AdminChatRoomVO vo) {
		return mybatis.countChatRoom(vo);
	}
}
