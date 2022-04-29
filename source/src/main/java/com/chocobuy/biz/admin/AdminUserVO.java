package com.chocobuy.biz.admin;

public class AdminUserVO {
	private int user_role;
	private String user_uuid;
	private String user_tel;
	private String user_nick;
	private String user_siNm;
	private String user_sggNm;
	private String user_emdNm;
	private String user_profileImg;
	
	private int start;
	private int listcnt;
	
	private String searchKeyword;
	
	private int role;
	private int role0;
	private int role1;
	private int role2;
	private int role100;
	
	
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public int getRole0() {
		return role0;
	}
	public void setRole0(int role0) {
		this.role0 = role0;
	}
	public int getRole1() {
		return role1;
	}
	public void setRole1(int role1) {
		this.role1 = role1;
	}
	public int getRole2() {
		return role2;
	}
	public void setRole2(int role2) {
		this.role2 = role2;
	}
	public int getRole100() {
		return role100;
	}
	public void setRole100(int role100) {
		this.role100 = role100;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
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
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
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
	public String getUser_profileImg() {
		return user_profileImg;
	}
	public void setUser_profileImg(String user_profileImg) {
		this.user_profileImg = user_profileImg;
	}
}
