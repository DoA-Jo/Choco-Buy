package com.chocobuy.biz.inquiry.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.inquiry.InqService;
import com.chocobuy.biz.inquiry.InqVO;
import com.chocobuy.biz.user.UserVO;


@Service("inqService")
public class InqServiceImpl implements InqService {
	
	@Autowired
	private InqDAOMybatis inqDAO;

	@Override
	public void insertInq(InqVO inqVo) {
		inqDAO.insertInq(inqVo);
	}

	@Override
	public void updateInq(InqVO inqVo) {
		inqDAO.updateInq(inqVo);
	}

	@Override
	public void deleteInq(InqVO inqVo) {
		inqDAO.deleteInq(inqVo);
	}

	@Override
	public InqVO getInq(InqVO inqVo) {
		return inqDAO.getInq(inqVo);
	}

	@Override
	public List<InqVO> getInqList(InqVO inqVo) {
		return inqDAO.getInqList(inqVo);
	}

	@Override
	public int countInq(InqVO inqVo) {
		return inqDAO.countInq(inqVo);
	}

	@Override
	public UserVO getVo_ck(UserVO vo) {
		return inqDAO.getVo_ck(vo);
	}

}
