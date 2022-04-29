package com.chocobuy.biz.inquiry;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class InqVO {
	private int inq_num;			// 문의글번호(=seq)
	private String inq_title;		// 문의제목
	private String inq_nickname;	// 닉네임(= 유저 닉네임)
	private String inq_content;			// 문의한 내용
	private Date inq_date;			// 문의한 날짜
//	private int inq_cnt;				// 조회수
	
	private String inq_searchCondition;	// 문의검색창
	private String inq_searchKeyword;	// 문의키워드
	
	private MultipartFile inq_uploadFile;	// 문의 업로드파일
	private String inq_filename;			// 문의 업로드파일 이름
	
	private int start;				// 페이지 시작
	private int listcnt;			// 리스트 갯수 
	
	
	public int getInq_num() {
		return inq_num;
	}
	public void setInq_num(int inq_num) {
		this.inq_num = inq_num;
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
	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}
//	public int getInq_cnt() {
//		return inq_cnt;
//	}
//	public void setInq_cnt(int inq_cnt) {
//		this.inq_cnt = inq_cnt;
//	}
	public String getInq_searchCondition() {
		return inq_searchCondition;
	}
	public void setInq_searchCondition(String inq_searchCondition) {
		this.inq_searchCondition = inq_searchCondition;
	}
	public String getInq_searchKeyword() {
		return inq_searchKeyword;
	}
	public void setInq_searchKeyword(String inq_searchKeyword) {
		this.inq_searchKeyword = inq_searchKeyword;
	}
	public MultipartFile getInq_uploadFile() {
		return inq_uploadFile;
	}
	public void setInq_uploadFile(MultipartFile inq_uploadFile) {
		this.inq_uploadFile = inq_uploadFile;
	}
	public String getInq_filename() {
		return inq_filename;
	}
	public void setInq_filename(String inq_filename) {
		this.inq_filename = inq_filename;
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
		return "InqVO [inq_num=" + inq_num + ", inq_title=" + inq_title + ", inq_nickname=" + inq_nickname + ", inq_content=" + inq_content + ", inq_date="
				+ inq_date + ", inq_searchCondition=" + inq_searchCondition + ", inq_searchKeyword=" + inq_searchKeyword
				+ ", inq_uploadFile=" + inq_uploadFile + "]";
	}

	

	
	
//	private int seq;			//문의글번호(=seq)
//	private String title;		//문의제목
//	private String writer;	// 닉네임(= 유저 닉네임)
//	private String content;			// 문의한 내용
//	private Date regdate;			// 문의한 날
//	private int cnt;
//	
//	private String searchCondition;
//	private String searchKeyword;
//	
//	private MultipartFile uploadFile;
//	private String filename;
//	
//	private int start;
//	private int listcnt;
}
