package com.chocobuy.biz.service;

public class ServiceVO {
	
	private int service_seq;
	private String service_title;
	private String service_date;
	private String service_content;
	private int service_cnt;
	private String service_writer;
	private String service_edit;
	private String service_delete;
	private String service_header;
	
	private String service_searchCondition;	// 문의검색창
	private String service_searchKeyword;	// 문의키워드
	
	private int start;				// 페이지 시작
	private int listcnt;			// 리스트 갯수 
	
	
	public int getService_seq() {
		return service_seq;
	}
	public void setService_seq(int service_seq) {
		this.service_seq = service_seq;
	}
	public String getService_title() {
		return service_title;
	}
	public void setService_title(String service_title) {
		this.service_title = service_title;
	}
	public String getService_date() {
		return service_date;
	}
	public void setService_date(String service_date) {
		this.service_date = service_date;
	}
	public String getService_content() {
		return service_content;
	}
	public void setService_content(String service_content) {
		this.service_content = service_content;
	}
	public int getService_cnt() {
		return service_cnt;
	}
	public void setService_cnt(int service_cnt) {
		this.service_cnt = service_cnt;
	}
	public String getService_writer() {
		return service_writer;
	}
	public void setService_writer(String service_writer) {
		this.service_writer = service_writer;
	}
	public String getService_edit() {
		return service_edit;
	}
	public void setService_edit(String service_edit) {
		this.service_edit = service_edit;
	}
	public String getService_delete() {
		return service_delete;
	}
	public void setService_delete(String service_delete) {
		this.service_delete = service_delete;
	}
	public String getService_header() {
		return service_header;
	}
	public void setService_header(String service_header) {
		this.service_header = service_header;
	}
	public String getService_searchCondition() {
		return service_searchCondition;
	}
	public void setService_searchCondition(String service_searchCondition) {
		this.service_searchCondition = service_searchCondition;
	}
	public String getService_searchKeyword() {
		return service_searchKeyword;
	}
	public void setService_searchKeyword(String service_searchKeyword) {
		this.service_searchKeyword = service_searchKeyword;
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
	
	@Override
	public String toString() {
		return "ServiceVO [service_seq=" + service_seq + ", service_title=" + 
				service_title + ", service_date=" + service_date + ", service_content="+ 
				service_content + ", service_cnt="+ service_cnt + ", service_writer="+ service_writer +
				", service_searchCondition=" + service_searchCondition + ", "
				+ "service_searchKeyword=" + service_searchKeyword + "]";
	}
	
	

}
