package com.chocobuy.biz.admin;

import java.sql.Date;

public class AdminTradeVO {
	private int trade_seq;
	private int trade_money;
	private Date trade_date;
	private String trade_nick;
	private String trade_title;
	private String trade_content;
	private String trade_area;
	private String trade_img;
	private String trade_category;
	private String trade_buyinfo;
	private String trade_review;
	private int trade_reporting;
	private int trade_hidden;
	
	private int start;
	private int listcnt;
	
	private String searchKeyword;
	
	private int category1;
	private int category2;
	private int category3;
	private int category4;
	private int category5;
	private int category6;
	private int category7;
	private int report1;
	private int report2;
	private int hidden1;
	private int hidden2;
	
	public int getReport1() {
		return report1;
	}
	public void setReport1(int report1) {
		this.report1 = report1;
	}
	public int getReport2() {
		return report2;
	}
	public void setReport2(int report2) {
		this.report2 = report2;
	}
	public int getHidden1() {
		return hidden1;
	}
	public void setHidden1(int hidden1) {
		this.hidden1 = hidden1;
	}
	public int getHidden2() {
		return hidden2;
	}
	public void setHidden2(int hidden2) {
		this.hidden2 = hidden2;
	}
	public int getTrade_hidden() {
		return trade_hidden;
	}
	public void setTrade_hidden(int trade_hidden) {
		this.trade_hidden = trade_hidden;
	}
	public int getTrade_reporting() {
		return trade_reporting;
	}
	public void setTrade_reporting(int trade_reporting) {
		this.trade_reporting = trade_reporting;
	}
	public int getCategory1() {
		return category1;
	}
	public void setCategory1(int category1) {
		this.category1 = category1;
	}
	public int getCategory2() {
		return category2;
	}
	public void setCategory2(int category2) {
		this.category2 = category2;
	}
	public int getCategory3() {
		return category3;
	}
	public void setCategory3(int category3) {
		this.category3 = category3;
	}
	public int getCategory4() {
		return category4;
	}
	public void setCategory4(int category4) {
		this.category4 = category4;
	}
	public int getCategory5() {
		return category5;
	}
	public void setCategory5(int category5) {
		this.category5 = category5;
	}
	public int getCategory6() {
		return category6;
	}
	public void setCategory6(int category6) {
		this.category6 = category6;
	}
	public int getCategory7() {
		return category7;
	}
	public void setCategory7(int category7) {
		this.category7 = category7;
	}
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
	public int getTrade_seq() {
		return trade_seq;
	}
	public void setTrade_seq(int trade_seq) {
		this.trade_seq = trade_seq;
	}
	public int getTrade_money() {
		return trade_money;
	}
	public void setTrade_money(int trade_money) {
		this.trade_money = trade_money;
	}
	public Date getTrade_date() {
		return trade_date;
	}
	public void setTrade_date(Date trade_date) {
		this.trade_date = trade_date;
	}
	public String getTrade_nick() {
		return trade_nick;
	}
	public void setTrade_nick(String trade_nick) {
		this.trade_nick = trade_nick;
	}
	public String getTrade_title() {
		return trade_title;
	}
	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}
	public String getTrade_content() {
		return trade_content;
	}
	public void setTrade_content(String trade_content) {
		this.trade_content = trade_content;
	}
	public String getTrade_area() {
		return trade_area;
	}
	public void setTrade_area(String trade_area) {
		this.trade_area = trade_area;
	}
	public String getTrade_img() {
		return trade_img;
	}
	public void setTrade_img(String trade_img) {
		this.trade_img = trade_img;
	}
	public String getTrade_category() {
		return trade_category;
	}
	public void setTrade_category(String trade_category) {
		this.trade_category = trade_category;
	}
	public String getTrade_buyinfo() {
		return trade_buyinfo;
	}
	public void setTrade_buyinfo(String trade_buyinfo) {
		this.trade_buyinfo = trade_buyinfo;
	}
	public String getTrade_review() {
		return trade_review;
	}
	public void setTrade_review(String trade_review) {
		this.trade_review = trade_review;
	}
}
