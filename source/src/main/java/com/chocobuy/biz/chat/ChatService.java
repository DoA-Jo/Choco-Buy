package com.chocobuy.biz.chat;

import java.util.List;

import com.chocobuy.biz.trade.TradeVO;

public interface ChatService {
	void createChatRoom(ChatRoomVO cvo);
	void updateChatRoom(AppVO avo);
	ChatRoomVO getChatRoom(ChatRoomVO cvo);
	int countRoom(ChatRoomVO cvo);
	int insertMsg(MsgVO cvo);
	int getRoomSeq(ChatRoomVO cvo);
	List<MsgVO> getMsgList(MsgVO cvo);
	List<ChatRoomVO> getMyChatRoom(ChatRoomVO cvo);
	int createApp(AppVO avo);
	AppVO getApp(AppVO avo);
	int updateReport(ChatRoomVO cvo);
	int countApp(AppVO avo);
	int updateApp(AppVO avo);
}
