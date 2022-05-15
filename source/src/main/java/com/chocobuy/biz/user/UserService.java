package com.chocobuy.biz.user;

import java.util.Date;
import java.util.Map;

public interface UserService {
	void autoLogin(Map<String,Object> map); //특정 회원의 세션아이디와 쿠키 유효기간을 저장
	void autoLogin(String sessionId, Date limitDate, String user_uuid); //특정 회원의 세션아이디와 쿠키 유효기간을 저장
	UserVO selectSession(String sessionId);//세션아이디로 회원조회
	void insertUser(UserVO vo);
	void deleteUser(String user_tel);
	UserVO getUser(UserVO vo);
	UserVO getUserUuid(UserVO vo);
	int UserNull(String user_tel);
	int userTelCheck(String user_tel);
	int nickDupCheck(String user_nick);
	
	
	
	//
	int updateUser(UserVO vo);
	int nameCheck(String sm_name);
	UserVO getMypageUser(UserVO vo);
	int mypageNameCheck(String sm_name);
	int updateMypageUser(UserVO vo); 
	void updateMypageUseArea(UserVO vo);
	int mypageNumCheck(String sm_num); 
	UserVO getUserInfo(UserVO vo);
	String getMypageTradeNick(UserVO vo);
}

