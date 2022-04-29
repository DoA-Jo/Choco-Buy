package com.chocobuy.biz.admin;

import java.sql.Date;

public class AdminInquiryVO {
	private int inq_num;
	private int inq_hiddenCK;
	private int inq_completeCK;
	private String inq_title;
	private String inq_nickname;
	private String inq_content;
	private String inq_filename;
	
	private int start;
	private int listcnt;
	
	private String searchKeyword;
	
	private int done0;
	private int done1;
	private int display0;
	private int display1;
	
	public int getDone0() {
		return done0;
	}
	public void setDone0(int done0) {
		this.done0 = done0;
	}
	public int getDone1() {
		return done1;
	}
	public void setDone1(int done1) {
		this.done1 = done1;
	}
	public int getDisplay0() {
		return display0;
	}
	public void setDisplay0(int display0) {
		this.display0 = display0;
	}
	public int getDisplay1() {
		return display1;
	}
	public void setDisplay1(int display1) {
		this.display1 = display1;
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
	private Date inq_date;
	
	
	public int getInq_num() {
		return inq_num;
	}
	public void setInq_num(int inq_num) {
		this.inq_num = inq_num;
	}
	public int getInq_hiddenCK() {
		return inq_hiddenCK;
	}
	public void setInq_hiddenCK(int inq_hiddenCK) {
		this.inq_hiddenCK = inq_hiddenCK;
	}
	public int getInq_completeCK() {
		return inq_completeCK;
	}
	public void setInq_completeCK(int inq_completeCK) {
		this.inq_completeCK = inq_completeCK;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_nickname() {
		return inq_nickname;
	}
	public void setInq_nickname(String inq_nickname) {
		this.inq_nickname = inq_nickname;
	}
	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public String getInq_filename() {
		return inq_filename;
	}
	public void setInq_filename(String inq_filename) {
		this.inq_filename = inq_filename;
	}
	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}
}
