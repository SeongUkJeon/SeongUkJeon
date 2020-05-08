package com.itbank.common;

public class Pagination { // 게시판 페이징
	private final int perPage = 5;
	private int curPage, pageCount, start, end, total;
			//  ㄴ현재페이지 ㄴ총 페이지 수 ㄴ시작     ㄴ끝

	public Pagination(int curPage, int total) { // 생성자 초기화로 시작, 끝, 총 페이지 수 설정 
		setCurPage(curPage);
		setTotal(total);
		setStart((curPage - 1) * getPerPage() + 1);
		setEnd(curPage * getPerPage());
		setPageCount(total / perPage + ((total % perPage == 0) ? 0 : 1));
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPerPage() {
		return perPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}