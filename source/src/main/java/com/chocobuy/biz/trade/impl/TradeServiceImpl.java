package com.chocobuy.biz.trade.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;

@Service("tradeService")
public class TradeServiceImpl implements TradeService {

	@Autowired
	private TradeDAOMybatis tradeDAO;
	
	@Override
	public void insertTrade(TradeVO vo) {
		tradeDAO.insertTrade(vo);
	}

	@Override
	public void updateTrade(TradeVO vo) {
		tradeDAO.updateTrade(vo);
	}

	@Override
	public void deleteTrade(TradeVO vo) {
		tradeDAO.deleteTrade(vo);
	}

	@Override
	public TradeVO getTrade(TradeVO vo) {
		return tradeDAO.getTrade(vo);
	}

	@Override
	public List<TradeVO> getTradeList(TradeVO vo) {
		return tradeDAO.getTradeList(vo);
	}

	@Override
	public List<TradeVO> getSearchTradeList(TradeVO vo) {
		return tradeDAO.getSearchTradeList(vo);
	}

	@Override
	public void updateReporting(TradeVO vo) {
		tradeDAO.updateReporting(vo);
		
	}
	@Override
	public List<TradeVO> getMyTradeList(TradeVO vo) {
		return tradeDAO.getMyTradeList(vo);
	}
	@Override
	public int getTradeCount(TradeVO vo) {
		return tradeDAO.getTradeCount(vo);
	}


	
	
	@Override
	public List<TradeVO> getMypageTradeList(TradeVO vo) {
		return tradeDAO.getMypageTradeList(vo);
	}
	@Override
	public TradeVO getMypageTrade(TradeVO vo) {
		return tradeDAO.getMypageTrade(vo); 
	}
	
	@Override
	public void updateMypageTrade(TradeVO vo) {
		tradeDAO.updateMypageTrade(vo);
	}
	
	@Override
	public List<TradeVO> getMypageTradeSerch(TradeVO vo) {
		return tradeDAO.getMypageTradeSerch(vo);    
	}

	
	// 글 개수 확인 
	@Override
	public int countMypageTrade(TradeVO vo) {
		return tradeDAO.countMypageTrade(vo);
	}



}
