package com.dbinc.pgm.vo;

public class JobTotalSearchVO {
	String txtYear, txtMonth, txtDay;
	String date;
	String operCd;
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTxtYear() {
		return txtYear;
	}
	
	public void setTxtYear(String txtYear) {
		this.txtYear = txtYear;
	}
	
	public String getTxtMonth() {
		return txtMonth;
	}
	
	public void setTxtMonth(String txtMonth) {
		this.txtMonth = txtMonth;
	}
	
	public String getTxtDay() {
		return txtDay;
	}
	
	public void setTxtDay(String txtDay) {
		this.txtDay = txtDay;
	}
	
	public String getOperCd() {
		return operCd;
	}
	
	public void setOperCd(String operCd) {
		this.operCd = operCd;
	}	
}