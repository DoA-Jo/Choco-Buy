package com.chocobuy.biz.chat;

import java.util.List;

public interface ChatService {
	void createChatRoom(ChatRoomVO cvo);	
	ChatRoomVO getChatRoom(ChatRoomVO cvo);
	int countRoom(ChatRoomVO cvo);
	int insertMsg(MsgVO cvo);
	int getRoomSeq(ChatRoomVO cvo);
	List<MsgVO> getMsgList(MsgVO cvo);
	List<ChatRoomVO> getMyChatRoom(ChatRoomVO cvo);
	
}
