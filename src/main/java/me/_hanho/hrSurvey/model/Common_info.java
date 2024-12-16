package me._hanho.hrSurvey.model;

import java.util.Date;

public class Common_info {

	private String backcolor;
	private Date start_date;
	private Date end_date;
	
	public Common_info() {
		// TODO Auto-generated constructor stub
	}

	public Common_info(String backcolor, Date start_date, Date end_date) {
		super();
		this.backcolor = backcolor;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public String getBackcolor() {
		return backcolor;
	}

	public void setBackcolor(String backcolor) {
		this.backcolor = backcolor;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "Common_info [backcolor=" + backcolor + ", start_date=" + start_date + ", end_date=" + end_date + "]";
	}
}
