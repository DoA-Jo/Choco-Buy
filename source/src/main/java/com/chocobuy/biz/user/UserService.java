package com.chocobuy.biz.user;

import java.util.List;

public interface UserService {
	
	// CRUD 기능의 메서드 구현
	// 회원등록
	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	List<UserVO> getUserList(UserVO vo);
	void updateUserArea(UserVO vo);
	void updateUserNick(UserVO vo);
	int nickDupCheck(String user_nick);
	int userTelCheck(String user_tel);
	
	//
	int updateUser(UserVO vo);

	int deleteUser(UserVO vo);

	UserVO getMypageUser(UserVO vo);
	int mypageNameCheck(String sm_name);
	
	int updateMypageUser(UserVO vo); 
	void updateMypageUseArea(UserVO vo);
	
	int mypageNumCheck(String sm_num); 

}

