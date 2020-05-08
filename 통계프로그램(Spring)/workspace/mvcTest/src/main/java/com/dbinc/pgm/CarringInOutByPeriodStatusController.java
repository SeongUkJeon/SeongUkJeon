package com.dbinc.pgm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbinc.pgm.service.CarringInOutByPeriodStatusService;
import com.dbinc.pgm.vo.CarringInOutByDateVO;
import com.dbinc.pgm.vo.CarringInOutByDayVO;
import com.dbinc.pgm.vo.CarringInOutByTimeVO;
import com.dbinc.pgm.vo.CarringInOutSearchVO;

@Controller
public class CarringInOutByPeriodStatusController {	
	private GetDateClass functionClass = new GetDateClass();
	private List<String> todate = functionClass.getDate(true);

	@Resource(name = "carringInOutByPeriodStatusService")
	private CarringInOutByPeriodStatusService carringInOutByPeriodStatusService;

	@RequestMapping(value = "/carringInOutByTime", method = RequestMethod.GET)
	public String carringInOutByTime(Model model) throws Exception {
		List<String> fromdate = functionClass.getFromDate(1);
		
		model.addAttribute("toDate", todate);
		model.addAttribute("fromDate", fromdate);
		
	    return "carringInOutByPeriodStatus/carringInOutByTime";
	}
	
	@RequestMapping(value = "/carringInOutByTime", method = RequestMethod.POST)
	public String carringInOutByTime(CarringInOutSearchVO vo, Model model) {
		List<String> fromdate = functionClass.getFromDate(1);
		if(vo.getTxtFromYear().equals(fromdate.get(0)) == false || 
				vo.getTxtFromMonth().equals(fromdate.get(1)) == false ||
				vo.getTxtFromDay().equals(fromdate.get(2))  == false ||
				vo.getTxtFromTime().equals(fromdate.get(3)) == false) {
			model.addAttribute("toDate", todate);
			model.addAttribute("fromDate", fromdate);
			model.addAttribute("flag", "fail");
			
			return "carringInOutByPeriodStatus/carringInOutByTime";
		}

		List<CarringInOutByTimeVO> data = null;
		try{
			data = carringInOutByPeriodStatusService.carringInOutByTime(vo);
		} catch(Exception e) {
			model.addAttribute("toDate", todate);
			model.addAttribute("fromDate", fromdate);
		    model.addAttribute("flag", "fail");
		    
			return "carringInOutByPeriodStatus/carringInOutByTime";
		}
		
		
		data = getTotalByTime(data);
				
		model.addAttribute("toDate", todate);
		model.addAttribute("fromDate", fromdate);
	    model.addAttribute("data", data);
		model.addAttribute("getunit", "(" + vo.getUnit().toUpperCase() + ")");
	    
		String str ="";
		str +="['time', '반입', '반출', '합계'],";
		for(int i = 0; i < 24; i++) {
			str += "['" + i + "', ";
			for(int j = 0; j < 3; j++) {
				switch (i) {
				case 0:
					str += data.get(j).getTime1();					
					break;
				case 1:
					str += data.get(j).getTime2();					
					break;
				case 2:
					str += data.get(j).getTime3();					
					break;
				case 3:
					str += data.get(j).getTime4();					
					break;
				case 4:
					str += data.get(j).getTime5();					
					break;
				case 5:
					str += data.get(j).getTime6();					
					break;
				case 6:
					str += data.get(j).getTime7();					
					break;
				case 7:
					str += data.get(j).getTime8();					
					break;
				case 8:
					str += data.get(j).getTime9();					
					break;
				case 9:
					str += data.get(j).getTime10();					
					break;
				case 10:
					str += data.get(j).getTime11();					
					break;
				case 11:
					str += data.get(j).getTime12();					
					break;
				case 12:
					str += data.get(j).getTime13();					
					break;
				case 13:
					str += data.get(j).getTime14();					
					break;
				case 14:
					str += data.get(j).getTime15();					
					break;
				case 15:
					str += data.get(j).getTime16();					
					break;
				case 16:
					str += data.get(j).getTime17();					
					break;
				case 17:
					str += data.get(j).getTime18();					
					break;
				case 18:
					str += data.get(j).getTime19();					
					break;
				case 19:
					str += data.get(j).getTime20();					
					break;
				case 20:
					str += data.get(j).getTime21();					
					break;
				case 21:
					str += data.get(j).getTime22();					
					break;
				case 22:
					str += data.get(j).getTime23();					
					break;
				case 23:
					str += data.get(j).getTime24();					
					break;
				}				
				if(j < 2) {
					str += ",";
				}
			}
			str += "]";
			if(i < 23){
				str +=",";
			}
		}

		model.addAttribute("str", str);
		
		return "carringInOutByPeriodStatus/carringInOutByTime";
	}
	
