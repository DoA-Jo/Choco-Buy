package com.chocobuy.biz.pay;

import java.util.List;

public interface PayService {
	//CRUD 기능의 메소드 구현
		// insert
		void insertPay(PayVO vo);

		// update
		void updatePay(PayVO vo);

		// delete
		void deletePay(PayVO vo);
		
		// get
		PayVO getPay(PayVO vo);

		// list
		List<PayVO> getPayList(PayVO vo);
}
