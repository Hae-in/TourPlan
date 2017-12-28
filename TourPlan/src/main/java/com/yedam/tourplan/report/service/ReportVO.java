package com.yedam.tourplan.report.service;

public class ReportVO {
	private String reportnum;
	private String placenum;
	private String plannum;
	private String membernum;
	private String reportdate;
	private String state;
	private String reportcontent;
	
	public String getReportnum() {
		return reportnum;
	}
	public void setReportnum(String reportnum) {
		this.reportnum = reportnum;
	}
	public String getPlacenum() {
		return placenum;
	}
	public void setPlacenum(String placenum) {
		this.placenum = placenum;
	}
	public String getPlannum() {
		return plannum;
	}
	public void setPlannum(String plannum) {
		this.plannum = plannum;
	}
	public String getMembernum() {
		return membernum;
	}
	public void setMembernum(String membernum) {
		this.membernum = membernum;
	}
	public String getReportdate() {
		return reportdate;
	}
	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReportcontent() {
		return reportcontent;
	}
	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}
	@Override
	public String toString() {
		return "ReportVO [reportnum=" + reportnum + ", placenum=" + placenum + ", plannum=" + plannum + ", membernum="
				+ membernum + ", reportdate=" + reportdate + ", state=" + state + ", reportcontent=" + reportcontent
				+ "]";
	}
}
