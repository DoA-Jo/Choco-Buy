package com.chocobuy.biz.admin;

import java.sql.Date;

public class AdminPayVO {
	private int pay_num;
	private int pay_amount;
	private Date pay_date;
	private String pay_ordernum;
	private String pay_sell;
	private String pay_buy;
	private String pay_category;
	private String pay_method;
	
	private int start;
	private int listcnt;
	
	private String searchKeyword;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
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
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
}
