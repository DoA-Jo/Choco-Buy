package com.chocobuy.biz.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface UserService {
	// ->autoLogin 메서드에서 매개 값을 UserVO로 받지않고 Map으로 받는 이유는
	// 사용자가 직접 세션 아이디값과 자동로그인 만료날짜를 보내주는 것이 아니기때문에 
	// UserVO에는 sessionId값과 limitDate값이 들어있지 않을것입니다. 
	// 그렇기 때문에 개발자가 직접 두 값과 로그인한 회원의 아이디값을 LoginService에게 보내주어 map으로 묶어준뒤 mapper에게 전달해줘야 합니다.
	//	UserVO selectSession(String sessionId); //세션아이디로 회원조회
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