	@RequestMapping(value = "/carringInOutByDay", method = RequestMethod.GET)
	public String carringInOutByDay(Model model) throws Exception {
		List<String> fromdate = functionClass.getFromDate(7);
		
		model.addAttribute("toDate", todate);
		model.addAttribute("fromDate", fromdate);
		
	    return "carringInOutByPeriodStatus/carringInOutByDay";
	}
	
	@RequestMapping(value = "/carringInOutByDay", method = RequestMethod.POST)
	public String carringInOutByDay(CarringInOutSearchVO vo, Model model) {
		List<String> fromdate = functionClass.getFromDate(7);
		if(vo.getTxtFromYear().equals(fromdate.get(0)) == false || 
				vo.getTxtFromMonth().equals(fromdate.get(1)) == false ||
				vo.getTxtFromDay().equals(fromdate.get(2))  == false) {
			model.addAttribute("toDate", todate);
			model.addAttribute("fromDate", fromdate);
			model.addAttribute("flag", "fail");
			
			return "carringInOutByPeriodStatus/carringInOutByDay";
		}

		List<CarringInOutByDayVO> data = null;		
		try{
			data = carringInOutByPeriodStatusService.carringInOutByDay(vo);
		} catch(Exception e) {
			model.addAttribute("toDate", todate);
			model.addAttribute("fromDate", fromdate);
		    model.addAttribute("flag", "fail");
		    
			return "carringInOutByPeriodStatus/carringInOutByDay";
		}
		
		
		data = getTotalByDay(data);
				
		model.addAttribute("toDate", todate);
		model.addAttribute("fromDate", fromdate);
	    model.addAttribute("data", data);
		model.addAttribute("getunit", "(" + vo.getUnit().toUpperCase() + ")");
	    
		String str = "";
		String day = "";
		str +="['time', '반입', '반출', '합계'],";
		for(int i = 0; i < 7; i++) {
			switch (i) {
			case 0:
				day = "일";
				break;
			case 1:
				day = "월";
				break;
			case 2:
				day = "화";
				break;
			case 3:
				day = "수";
				break;
			case 4:
				day = "목";
				break;
			case 5:
				day = "금";
				break;
			case 6:
				day = "토";
				break;
			}
			str += "['" + day + "', ";
			for(int j = 0; j < 3; j++) {
				switch (i) {
				case 0:
					str += data.get(j).getSunday();					
					break;
				case 1:
					str += data.get(j).getMonday();					
					break;
				case 2:
					str += data.get(j).getTuesday();					
					break;
				case 3:
					str += data.get(j).getWednesday();					
					break;
				case 4:
					str += data.get(j).getThursday();					
					break;
				case 5:
					str += data.get(j).getFriday();					
					break;
				case 6:
					str += data.get(j).getSaturday();					
					break;
				}				
				if(j < 2) {
					str += ",";
				}
			}
			str += "]";
			if(i < 6){
				str +=",";
			}
		}

		model.addAttribute("str", str);
		
		return "carringInOutByPeriodStatus/carringInOutByDay";
	}
	
	@RequestMapping(value = "/carringInOutByDate", method = RequestMethod.GET)
	public String carringInOutByDate(Model model) throws Exception {
		List<String> fromdate = functionClass.getFromDate(functionClass.getLastDayMonth());
		
		model.addAttribute("toDate", todate);
		model.addAttribute("fromDate", fromdate);
		
	    return "carringInOutByPeriodStatus/carringInOutByDate";
	}
	
