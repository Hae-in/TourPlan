package com.yedam.tourplan.place.service;

public class PlaceVO {
	private String placenum;
	private String placename;
	private String content;
	private String state;
	private String writedate;
	private String membernum;
	private String categorynum;
	private String lat;
	private String lon;
	private String addr;
	private String city;
	private String country;	
	private String out_msg;
	private String imagename;
	
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public String getOut_msg() {
		return out_msg;
	}
	public void setOut_msg(String out_msg) {
		this.out_msg = out_msg;
	}
	public String getPlacenum() {
		return placenum;
	}
	public void setPlacenum(String placenum) {
		this.placenum = placenum;
	}
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getMembernum() {
		return membernum;
	}
	public void setMembernum(String membernum) {
		this.membernum = membernum;
	}
	public String getCategorynum() {
		return categorynum;
	}
	public void setCategorynum(String categorynum) {
		this.categorynum = categorynum;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	@Override
	public String toString() {
		return "PlaceVO [placenum=" + placenum + ", placename=" + placename + ", content=" + content + ", state="
				+ state + ", writedate=" + writedate + ", membernum=" + membernum + ", categorynum=" + categorynum
				+ ", lat=" + lat + ", lon=" + lon + ", addr=" + addr + ", city=" + city + ", country=" + country + "]";
	}		
}
