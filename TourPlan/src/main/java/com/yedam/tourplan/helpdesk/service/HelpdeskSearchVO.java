package com.yedam.tourplan.helpdesk.service;

public class HelpdeskSearchVO extends HelpdeskVO {
	int first;
	int last;
	String keyword;
	String sort;
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}	
	
}
