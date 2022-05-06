package com.chocobuy.biz.admin;

import java.sql.Date;

public class AdminServiceVO {
	private int service_seq;
	private String service_title;
	private Date service_date;
	private String service_content;
	private int service_cnt;
	
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
	public int getService_seq() {
		return service_seq;
	}
	public void setService_seq(int service_seq) {
		this.service_seq = service_seq;
	}
	public int getService_cnt() {
		return service_cnt;
	}
	public void setService_cnt(int service_cnt) {
		this.service_cnt = service_cnt;
	}
	public Date getService_date() {
		return service_date;
	}
	public void setService_date(Date service_date) {
		this.service_date = service_date;
	}
	public String getService_title() {
		return service_title;
	}
	public void setService_title(String service_title) {
		this.service_title = service_title;
	}
	public String getService_content() {
		return service_content;
	}
	public void setService_content(String service_content) {
		this.service_content = service_content;
	}
}
