package com.chocobuy.biz.chat;

public class MsgVO {
	private int msg_num;
	private int chatroom_seq;
	private String trade_title;
	private String user_uuid;
	private String user_nick;
	private String msg_content;
	private String msg_date;
	
	public int getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}
	public int getChatroom_seq() {
		return chatroom_seq;
	}
	public void setChatroom_seq(int chatroom_seq) {
		this.chatroom_seq = chatroom_seq;
	}
	public String getTrade_title() {
		return trade_title;
	}
	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}
	public String getUser_uuid() {
		return user_uuid;
	}
	public void setUser_uuid(String user_uuid) {
		this.user_uuid = user_uuid;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	
	@Override
	public String toString() {
		return "MsgVO [msg_num=" + msg_num + ", chatroom_seq=" + chatroom_seq + ", trade_title=" + trade_title
				+ ", user_uuid=" + user_uuid + ", user_nick=" + user_nick + ", msg_content=" + msg_content
				+ ", msg_date=" + msg_date + "]";
	}
	
}
