package com.myweb.domain;

import java.sql.Date;

public class QnaVO {
	private int qno;
	private String title;
	private String content;
	private String writer;
	private Date regd8;
	private Date modd8;
	private int readcount;
	
	
	public QnaVO() {}
	
	public QnaVO(String title, String writer, String content) {
		this.title = title;
		this.writer = writer;
		this.content = content;
	}	
	public QnaVO(int qno, String title, String content) {
		this.qno = qno;
		this.title = title;
		this.content = content;
	}

	public int getqno() {
		return qno;
	}
	public void setqno(int qno) {
		this.qno = qno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegd8() {
		return regd8;
	}
	public void setRegd8(Date regd8) {
		this.regd8 = regd8;
	}
	public Date getModd8() {
		return modd8;
	}
	public void setModd8(Date modd8) {
		this.modd8 = modd8;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
}
