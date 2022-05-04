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

	// Area 異붽�
	@Override
	public void updateUserArea(UserVO vo) {
		userDAO.updateUserArea(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
	//�쉶�썝媛��엯 (�쟾�솕踰덊샇 db �엯�젰)
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	// getUser 湲곗�:user_tel
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	@Override
	public void updateUserNick(UserVO vo) {
		userDAO.updateUserNick(vo);
		
	}
	
	// 蹂꾨챸 以묐났 泥댄겕
	@Override
	public int nickDupCheck(String user_nick) {
		return userDAO.nickDupCheck(user_nick);
	}
	
	// �쑕���룿 踰덊샇 泥댄겕
	@Override
	public int userTelCheck(String user_tel) {
		return userDAO.userTelCheck(user_tel);
	}
	
	@Override
	public int updateUser(UserVO vo) {
		return userDAO.updateUser(vo);
	}

	@Override
	public int deleteUser(UserVO vo) {
		return userDAO.deleteUser(vo);
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
		userDAO.updateUserArea(vo);
	}

	@Override
	public UserVO getUserInfo(UserVO vo) {
		return userDAO.getUserInfo(vo);
	}

	@Override
	public void autoLogin(String sessionId, Date limitDate, String id) {
		Map<String,Object> map = new HashMap<>();
        map.put("sessionId",sessionId);
        map.put("limitDate",limitDate);
        map.put("id",id);
        System.out.print(map);
        userDAO.autoLogin(map);
	}

	@Override
	public UserVO selectSession(String sessionId) {
		return userDAO.selectSession(sessionId);
	}

	@Override
	public UserVO getUserUuid(UserVO vo) {
		return userDAO.getUserUuid(vo);
	}

	@Override
	public int nameCheck(String sm_name) {
		return userDAO.nameCheck(sm_name);
	}
}
