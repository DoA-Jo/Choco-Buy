package com.chocobuy.biz.inquiry;

import java.sql.Date;

public class InqReplyVO {
	private int inqRe_bno;
	private int inqRe_rno;
	private String inqRe_content;
	private String inqRe_nickname;
	private Date inqRe_date;
	
	
	public int getInqRe_bno() {
		return inqRe_bno;
	}
	public void setInqRe_bno(int inqRe_bno) {
		this.inqRe_bno = inqRe_bno;
	}
	
	public int getInqRe_rno() {
		return inqRe_rno;
	}
	public void setInqRe_rno(int inqRe_rno) {
		this.inqRe_rno = inqRe_rno;
	}
	
	public String getInqRe_content() {
		return inqRe_content;
	}
	public void setInqRe_content(String inqRe_content) {
		this.inqRe_content = inqRe_content;
	}
	
	public String getInqRe_nickname() {
		return inqRe_nickname;
	}
	public void setInqRe_nickname(String inqRe_nickname) {
		this.inqRe_nickname = inqRe_nickname;
	}
	
	public Date getInqRe_date() {
		return inqRe_date;
	}
	public void setInqRe_date(Date inqRe_date) {
		this.inqRe_date = inqRe_date;
	}




	
	
	
	
	@Override
	public String toString() {
		return "InqReplyVO [inqRe_bno=" + inqRe_bno + ", inqRe_rno=" + inqRe_rno + ", inqRe_content=" + inqRe_content + ", inqRe_nickname=" + inqRe_nickname + ", inqRe_date="
				+ inqRe_date + "]";
	}
}
