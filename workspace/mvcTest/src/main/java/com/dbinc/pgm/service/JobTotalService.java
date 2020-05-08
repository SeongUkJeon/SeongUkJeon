package com.dbinc.pgm.service;

import java.util.List;

import com.dbinc.pgm.vo.DailyInstallResultVO;
import com.dbinc.pgm.vo.DailyJobStatusVO;
import com.dbinc.pgm.vo.JobTotalSearchVO;
import com.dbinc.pgm.vo.MonthlyJobStatusVO;
import com.dbinc.pgm.vo.OperCdVO;

public interface JobTotalService {
	List<OperCdVO> selectOperCdList() throws Exception;

	List<DailyInstallResultVO> selectDailyInstallList(JobTotalSearchVO vo) throws Exception;

	List<DailyJobStatusVO> dailyJobStatus(JobTotalSearchVO vo) throws Exception;

	List<MonthlyJobStatusVO> monthlyJobStatus(JobTotalSearchVO vo) throws Exception;
}
