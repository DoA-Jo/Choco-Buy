package com.chocobuy.biz.user;

// VO(value Object)
public class UserVO {
	private String user_uuid;
	private String user_tel;
	private String user_area;
	private String user_nick;
	
	private String user_siNm;
	private String user_sggNm;
	private String user_emdNm;
	private String user_profileImg;
	private int user_role;
	
	public String getUser_siNm() {
		return user_siNm;
	}
	public void setUser_siNm(String user_siNm) {
		this.user_siNm = user_siNm;
	}
	public String getUser_sggNm() {
		return user_sggNm;
	}
	public void setUser_sggNm(String user_sggNm) {
		this.user_sggNm = user_sggNm;
	}
	public String getUser_emdNm() {
		return user_emdNm;
	}
	public void setUser_emdNm(String user_emdNm) {
		this.user_emdNm = user_emdNm;
	}
	public String getUser_uuid() {
		return user_uuid;
	}
	public void setUser_uuid(String user_uuid) {
		this.user_uuid = user_uuid;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_area() {
		return user_area;
	}
	public void setUser_area(String user_area) {
		this.user_area = user_area;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_profileImg() {
		return user_profileImg;
	}
	public void setUser_profileImg(String user_profileImg) {
		this.user_profileImg = user_profileImg;
	}
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_uuid=" + user_uuid + ", user_tel=" + user_tel + ", user_area=" + user_area + ", user_nick="
				+ user_nick + ", user_siNm=" + user_siNm + ", user_sggNm=" + user_sggNm + ", user_emdNm=" + user_emdNm
				+ ", user_profileImg=" + user_profileImg + ", user_role=" + user_role + "]";
	}
}
