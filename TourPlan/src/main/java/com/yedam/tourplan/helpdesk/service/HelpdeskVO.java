package com.yedam.tourplan.helpdesk.service;

public class HelpdeskVO {
	private String num;
	private String title;
	private String content;
	private String writedate;
	private String membernum;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getMembernum() {
		return membernum;
	}
	public void setMembernum(String membernum) {
		this.membernum = membernum;
	}
	@Override
	public String toString() {
		return "HelpdeskVO [num=" + num + ", title=" + title + ", content=" + content + ", writedate=" + writedate
				+ ", membernum=" + membernum + "]";
	}
	
	
}
