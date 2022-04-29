package com.chocobuy.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chocobuy.biz.chat.AppVO;
import com.chocobuy.biz.chat.ChatRoomVO;
import com.chocobuy.biz.chat.ChatService;
import com.chocobuy.biz.chat.MsgVO;
import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;

@Controller
public class ChatController {
	//인터페이스를 사용한 객체 만들기 = 인터페이스를 상속받은 자식 객체가 자동으로 주입된다.
	@Autowired
	private TradeService tradeService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private UserService userService;

	//참가자 채팅 접속
	@RequestMapping(value="/Chat/Chat", method= RequestMethod.GET)
	public String getTradeChat(TradeVO tvo, ChatRoomVO cvo, Model model, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("UserInfo");
		tvo = tradeService.getTrade(tvo);
		if(uvo.getUser_uuid().equals(tvo.getTrade_uuid())) {
			return "redirect:/Chat/ChatMyRoom?trade_seq="+tvo.getTrade_seq();
		}else {
			cvo.setTrade_seq(tvo.getTrade_seq());
			cvo.setUser_uuid(uvo.getUser_uuid());
			cvo.setTrade_uuid(tvo.getTrade_uuid());
			cvo.setTrade_title(tvo.getTrade_title());
			cvo.setTrade_nick(tvo.getTrade_nick());
			cvo.setTrade_area(tvo.getTrade_area());
			cvo.setUser_nick(uvo.getUser_nick());
			if(chatService.countRoom(cvo) <= 0 ) chatService.createChatRoom(cvo);
			int chatroom_seq = chatService.getRoomSeq(cvo);
			cvo.setChatroom_seq(chatroom_seq);
			model.addAttribute("userUser", uvo);
			model.addAttribute("tradeUser", tvo);
			model.addAttribute("chatRoom", chatService.getChatRoom(cvo));
			return "/Chat/Chat";
		}
	}
	
	//등록자 채팅접속
	@RequestMapping(value="/Trade/TradeSel", method= RequestMethod.GET)
	public String getTradeChat(ChatRoomVO cvo, Model model, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("UserInfo");
		model.addAttribute("userUser", uvo);
		model.addAttribute("chatRoom", chatService.getChatRoom(cvo));
		return "/Chat/Chat";
	}
	
	@RequestMapping("/Chat/MsgInsert")
	@ResponseBody
	public int msgInsert(MsgVO cvo) {
		System.out.println(cvo.toString());
		return chatService.insertMsg(cvo);
	}
	
	@RequestMapping("/Chat/ChatMyRoom")
	public String chatMyRoom(ChatRoomVO cvo, Model model) {
		model.addAttribute("myRoomList", chatService.getMyChatRoom(cvo));
		System.out.println(cvo);
		return "/Chat/ChatMyRoom";
	}
	
	
	@RequestMapping("/Chat/MsgList")
	@ResponseBody
	public Object getMsgList(MsgVO cvo, Model model) {
		List<MsgVO> msgList = chatService.getMsgList(cvo);
		Map<String, Object> retVal = new HashMap<String, Object>();
        retVal.put("msgList", msgList); 
        retVal.put("code", "OK");
        return retVal;
	}
	
	@RequestMapping(value="/Chat/App", method=RequestMethod.POST)
	public void App(AppVO avo, Model model) {
		System.out.println("avo");
	}
	
}
