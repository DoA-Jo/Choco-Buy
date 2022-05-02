package com.chocobuy.biz.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.chat.AppVO;
import com.chocobuy.biz.chat.ChatRoomVO;
import com.chocobuy.biz.chat.MsgVO;
import com.chocobuy.biz.trade.TradeVO;

@Repository
public class ChatDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void createChatRoom(ChatRoomVO cvo) {
		mybatis.insert("ChatDAO.createChatRoom",cvo);
	}
	
	public void updateChatRoom(AppVO avo) {
		System.out.println("===>JDBC로 updateChatRoom() 기능처리");
		mybatis.update("ChatDAO.updateChatRoom", avo);
	}
	
	public int createApp(AppVO avo) {
		updateChatRoom(avo) ;
		return mybatis.insert("ChatDAO.createApp",avo);
	}
	
	public void updateApp(AppVO avo) {
		System.out.println("===>JDBC로 updateApp() 기능처리");
		mybatis.update("ChatDAO.updateApp", avo);
	}
	
	public AppVO getApp(AppVO avo) {
		System.out.println("ChatDAOMybatis getApp()메소드");
		return mybatis.selectOne("ChatDAO.getApp",avo);
	}
	
	public ChatRoomVO getChatRoom(ChatRoomVO cvo) {
		System.out.println("ChatDAOMybatis getChatRoom()메소드");
		return (ChatRoomVO) mybatis.selectOne("ChatDAO.getChatRoom",cvo);
	}
	
	public List<ChatRoomVO> getMyChatRoom(ChatRoomVO cvo) {
		System.out.println("ChatDAOMybatis getMyChatRoom()메소드");
		return mybatis.selectList("ChatDAO.getMyChatRoom",cvo);
	}
	
	public int countRoom(ChatRoomVO cvo) {
		return mybatis.selectOne("ChatDAO.countRoom",cvo);
	}
	
	public int insertMsg(MsgVO cvo) {
		System.out.println("dao클래스: "+cvo.toString());
		return mybatis.insert("ChatDAO.insertMsg",cvo);
	}
	
	public List<MsgVO> getMsgList(MsgVO cvo) {
		System.out.println("ChatDAOMybatis getMsgList()메소드");
		return mybatis.selectList("ChatDAO.getMsgList",cvo);
	}
	
	public int getRoomSeq(ChatRoomVO cvo) {
		return mybatis.selectOne("ChatDAO.getRoomSeq",cvo);
	}

	public int updateReport(ChatRoomVO cvo) {
		System.out.println("===>JDBC로 updateReport() 기능처리");
		return mybatis.update("ChatDAO.updateReport", cvo);
	}
	
	public int countApp(AppVO avo) {
		return mybatis.selectOne("ChatDAO.countApp",avo);
	}

}
