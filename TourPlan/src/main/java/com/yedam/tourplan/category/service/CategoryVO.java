package com.yedam.tourplan.category.service;

public class CategoryVO {
	private String categorynum; 
	private String categoryname;
	private String categorygroup;
	public String getCategorynum() {
		return categorynum;
	}
	public void setCategorynum(String categorynum) {
		this.categorynum = categorynum;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getCategorygroup() {
		return categorygroup;
	}
	public void setCategorygroup(String categorygroup) {
		this.categorygroup = categorygroup;
	}
	@Override
	public String toString() {
		return "CategoryVO [categorynum=" + categorynum + ", categoryname=" + categoryname + ", categorygroup="
				+ categorygroup + "]";
	}	
}
