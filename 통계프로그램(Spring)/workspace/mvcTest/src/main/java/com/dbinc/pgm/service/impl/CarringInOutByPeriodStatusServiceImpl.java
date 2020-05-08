package com.dbinc.pgm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbinc.pgm.service.CarringInOutByPeriodStatusService;
import com.dbinc.pgm.service.dao.CarringInOutByPeriodStatusDAO;
import com.dbinc.pgm.vo.CarringInOutByDateVO;
import com.dbinc.pgm.vo.CarringInOutByDayVO;
import com.dbinc.pgm.vo.CarringInOutByTimeVO;
import com.dbinc.pgm.vo.CarringInOutSearchVO;

@Service("carringInOutByPeriodStatusService")
public class CarringInOutByPeriodStatusServiceImpl implements CarringInOutByPeriodStatusService {
	@Autowired
	private CarringInOutByPeriodStatusDAO carringInOutByPeriodStatusDAO;
	
	@Override
	public List<CarringInOutByTimeVO> carringInOutByTime(CarringInOutSearchVO vo) throws Exception {
		return carringInOutByPeriodStatusDAO.selectCarringInOutByTime(vo);
	}

	@Override
	public List<CarringInOutByDayVO> carringInOutByDay(CarringInOutSearchVO vo) throws Exception {
		return carringInOutByPeriodStatusDAO.selectCarringInOutByDay(vo);
	}

	@Override
	public List<CarringInOutByDateVO> carringInOutByDate(CarringInOutSearchVO vo) throws Exception {
		return carringInOutByPeriodStatusDAO.selectCarringInOutByDate(vo);
	}
}