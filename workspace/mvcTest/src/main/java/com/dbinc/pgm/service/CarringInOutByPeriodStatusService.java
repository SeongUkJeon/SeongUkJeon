package com.dbinc.pgm.service;

import java.util.List;

import com.dbinc.pgm.vo.CarringInOutByDateVO;
import com.dbinc.pgm.vo.CarringInOutByDayVO;
import com.dbinc.pgm.vo.CarringInOutByTimeVO;
import com.dbinc.pgm.vo.CarringInOutSearchVO;

public interface CarringInOutByPeriodStatusService {
	List<CarringInOutByTimeVO> carringInOutByTime(CarringInOutSearchVO vo) throws Exception;

	List<CarringInOutByDayVO> carringInOutByDay(CarringInOutSearchVO vo) throws Exception;

	List<CarringInOutByDateVO> carringInOutByDate(CarringInOutSearchVO vo) throws Exception;
}