	@RequestMapping(value = "/carringInOutByDate", method = RequestMethod.POST)
	public String carringInOutByDate(CarringInOutSearchVO vo, Model model) {
		int lastday = functionClass.getLastDayMonth();
		
		List<String> fromdate = functionClass.getFromDate(lastday);
		if(vo.getTxtFromYear().equals(fromdate.get(0)) == false || 
				vo.getTxtFromMonth().equals(fromdate.get(1)) == false ||
				vo.getTxtFromDay().equals(fromdate.get(2))  == false) {
			model.addAttribute("toDate", todate);
			model.addAttribute("fromDate", fromdate);
			model.addAttribute("flag", "fail");
			
			return "carringInOutByPeriodStatus/carringInOutByDate";
		}
		
		List<CarringInOutByDateVO> data = null;
		try{
			data = carringInOutByPeriodStatusService.carringInOutByDate(vo);
		} catch(Exception e) {
			model.addAttribute("toDate", todate);
			model.addAttribute("fromDate", fromdate);
		    model.addAttribute("flag", "fail");
		    
			return "carringInOutByPeriodStatus/carringInOutByDate";
		}
		
		
		data = getTotalByDate(data);
				
		model.addAttribute("toDate", todate);
		model.addAttribute("fromDate", fromdate);
	    model.addAttribute("data", data);
		model.addAttribute("getunit", "(" + vo.getUnit().toUpperCase() + ")");
		model.addAttribute("lastdaypremonth", lastday);
	    
		String str ="";
		str +="['date', '반입', '반출', '합계'],";
		for(int i = 0; i < lastday; i++) {
			str += "['" + (i + 1) + "', ";
			for(int j = 0; j < 3; j++) {
				switch (i) {
				case 0:
					str += data.get(j).getDay1();					
					break;
				case 1:
					str += data.get(j).getDay2();			
					break;
				case 2:
					str += data.get(j).getDay3();					
					break;
				case 3:
					str += data.get(j).getDay4();				
					break;
				case 4:
					str += data.get(j).getDay5();				
					break;
				case 5:
					str += data.get(j).getDay6();		
					break;
				case 6:
					str += data.get(j).getDay7();					
					break;
				case 7:
					str += data.get(j).getDay8();					
					break;
				case 8:
					str += data.get(j).getDay9();					
					break;
				case 9:
					str += data.get(j).getDay10();					
					break;
				case 10:
					str += data.get(j).getDay11();					
					break;
				case 11:
					str += data.get(j).getDay12();					
					break;
				case 12:
					str += data.get(j).getDay13();					
					break;
				case 13:
					str += data.get(j).getDay14();					
					break;
				case 14:
					str += data.get(j).getDay15();					
					break;
				case 15:
					str += data.get(j).getDay16();					
					break;
				case 16:
					str += data.get(j).getDay17();					
					break;
				case 17:
					str += data.get(j).getDay18();					
					break;
				case 18:
					str += data.get(j).getDay19();					
					break;
				case 19:
					str += data.get(j).getDay20();					
					break;
				case 20:
					str += data.get(j).getDay21();					
					break;
				case 21:
					str += data.get(j).getDay22();					
					break;
				case 22:
					str += data.get(j).getDay23();					
					break;
				case 23:
					str += data.get(j).getDay24();					
					break;
				case 24:
					str += data.get(j).getDay25();					
					break;
				case 25:
					str += data.get(j).getDay26();					
					break;
				case 26:
					str += data.get(j).getDay27();					
					break;
				case 27:
					str += data.get(j).getDay28();					
					break;
				case 28:
					str += data.get(j).getDay29();					
					break;
				case 29:
					str += data.get(j).getDay30();					
					break;
				case 30:
					str += data.get(j).getDay31();					
					break;
				}	
				if(j < 2) {
					str += ",";
				}
			}
			str += "]";
			if(i < lastday){
				str +=",";
			}
		}

		model.addAttribute("str", str);
		
		return "carringInOutByPeriodStatus/carringInOutByDate";
	}
	
