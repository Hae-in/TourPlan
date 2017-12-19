package com.yedam.tourplan.files.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FilesVO {
	private String filenum;
	private String tablename;
	private String tablenum;
	private String ordernum;
	private String filename;
	private String realfilename;
	private String filesize;
	private String state;
	private String writedate;
	List<MultipartFile> uploadFile;
	private String out_msg;
	
	public String getOut_msg() {
		return out_msg;
	}
	public void setOut_msg(String out_msg) {
		this.out_msg = out_msg;
	}	
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFilenum() {
		return filenum;
	}
	public void setFilenum(String filenum) {
		this.filenum = filenum;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getTablenum() {
		return tablenum;
	}
	public void setTablenum(String tablenum) {
		this.tablenum = tablenum;
	}
	public String getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealfilename() {
		return realfilename;
	}
	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
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
	@Override
	public String toString() {
		return "FilesVO [filenum=" + filenum + ", tablename=" + tablename + ", tablenum=" + tablenum + ", ordernum="
				+ ordernum + ", filename=" + filename + ", realfilename=" + realfilename + ", filesize=" + filesize
				+ ", state=" + state + ", writedate=" + writedate + "]";
	}	
}
