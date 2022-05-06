package com.chocobuy.biz.pay;

import java.sql.Date;

public class PayVO {
	private int pay_num;
	private String pay_ordernum;
	private String pay_sell;
	private String pay_buy;
	private String pay_category;
//	2022.05.01 추가 수정 start
	private String pay_date;
//	2022.05.01 추가 수정 end
	private int pay_amount;
	private String pay_method;
	private int chatroom_seq;
	
	public int getChatroom_seq() {
		return chatroom_seq;
	}
	public void setChatroom_seq(int chatroom_seq) {
		this.chatroom_seq = chatroom_seq;
	}
	private String searchCondition;
	private String searchKeyword;
	
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getPay_ordernum() {
		return pay_ordernum;
	}
	public void setPay_ordernum(String pay_ordernum) {
		this.pay_ordernum = pay_ordernum;
	}
	public String getPay_sell() {
		return pay_sell;
	}
	public void setPay_sell(String pay_sell) {
		this.pay_sell = pay_sell;
	}
	public String getPay_buy() {
		return pay_buy;
	}
	public void setPay_buy(String pay_buy) {
		this.pay_buy = pay_buy;
	}
	public String getPay_category() {
		return pay_category;
	}
	public void setPay_category(String pay_category) {
		this.pay_category = pay_category;
	}
//	2022.05.01 추가 수정 start
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
//	2022.05.01 추가 수정 end
	public int getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) { 
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) { 
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "PayVO [pay_num="+pay_num+", pay_ordernum="+pay_ordernum+", pay_sell="+pay_sell+", pay_buy="+pay_buy+", pay_category="+pay_category+", pay_date="+pay_date+", pay_amount="+pay_amount+", pay_method="+pay_method+"]";
	}

}