	private List<CarringInOutByDateVO> getTotalByDate(List<CarringInOutByDateVO> data) {
		int tday1 = 0, tday2 = 0, tday3 = 0, tday4 = 0, tday5 = 0, 
				tday6 = 0, tday7 = 0, tday8 = 0, tday9 = 0, tday10 = 0, 
				tday11 = 0, tday12 = 0, tday13 = 0, tday14 = 0, tday15 = 0, 
				tday16 = 0, tday17 = 0, tday18 = 0, tday19 = 0, tday20 = 0, 
				tday21 = 0, tday22 = 0, tday23 = 0, tday24 = 0, tday25 = 0, 
				tday26 = 0, tday27 = 0, tday28 = 0, tday29 = 0, tday30 = 0, 
				tday31 = 0;
		int ttot = 0;
		
		for (CarringInOutByDateVO vo : data) {
			tday1 += vo.getDay1();
			tday2 += vo.getDay2();
			tday3 += vo.getDay3();
			tday4 += vo.getDay4();
			tday5 += vo.getDay5();
			tday6 += vo.getDay6();
			tday7 += vo.getDay7();
			tday8 += vo.getDay8();
			tday9 += vo.getDay9();
			tday10 += vo.getDay10();
			tday11 += vo.getDay11();
			tday12 += vo.getDay12();
			tday13 += vo.getDay13();
			tday14 += vo.getDay14();
			tday15 += vo.getDay15();
			tday16 += vo.getDay16();
			tday17 += vo.getDay17();
			tday18 += vo.getDay18();
			tday19 += vo.getDay19();
			tday20 += vo.getDay20();
			tday21 += vo.getDay21();
			tday22 += vo.getDay22();
			tday23 += vo.getDay23();
			tday24 += vo.getDay24();
			tday25 += vo.getDay25();
			tday26 += vo.getDay26();
			tday27 += vo.getDay27();
			tday28 += vo.getDay28();
			tday29 += vo.getDay29();
			tday30 += vo.getDay30();
			tday31 += vo.getDay31();
			ttot += vo.getTot();
		}
		
		CarringInOutByDateVO total = new CarringInOutByDateVO();
		total.setGubun("합계");
		total.setDay1(tday1);
		total.setDay2(tday2);
		total.setDay3(tday3);
		total.setDay4(tday4);
		total.setDay5(tday5);
		total.setDay6(tday6);
		total.setDay7(tday7);
		total.setDay8(tday8);
		total.setDay9(tday9);
		total.setDay10(tday10);
		total.setDay11(tday11);
		total.setDay12(tday12);
		total.setDay13(tday13);
		total.setDay14(tday14);
		total.setDay15(tday15);
		total.setDay16(tday16);
		total.setDay17(tday17);
		total.setDay18(tday18);
		total.setDay19(tday19);
		total.setDay20(tday20);
		total.setDay21(tday21);
		total.setDay22(tday22);
		total.setDay23(tday23);
		total.setDay24(tday24);
		total.setDay25(tday25);
		total.setDay26(tday26);
		total.setDay27(tday27);
		total.setDay28(tday28);
		total.setDay29(tday29);
		total.setDay30(tday30);
		total.setDay31(tday31);
		total.setTot(ttot);
		
		CarringInOutByDateVO totalpercent = new CarringInOutByDateVO();
		totalpercent.setGubun("비율(%)");
		totalpercent.setDay1(Math.round(tday1 * 100 / ttot));
		totalpercent.setDay2(Math.round(tday2 * 100 / ttot));
		totalpercent.setDay3(Math.round(tday3 * 100 / ttot));
		totalpercent.setDay4(Math.round(tday4 * 100 / ttot));
		totalpercent.setDay5(Math.round(tday5 * 100 / ttot));
		totalpercent.setDay6(Math.round(tday6 * 100 / ttot));
		totalpercent.setDay7(Math.round(tday7 * 100 / ttot));
		totalpercent.setDay8(Math.round(tday8 * 100 / ttot));
		totalpercent.setDay9(Math.round(tday9 * 100 / ttot));
		totalpercent.setDay10(Math.round(tday10 * 100 / ttot));
		totalpercent.setDay11(Math.round(tday11 * 100 / ttot));
		totalpercent.setDay12(Math.round(tday12 * 100 / ttot));
		totalpercent.setDay13(Math.round(tday13 * 100 / ttot));
		totalpercent.setDay14(Math.round(tday14 * 100 / ttot));
		totalpercent.setDay15(Math.round(tday15 * 100 / ttot));
		totalpercent.setDay16(Math.round(tday16 * 100 / ttot));
		totalpercent.setDay17(Math.round(tday17 * 100 / ttot));
		totalpercent.setDay18(Math.round(tday18 * 100 / ttot));
		totalpercent.setDay19(Math.round(tday19 * 100 / ttot));
		totalpercent.setDay20(Math.round(tday20 * 100 / ttot));
		totalpercent.setDay21(Math.round(tday21 * 100 / ttot));
		totalpercent.setDay22(Math.round(tday22 * 100 / ttot));
		totalpercent.setDay23(Math.round(tday23 * 100 / ttot));
		totalpercent.setDay24(Math.round(tday24 * 100 / ttot));
		totalpercent.setDay25(Math.round(tday25 * 100 / ttot));
		totalpercent.setDay26(Math.round(tday26 * 100 / ttot));
		totalpercent.setDay27(Math.round(tday27 * 100 / ttot));
		totalpercent.setDay28(Math.round(tday28 * 100 / ttot));
		totalpercent.setDay29(Math.round(tday29 * 100 / ttot));
		totalpercent.setDay30(Math.round(tday30 * 100 / ttot));
		totalpercent.setDay31(Math.round(tday31 * 100 / ttot));
		totalpercent.setTot(100);
		
		data.add(total);
		data.add(totalpercent);
		
		return data;		
	}

