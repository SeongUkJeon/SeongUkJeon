package com.dbinc.pgm.service.dao;

import java.util.List;

import com.dbinc.pgm.vo.CarringInOutByDateVO;
import com.dbinc.pgm.vo.CarringInOutByDayVO;
import com.dbinc.pgm.vo.CarringInOutByTimeVO;
import com.dbinc.pgm.vo.CarringInOutSearchVO;

public interface CarringInOutByPeriodStatusDAO {
	List<CarringInOutByTimeVO> selectCarringInOutByTime(CarringInOutSearchVO vo);

	List<CarringInOutByDayVO> selectCarringInOutByDay(CarringInOutSearchVO vo);

	List<CarringInOutByDateVO> selectCarringInOutByDate(CarringInOutSearchVO vo);
}