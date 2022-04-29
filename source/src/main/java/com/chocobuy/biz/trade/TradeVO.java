package com.chocobuy.biz.trade;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TradeVO {
	
	private int trade_seq;//	글번호
	private String trade_nick;//	닉네임
	private String trade_title;//	글 제목
	private int trade_money;//	금액
	private String trade_content;//	글 내용
	private String trade_area;//	거래 지역
	private String trade_img;//	이미지 이름
	private String trade_category;//	카테고리
	private String trade_buyinfo;//	구매자정보
	private String trade_review;//	리뷰
	private Date trade_date;//	날짜
	private int trade_reporting;// 유저 신고
	private int trade_stop; //숨김 처리 유저
	private MultipartFile trade_uploadImg;//
	private String trade_imgpath;//이미지 저장 경로
	private String trade_uuid;
	
	private String searchMypageCondition;  // My page 글 검색 카테고리 커럼에 등록 필요 없음
	private String searchMypageKeyword;    // My page 글검색 입력  컬럼에 등록 필요 없음
	private int start;
	private int listcnt;
	
	public String getTrade_uuid() {
		return trade_uuid;
	}
	public void setTrade_uuid(String trade_uuid) {
		this.trade_uuid = trade_uuid;
	}
	
	public String getTrade_imgpath() {
		return trade_imgpath;
	}
	public void setTrade_imgpath(String trade_imgpath) {
		this.trade_imgpath = trade_imgpath;
	}
	public int getTrade_stop() {
		return trade_stop;
	}
	public String getSearchMypageCondition() {
		return searchMypageCondition;
	}
	public void setSearchMypageCondition(String searchMypageCondition) {
		this.searchMypageCondition = searchMypageCondition;
	}
	public String getSearchMypageKeyword() {
		return searchMypageKeyword;
	}
	public void setSearchMypageKeyword(String searchMypageKeyword) {
		this.searchMypageKeyword = searchMypageKeyword;
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
	public MultipartFile getTrade_uploadImg() {
		return trade_uploadImg;
	}
	public void setTrade_uploadImg(MultipartFile trade_uploadImg) {
		this.trade_uploadImg = trade_uploadImg;
	}
	public void setTrade_stop(int trade_stop) {
		this.trade_stop = trade_stop;
	}
	public int getTrade_reporting() {
		return trade_reporting;
	}
	public void setTrade_reporting(int trade_reporting) {
		this.trade_reporting = trade_reporting;
	}
	private String searchCategory;
	
	public String getSearchInput() {
		return searchInput;
	}
	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}
	private String searchInput;

	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public int getTrade_seq() {
		return trade_seq;
	}
	public void setTrade_seq(int trade_seq) {
		this.trade_seq = trade_seq;
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
	public int getTrade_money() {
		return trade_money;
	}
	public void setTrade_money(int trade_money) {
		this.trade_money = trade_money;
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
	public Date getTrade_date() {
		return trade_date;
	}
	public void setTrade_date(Date trade_date) {
		this.trade_date = trade_date;
	}
	
	
	
	
	
}