	private List<CarringInOutByTimeVO> getTotalByTime(List<CarringInOutByTimeVO> data) {
		int ttime1 = 0, ttime2 = 0, ttime3 = 0, ttime4 = 0, ttime5 = 0, 
				ttime6 = 0, ttime7 = 0, ttime8 = 0, ttime9 = 0, ttime10 = 0, 
				ttime11 = 0, ttime12 = 0, ttime13 = 0, ttime14 = 0, ttime15 = 0, 
				ttime16 = 0, ttime17 = 0, ttime18 = 0, ttime19 = 0, ttime20 = 0, 
				ttime21 = 0, ttime22 = 0, ttime23 = 0, ttime24 = 0;
		int ttot = 0;
		
		for (CarringInOutByTimeVO vo : data) {
			ttime1 += vo.getTime1();
			ttime2 += vo.getTime2();
			ttime3 += vo.getTime3();
			ttime4 += vo.getTime4();
			ttime5 += vo.getTime5();
			ttime6 += vo.getTime6();
			ttime7 += vo.getTime7();
			ttime8 += vo.getTime8();
			ttime9 += vo.getTime9();
			ttime10 += vo.getTime10();
			ttime11 += vo.getTime11();
			ttime12 += vo.getTime12();
			ttime13 += vo.getTime13();
			ttime14 += vo.getTime14();
			ttime15 += vo.getTime15();
			ttime16 += vo.getTime16();
			ttime17 += vo.getTime17();
			ttime18 += vo.getTime18();
			ttime19 += vo.getTime19();
			ttime20 += vo.getTime20();
			ttime21 += vo.getTime21();
			ttime22 += vo.getTime22();
			ttime23 += vo.getTime23();
			ttime24 += vo.getTime24();
			ttot += vo.getTot();
		}
		
		CarringInOutByTimeVO total = new CarringInOutByTimeVO();
		total.setGubun("합계");
		total.setTime1(ttime1);
		total.setTime2(ttime2);
		total.setTime3(ttime3);
		total.setTime4(ttime4);
		total.setTime5(ttime5);
		total.setTime6(ttime6);
		total.setTime7(ttime7);
		total.setTime8(ttime8);
		total.setTime9(ttime9);
		total.setTime10(ttime10);
		total.setTime11(ttime11);
		total.setTime12(ttime12);
		total.setTime13(ttime13);
		total.setTime14(ttime14);
		total.setTime15(ttime15);
		total.setTime16(ttime16);
		total.setTime17(ttime17);
		total.setTime18(ttime18);
		total.setTime19(ttime19);
		total.setTime20(ttime20);
		total.setTime21(ttime21);
		total.setTime22(ttime22);
		total.setTime23(ttime23);
		total.setTime24(ttime24);
		total.setTot(ttot);
		
		CarringInOutByTimeVO totalpercent = new CarringInOutByTimeVO();
		totalpercent.setGubun("비율(%)");
		totalpercent.setTime1(Math.round(ttime1 * 100 / ttot));
		totalpercent.setTime2(Math.round(ttime2 * 100 / ttot));
		totalpercent.setTime3(Math.round(ttime3 * 100 / ttot));
		totalpercent.setTime4(Math.round(ttime4 * 100 / ttot));
		totalpercent.setTime5(Math.round(ttime5 * 100 / ttot));
		totalpercent.setTime6(Math.round(ttime6 * 100 / ttot));
		totalpercent.setTime7(Math.round(ttime7 * 100 / ttot));
		totalpercent.setTime8(Math.round(ttime8 * 100 / ttot));
		totalpercent.setTime9(Math.round(ttime9 * 100 / ttot));
		totalpercent.setTime10(Math.round(ttime10 * 100 / ttot));
		totalpercent.setTime11(Math.round(ttime11 * 100 / ttot));
		totalpercent.setTime12(Math.round(ttime12 * 100 / ttot));
		totalpercent.setTime13(Math.round(ttime13 * 100 / ttot));
		totalpercent.setTime14(Math.round(ttime14 * 100 / ttot));
		totalpercent.setTime15(Math.round(ttime15 * 100 / ttot));
		totalpercent.setTime16(Math.round(ttime16 * 100 / ttot));
		totalpercent.setTime17(Math.round(ttime17 * 100 / ttot));
		totalpercent.setTime18(Math.round(ttime18 * 100 / ttot));
		totalpercent.setTime19(Math.round(ttime19 * 100 / ttot));
		totalpercent.setTime20(Math.round(ttime20 * 100 / ttot));
		totalpercent.setTime21(Math.round(ttime21 * 100 / ttot));
		totalpercent.setTime22(Math.round(ttime22 * 100 / ttot));
		totalpercent.setTime23(Math.round(ttime23 * 100 / ttot));
		totalpercent.setTime24(Math.round(ttime24 * 100 / ttot));
		totalpercent.setTot(100);
		
		data.add(total);
		data.add(totalpercent);
		
		return data;		
	}
	
