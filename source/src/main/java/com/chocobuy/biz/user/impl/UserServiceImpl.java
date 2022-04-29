package com.chocobuy.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAOMybatis userDAO;

	// Area 추가
	@Override
	public void updateUserArea(UserVO vo) {
		userDAO.updateUserArea(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
	//회원가입 (전화번호 db 입력)
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	// getUser 기준:user_tel
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	@Override
	public void updateUserNick(UserVO vo) {
		userDAO.updateUserNick(vo);
		
	}
	
	// 별명 중복 체크
	@Override
	public int nickDupCheck(String user_nick) {
		return userDAO.nickDupCheck(user_nick);
	}
	
	// 휴대폰 번호 체크
	@Override
	public int userTelCheck(String user_tel) {
		return userDAO.userTelCheck(user_tel);
	}
	////

	
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
	
	// 확인요
	@Override
	public int updateMypageUser(UserVO vo) {
		return userDAO.updateMypageUser(vo);
	}

	@Override
	public int mypageNumCheck(String sm_num) {
		return userDAO.mypageNumCheck(sm_num);
	}

	
	
	
}
