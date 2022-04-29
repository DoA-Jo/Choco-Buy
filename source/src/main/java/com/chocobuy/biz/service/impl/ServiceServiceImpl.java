package com.chocobuy.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocobuy.biz.service.ServiceService;
import com.chocobuy.biz.service.ServiceVO;

@Service("serviceService")
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	private ServiceDAOMybatis ServiceDAO;
	
	@Override
	public void insertService(ServiceVO vo) {
		ServiceDAO.insertService(vo);
	}

	@Override
	public void updateService(ServiceVO vo) {
		ServiceDAO.updateService(vo);
	}

	@Override
	public void deleteService(ServiceVO vo) {
		ServiceDAO.deleteService(vo);
	}

	@Override
	public ServiceVO getService(ServiceVO vo) {
		return ServiceDAO.getService(vo);
	}

	@Override
	public List<ServiceVO> getServiceList(ServiceVO vo) {
		return ServiceDAO.getServiceList(vo);
	}

	@Override
	public int countService(ServiceVO vo) {
		return ServiceDAO.countService(vo);
	}
	
	
}
