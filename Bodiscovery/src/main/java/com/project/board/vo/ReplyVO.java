package com.project.board.vo;

import java.util.Date;

public class ReplyVO {
	
	private int bno;
	private int rno;
	private String re_id;
	private String re_content;
	private Date re_date;
	private int re_parent;
	private int re_depth;
	private int re_order;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRe_id() {
		return re_id;
	}
	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getRe_parent() {
		return re_parent;
	}
	public void setRe_parent(int re_parent) {
		this.re_parent = re_parent;
	}
	public int getRe_depth() {
		return re_depth;
	}
	public void setRe_depth(int re_depth) {
		this.re_depth = re_depth;
	}
	public int getRe_order() {
		return re_order;
	}
	public void setRe_order(int re_order) {
		this.re_order = re_order;
	}

	
	
	
}
