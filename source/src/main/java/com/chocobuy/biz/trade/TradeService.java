

package com.chocobuy.biz.trade;



import java.util.List;

public interface TradeService {

	void insertTrade(TradeVO vo);
	void updateTrade(TradeVO vo);
	void deleteTrade(TradeVO vo);
	void updateReporting(TradeVO vo);
	
	void updateMypageTrade(TradeVO vo);
	
	TradeVO getTrade(TradeVO vo);
	
	TradeVO getMypageTrade(TradeVO vo);

	List<TradeVO> getTradeList(TradeVO vo);
	List<TradeVO> getMypageTradeList(TradeVO vo);
	List<TradeVO> getSearchTradeList(TradeVO vo);
	List<TradeVO> getMypageTradeSerch(TradeVO vo);
	
	//게시물 총 갯수
	int countMypageTrade(TradeVO vo);
	
} 







