package com.chocobuy.biz.qna;

public class QnaVO {
	
	private int qna_seq;
	private String qna_title;
//	private String qna_date;
	private String qna_content;
//	private int qna_cnt;
	private String qna_writer;
	
	private String qna_searchCondition;	// 문의검색창
	private String qna_searchKeyword;	// 문의키워드
	
	private int start;				// 페이지 시작
	private int listcnt;			// 리스트 갯수 
	
	public int getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
//	public String getQna_date() {
//		return qna_date;
//	}
//	public void setQna_date(String qna_date) {
//		this.qna_date = qna_date;
//	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
//	public int getQna_cnt() {
//		return qna_cnt;
//	}
//	public void setQna_cnt(int qna_cnt) {
//		this.qna_cnt = qna_cnt;
//	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	
	public String getQna_searchCondition() {
		return qna_searchCondition;
	}
	public void setQna_searchCondition(String qna_searchCondition) {
		this.qna_searchCondition = qna_searchCondition;
	}
	public String getQna_searchKeyword() {
		return qna_searchKeyword;
	}
	public void setQna_searchKeyword(String qna_searchKeyword) {
		this.qna_searchKeyword = qna_searchKeyword;
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
		return "QnaVO [qna_seq=" + qna_seq + ", qna_title=" + 
				qna_title + ", qna_content="+ qna_content + ", qna_writer="+ qna_writer +
				", qna_searchCondition=" + qna_searchCondition + ", "
				+ "qna_searchKeyword=" + qna_searchKeyword + "]";
	}
	

}
