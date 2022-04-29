package com.chocobuy.biz.chat;

public class AppVO {
	private int	app_seq;
	private int chatroom_seq;
	private String app_time;
	private String app_add;
	private String app_price;
	private String app_create;
	
	public int getApp_seq() {
		return app_seq;
	}
	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}
	public int getChatroom_seq() {
		return chatroom_seq;
	}
	public void setChatroom_seq(int chatroom_seq) {
		this.chatroom_seq = chatroom_seq;
	}
	public String getApp_time() {
		return app_time;
	}
	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}
	public String getApp_add() {
		return app_add;
	}
	public void setApp_add(String app_add) {
		this.app_add = app_add;
	}
	public String getApp_price() {
		return app_price;
	}
	public void setApp_price(String app_price) {
		this.app_price = app_price;
	}
	public String getApp_create() {
		return app_create;
	}
	public void setApp_create(String app_create) {
		this.app_create = app_create;
	}
	
	@Override
	public String toString() {
		return "AppVO [app_seq=" + app_seq + ", chatroom_seq=" + chatroom_seq + ", app_time=" + app_time + ", app_add="
				+ app_add + ", app_price=" + app_price + ", app_create=" + app_create + "]";
	}
	
}
