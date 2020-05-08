package com.dbinc.pgm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbinc.pgm.service.JobTotalService;
import com.dbinc.pgm.service.dao.JobTotalDAO;
import com.dbinc.pgm.vo.DailyInstallResultVO;
import com.dbinc.pgm.vo.DailyJobStatusVO;
import com.dbinc.pgm.vo.MonthlyJobStatusVO;
import com.dbinc.pgm.vo.OperCdVO;
import com.dbinc.pgm.vo.JobTotalSearchVO;

@Service("jobTotalService")
public class JobTotalServiceImpl implements JobTotalService {
	@Autowired
	private JobTotalDAO jobTotalDAO;

	@Override
	public List<OperCdVO> selectOperCdList() throws Exception {
		return jobTotalDAO.selectOperCdList();
	}

	@Override
	public List<DailyInstallResultVO> selectDailyInstallList(JobTotalSearchVO vo) throws Exception {
		return jobTotalDAO.selectDailyInstallList(vo);
	}

	@Override
	public List<DailyJobStatusVO> dailyJobStatus(JobTotalSearchVO vo) throws Exception {
		vo.setDate(vo.getTxtYear() + vo.getTxtMonth() + vo.getTxtDay());

		if(vo.getOperCd().equals("all")) vo.setOperCd("%");

		return jobTotalDAO.selectDailyJobStatus(vo);
	}

	@Override
	public List<MonthlyJobStatusVO> monthlyJobStatus(JobTotalSearchVO vo) throws Exception {
		if(Integer.parseInt(vo.getTxtMonth()) < 10) {
			vo.setDate(vo.getTxtYear() + "0" + Integer.toString(Integer.parseInt(vo.getTxtMonth()) + 1) + vo.getTxtDay());			
		} else if(vo.getTxtMonth() == "12") {
			vo.setDate(vo.getTxtYear() + "01" + vo.getTxtDay());
		} else {
			vo.setDate(vo.getTxtYear() + vo.getTxtMonth() + vo.getTxtDay());
		}

		return jobTotalDAO.selectMonthlyJobStatus(vo);
	}
}
