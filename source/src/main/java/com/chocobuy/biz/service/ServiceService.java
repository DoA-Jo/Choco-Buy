package com.chocobuy.biz.service;

import java.util.List;

import com.chocobuy.biz.admin.AdminServiceVO;


public interface ServiceService {
	//글 등록
	void insertService(ServiceVO vo);

	//글수정
	void updateService(ServiceVO vo);

	//글삭제
	void deleteService(ServiceVO vo);

	//글상세 조회
	ServiceVO getService(ServiceVO vo);

	//글목록 조회
	List<ServiceVO> getServiceList(ServiceVO vo);
	
	int countService(ServiceVO vo);
	
}
