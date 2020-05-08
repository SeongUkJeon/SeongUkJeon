package com.dbinc.pgm.service.dao;

import java.util.List;

import com.dbinc.pgm.vo.DailyInstallResultVO;
import com.dbinc.pgm.vo.DailyJobStatusVO;
import com.dbinc.pgm.vo.MonthlyJobStatusVO;
import com.dbinc.pgm.vo.OperCdVO;
import com.dbinc.pgm.vo.JobTotalSearchVO;

public interface JobTotalDAO {
	List<OperCdVO> selectOperCdList() throws Exception;

	List<DailyInstallResultVO> selectDailyInstallList(JobTotalSearchVO vo) throws Exception;

	List<DailyJobStatusVO> selectDailyJobStatus(JobTotalSearchVO vo) throws Exception;

	List<MonthlyJobStatusVO> selectMonthlyJobStatus(JobTotalSearchVO vo) throws Exception;
}