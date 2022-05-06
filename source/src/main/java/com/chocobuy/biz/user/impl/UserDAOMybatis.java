package com.chocobuy.biz.user.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chocobuy.biz.user.UserVO;

@Repository
public class UserDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// insertUser
	public void insertUser(UserVO vo) {
		System.out.println("Mybatis >> insertUser");
		mybatis.insert("UserDAO.insertUser", vo);
	}
	public void deleteUser(String user_tel) {
		System.out.println("Mybatis >> deleteUser");
		mybatis.delete("UserDAO.deleteUser", user_tel);
	}
	public UserVO getUser(UserVO vo) {
		System.out.println("Mybatis >> getUser");
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
	}
	public UserVO getUserUuid(UserVO vo) {
		System.out.println("Mybatis >> getUserUuid");
		return (UserVO) mybatis.selectOne("UserDAO.getUserUuid", vo);
	}
	public int nickDupCheck(String user_nick) {
		System.out.println("Mybatis >> nickDupCheck");
		return mybatis.selectOne("UserDAO.nickDupCheck", user_nick);
	}
	public int UserNull(String user_tel) {
		System.out.println("Mybatis >> UserNull()");
		return mybatis.selectOne("UserDAO.UserNull", user_tel);
	}
	public int userTelCheck(String user_tel) {
		System.out.println("Mybatis >> userTelCheck()");
		return mybatis.selectOne("UserDAO.userTelCheck", user_tel);
	}

	
	//autoLogin(map);
	public void autoLogin(Map<String, Object> map){
		System.out.println("Mybatis >> autoLogin");
		mybatis.update("UserDAO.autoLogin", map);
	}
	
	public UserVO selectSession(String sessionId) {
		System.out.println("Mybatis >> selectSession");
		return (UserVO) mybatis.selectList("UserDAO.selectSession", sessionId);
	}

	public void autoLogin(String sessionId, Date limitDate, String user_uuid) {
		System.out.println("Mybatis >> autoLogin(limitDate)");
		mybatis.update("UserDAO.autoLogin");
	}
		
	
//-------------------------------------------------------------------------------------------
	
	// 중복 방지를 위해 해당 기능  updateMypageUser() 로
	// 메서드 추하가함.  추후 상호간 미 사용시 해당 메서드 삭제요망 
	public int updateUser(UserVO vo) {
		System.out.println("===> JDBC로 updateUser() 기능 처리");
		return mybatis.update("UserDAO.updateUser", vo);
	}
	
	public int deleteUser(UserVO vo) {
		System.out.println("===> JDBC로 deleteUser() 기능 처리");
		return mybatis.delete("UserDAO.deleteUser", vo);
	}
	public UserVO getMypageUser(UserVO vo) {
		System.out.println("===> Mybatis로 getMypageUser() 기능 처리");
		return (UserVO) mybatis.selectOne("UserDAO.getMypageUser", vo);
	}
	public int updateMypageUser(UserVO vo) {
		System.out.println("===> JDBC로 updateMypageUser() 기능 처리");
		return mybatis.update("UserDAO.updateMypageUser", vo);
	}
	
	
	// 핸드폰 번호 중복 체크
	public int mypageNumCheck(String sm_num) {
		System.out.println("===> JDBC nameCheck() 기능 처리");
		System.out.println(sm_num);
		return mybatis.selectOne("UserDAO.mypageNumCheck", sm_num);
	}

	// 닉네임 중복 체크
	public int mypageNameCheck(String sm_name) {
		System.out.println("===> JDBC mypageNameCheck() 기능 처리");
		System.out.println(sm_name);
		return mybatis.selectOne("UserDAO.mypageNameCheck", sm_name);
	}

	// 주소 검색후 저장 
	public int updateMypageUseArea(UserVO vo) {
		System.out.println("===> JDBC로 updateMypageUser() 기능 처리");
		return mybatis.update("UserDAO.updateMypageUseArea", vo);
	}
	
	public UserVO getUserInfo(UserVO vo) {
		System.out.println("===> Mybatis로 getUserInfo() 기능 처리");
		return (UserVO) mybatis.selectOne("UserDAO.getUserInfo", vo);
	}
	

	
	public int nameCheck(String sm_name) {
		System.out.println(sm_name);
		return mybatis.selectOne("UserDAO.nameCheck", sm_name);
	}

	// 리뷰 nick 작성권한 체크 
	public String getMypageTradeNick(UserVO vo) {
		System.out.println("===> JDBC getMypageTradeNick() 기능 처리");
		return mybatis.selectOne("UserDAO.getMypageTradeNick", vo);
	}
}