	private List<CarringInOutByDayVO> getTotalByDay(List<CarringInOutByDayVO> data) {
		int tsunday = 0, tmonday = 0, ttuesday = 0, twednesday = 0, tthursday = 0, tfriday = 0, tsaturday= 0; 
		int ttot = 0;
		
		for (CarringInOutByDayVO vo : data) {
			tsunday += vo.getSunday();
			tmonday += vo.getMonday();
			ttuesday += vo.getTuesday();
			twednesday += vo.getWednesday();
			tthursday += vo.getThursday();
			tfriday += vo.getFriday();
			tsaturday += vo.getSaturday();
			ttot += vo.getTot();
		}
		
		CarringInOutByDayVO total = new CarringInOutByDayVO();
		total.setGubun("합계");
		total.setSunday(tsunday);
		total.setMonday(tmonday);
		total.setTuesday(ttuesday);
		total.setWednesday(twednesday);
		total.setThursday(tthursday);
		total.setFriday(tfriday);
		total.setSaturday(tsaturday);
		total.setTot(ttot);
		
		CarringInOutByDayVO totalpercent = new CarringInOutByDayVO();
		totalpercent.setGubun("비율(%)");
		totalpercent.setSunday(Math.round(tsunday * 100 / ttot));
		totalpercent.setMonday(Math.round(tmonday * 100 / ttot));
		totalpercent.setTuesday(Math.round(ttuesday * 100 / ttot));
		totalpercent.setWednesday(Math.round(twednesday * 100 / ttot));
		totalpercent.setThursday(Math.round(tthursday * 100 / ttot));
		totalpercent.setFriday(Math.round(tfriday * 100 / ttot));
		totalpercent.setSaturday(Math.round(tsaturday * 100 / ttot));
		totalpercent.setTot(100);
		
		data.add(total);
		data.add(totalpercent);
		
		return data;		
	}
}