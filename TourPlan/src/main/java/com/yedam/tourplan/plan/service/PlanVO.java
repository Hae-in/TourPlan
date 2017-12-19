package com.yedam.tourplan.plan.service;

import java.util.Date;

public class PlanVO {
	private String plannum;
	private String planname;
	private Date departuredate;
	private Date arrivaldate;
	private String people;
	private String categorynum;
	private String isopen;
	private String state;
	private String writedate;
	private String likecount;
	private String userid;
	private String id;
	
	public String getPlannum() {
		return plannum;
	}
	public void setPlannum(String plannum) {
		this.plannum = plannum;
	}
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
	public Date getDeparturedate() {
		return departuredate;
	}
	public void setDeparturedate(Date departuredate) {
		this.departuredate = departuredate;
	}
	public Date getArrivaldate() {
		return arrivaldate;
	}
	public void setArrivaldate(Date arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getCategorynum() {
		return categorynum;
	}
	public void setCategorynum(String categorynum) {
		this.categorynum = categorynum;
	}
	public String getIsopen() {
		return isopen;
	}
	public void setIsopen(String isopen) {
		this.isopen = isopen;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getLikecount() {
		return likecount;
	}
	public void setLikecount(String likecount) {
		this.likecount = likecount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
