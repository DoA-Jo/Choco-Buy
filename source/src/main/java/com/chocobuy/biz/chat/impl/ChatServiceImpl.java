package com.chocobuy.biz.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.chat.AppVO;
import com.chocobuy.biz.chat.ChatRoomVO;
import com.chocobuy.biz.chat.ChatService;
import com.chocobuy.biz.chat.MsgVO;
import com.chocobuy.biz.trade.TradeVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDAOMybatis chatDAO;
	
	@Override
	public void createChatRoom(ChatRoomVO cvo) {
		chatDAO.createChatRoom(cvo);
	}


	@Override
	public ChatRoomVO getChatRoom(ChatRoomVO cvo) {
		System.out.println("ChatServiceImpl getChatRoom()메소드");
		return chatDAO.getChatRoom(cvo);
	}


	@Override
	public int countRoom(ChatRoomVO cvo) {
		return chatDAO.countRoom(cvo);
	}


	@Override
	public int insertMsg(MsgVO cvo) {
		System.out.println("impl클래스: "+cvo.toString());
		return chatDAO.insertMsg(cvo);
	}


	@Override
	public List<MsgVO> getMsgList(MsgVO cvo) {
		return chatDAO.getMsgList(cvo);
	}


	@Override
	public List<ChatRoomVO> getMyChatRoom(ChatRoomVO cvo) {
		return chatDAO.getMyChatRoom(cvo);
	}


	@Override
	public int getRoomSeq(ChatRoomVO cvo) {
		return chatDAO.getRoomSeq(cvo);
	}


	@Override
	public void updateChatRoom(AppVO avo) {
		chatDAO.updateChatRoom(avo);
	}


	@Override
	public int createApp(AppVO avo) {
		return chatDAO.createApp(avo);
	}


	@Override
	public int updateApp(AppVO avo) {
		return chatDAO.updateApp(avo);
	}


	@Override
	public AppVO getApp(AppVO avo) {
		return chatDAO.getApp(avo);
	}


	@Override
	public int updateReport(ChatRoomVO cvo) {
		return chatDAO.updateReport(cvo);
	}


	@Override
	public int countApp(AppVO avo) {
		return chatDAO.countApp(avo);
		
	}


	@Override
	public int countMyRoom(ChatRoomVO cvo) {
		return chatDAO.countMyRoom(cvo);
	}

}
