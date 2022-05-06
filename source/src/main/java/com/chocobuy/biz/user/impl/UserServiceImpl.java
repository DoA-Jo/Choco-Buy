package com.chocobuy.biz.user.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAOMybatis userDAO;

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	@Override
	public void deleteUser(String user_tel) {
		userDAO.deleteUser(user_tel);
	}
	
	// getUser 기준:user_tel
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	@Override
	public UserVO getUserUuid(UserVO vo) {
		return userDAO.getUserUuid(vo);
	}
	
	@Override
	public int nickDupCheck(String user_nick) {
		return userDAO.nickDupCheck(user_nick);
	}
	
	@Override
	public int UserNull(String user_tel) {
		return userDAO.UserNull(user_tel);
	}
	
	@Override
	public int userTelCheck(String user_tel) {
		return userDAO.userTelCheck(user_tel);
	}
	
	@Override
	public void autoLogin(String sessionId, Date limitDate, String user_uuid) {
		Map<String,Object> map = new HashMap<>();
		System.out.println(sessionId);
		System.out.println(limitDate);
		System.out.println(user_uuid);
        map.put("sessionId",sessionId);
        map.put("limitDate",limitDate);
        map.put("user_uuid",user_uuid);
        System.out.println("map"+map);
        userDAO.autoLogin(map);
	}

	@Override
	public UserVO selectSession(String sessionId) {
		return userDAO.selectSession(sessionId);
	}

	@Override
	public void autoLogin(Map<String, Object> map) {
		userDAO.autoLogin(map);
	}
	


	
//----------------------------------------------------------------------------
	@Override
	public int updateUser(UserVO vo) {
		return userDAO.updateUser(vo);
	}

	
	@Override
	public int mypageNameCheck(String sm_name) {
		return userDAO.mypageNameCheck(sm_name);
	}
	@Override
	public UserVO getMypageUser(UserVO vo) {
		return userDAO.getMypageUser(vo);
	}
	
	@Override
	public int updateMypageUser(UserVO vo) {
		return userDAO.updateMypageUser(vo);
	}

	@Override
	public int mypageNumCheck(String sm_num) {
		return userDAO.mypageNumCheck(sm_num);
	}

	@Override
	public void updateMypageUseArea(UserVO vo) {
		userDAO.updateMypageUseArea(vo);
	}

	@Override
	public UserVO getUserInfo(UserVO vo) {
		return userDAO.getUserInfo(vo);
	}

	@Override
	public int nameCheck(String sm_name) {
		return userDAO.nameCheck(sm_name);
	}

	@Override
	public String getMypageTradeNick(UserVO vo) {
		return userDAO.getMypageTradeNick(vo);
	}

}
