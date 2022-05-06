package com.chocobuy.biz.user;

import java.util.List;
import java.util.Date;

public interface UserService {
	
	void autoLogin(String sessionId,Date limitDate,String id); //특정 회원의 세션아이디와 쿠키 유효기간을 저장
	UserVO selectSession(String sessionId);//세션아이디로 회원조회
	
	// CRUD 기능의 메서드 구현
	// 회원등록
	UserVO getUser(UserVO vo);
	UserVO getUserUuid(UserVO vo);
	List<UserVO> getUserList(UserVO vo);
	void insertUser(UserVO vo);
	void updateUserArea(UserVO vo);
	void updateUserNick(UserVO vo);
	int nickDupCheck(String user_nick);
	int userTelCheck(String user_tel);
	
	//
	int updateUser(UserVO vo);
	int nameCheck(String sm_name);

	int deleteUser(UserVO vo);

	UserVO getMypageUser(UserVO vo);
	int mypageNameCheck(String sm_name);
	
	int updateMypageUser(UserVO vo); 
	void updateMypageUseArea(UserVO vo);
	
	int mypageNumCheck(String sm_num); 

	UserVO getUserInfo(UserVO vo);
	
	String getMypageTradeNick(UserVO vo);
}

