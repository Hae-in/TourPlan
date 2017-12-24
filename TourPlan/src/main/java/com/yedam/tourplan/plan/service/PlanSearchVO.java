package com.yedam.tourplan.plan.service;

public class PlanSearchVO extends PlanVO {
	private String period1;
	private String period2;
	private String plan_sort;
	private String city;
	private String membernum;
	private String plannum_list;
	
	public String getPeriod1() {
		return period1;
	}
	public void setPeriod1(String period1) {
		this.period1 = period1;
	}
	public String getPeriod2() {
		return period2;
	}
	public void setPeriod2(String period2) {
		this.period2 = period2;
	}
	public String getPlan_sort() {
		return plan_sort;
	}
	public void setPlan_sort(String plan_sort) {
		this.plan_sort = plan_sort;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getMembernum() {
		return membernum;
	}
	public void setMembernum(String membernum) {
		this.membernum = membernum;
	}
	public String getPlannum_list() {
		return plannum_list;
	}
	public void setPlannum_list(String plannum_list) {
		this.plannum_list = plannum_list;
	}
}
