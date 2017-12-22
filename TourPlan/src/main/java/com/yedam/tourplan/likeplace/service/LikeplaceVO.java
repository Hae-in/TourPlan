package com.yedam.tourplan.likeplace.service;

public class LikeplaceVO {
	private String likeplacenum;
	private String placenum;
	private String membernum;
	public String getLikeplacenum() {
		return likeplacenum;
	}
	public void setLikeplacenum(String likeplacenum) {
		this.likeplacenum = likeplacenum;
	}
	public String getPlacenum() {
		return placenum;
	}
	public void setPlacenum(String placenum) {
		this.placenum = placenum;
	}
	public String getMembernum() {
		return membernum;
	}
	public void setMembernum(String membernum) {
		this.membernum = membernum;
	}
	@Override
	public String toString() {
		return "LikeplaceVO [likeplacenum=" + likeplacenum + ", placenum=" + placenum + ", membernum=" + membernum
				+ "]";
	}	
}
