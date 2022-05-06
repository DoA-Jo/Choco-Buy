package com.chocobuy.biz.admin;

import java.util.List;

public interface AdminService {
	List<AdminUserVO> getUserList(AdminUserVO vo);
	List<AdminTradeVO> getTradeList(AdminTradeVO vo);
	List<AdminPayVO> getPayList(AdminPayVO vo);
	List<AdminServiceVO> getServiceList(AdminServiceVO vo);
	List<AdminQnaVO> getQnaList(AdminQnaVO vo);
	List<AdminInquiryVO> getInquiryList(AdminInquiryVO vo);
	List<AdminChatRoomVO> getChatRoomList(AdminChatRoomVO vo);
	List<AdminMsgVO> getMsgList(AdminMsgVO vo);
	
	void insertUser(AdminUserVO vo);
	
	AdminUserVO getUser(AdminUserVO vo);
	AdminChatRoomVO getChatRoom(AdminChatRoomVO vo);
	
	void updateUser(AdminUserVO vo);
	
	int countUser(AdminUserVO vo);
	int countTrade(AdminTradeVO vo);
	int countPay(AdminPayVO vo);
	int countService(AdminServiceVO vo);
	int countQna(AdminQnaVO vo);
	int countInquiry(AdminInquiryVO vo);
	int countChatRoom(AdminChatRoomVO vo);
	
	void hideTrade(AdminTradeVO vo);
	void showTrade(AdminTradeVO vo);
	
	void hideService(AdminServiceVO vo);
	void showService(AdminServiceVO vo);
	
	void hideInquiry(AdminInquiryVO vo);
	void showInquiry(AdminInquiryVO vo);
	void doneInquiry(AdminInquiryVO vo);
	void undoneInquiry(AdminInquiryVO vo);
}
