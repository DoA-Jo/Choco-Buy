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
	
	// ?????? ????????? ?????? ?????? ??????  updateMypageUser() ???
	// ????????? ????????????.  ?????? ????????? ??? ????????? ?????? ????????? ???????????? 
	public int updateUser(UserVO vo) {
		System.out.println("===> JDBC??? updateUser() ?????? ??????");
		return mybatis.update("UserDAO.updateUser", vo);
	}
	
	public int deleteUser(UserVO vo) {
		System.out.println("===> JDBC??? deleteUser() ?????? ??????");
		return mybatis.delete("UserDAO.deleteUser", vo);
	}
	public UserVO getMypageUser(UserVO vo) {
		System.out.println("===> Mybatis??? getMypageUser() ?????? ??????");
		return (UserVO) mybatis.selectOne("UserDAO.getMypageUser", vo);
	}
	public int updateMypageUser(UserVO vo) {
		System.out.println("===> JDBC??? updateMypageUser() ?????? ??????");
		return mybatis.update("UserDAO.updateMypageUser", vo);
	}
	
	
	// ????????? ?????? ?????? ??????
	public int mypageNumCheck(String sm_num) {
		System.out.println("===> JDBC nameCheck() ?????? ??????");
		System.out.println(sm_num);
		return mybatis.selectOne("UserDAO.mypageNumCheck", sm_num);
	}

	// ????????? ?????? ??????
	public int mypageNameCheck(String sm_name) {
		System.out.println("===> JDBC mypageNameCheck() ?????? ??????");
		System.out.println(sm_name);
		return mybatis.selectOne("UserDAO.mypageNameCheck", sm_name);
	}

	// ?????? ????????? ?????? 
	public int updateMypageUseArea(UserVO vo) {
		System.out.println("===> JDBC??? updateMypageUser() ?????? ??????");
		return mybatis.update("UserDAO.updateMypageUseArea", vo);
	}
	
	public UserVO getUserInfo(UserVO vo) {
		System.out.println("===> Mybatis??? getUserInfo() ?????? ??????");
		return (UserVO) mybatis.selectOne("UserDAO.getUserInfo", vo);
	}
	

	
	public int nameCheck(String sm_name) {
		System.out.println(sm_name);
		return mybatis.selectOne("UserDAO.nameCheck", sm_name);
	}

	// ?????? nick ???????????? ?????? 
	public String getMypageTradeNick(UserVO vo) {
		System.out.println("===> JDBC getMypageTradeNick() ?????? ??????");
		return mybatis.selectOne("UserDAO.getMypageTradeNick", vo);
	}
}