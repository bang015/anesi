package com.example.anesi.model;

public class Review {
	private String nick;
	private String createDate;
	private int csat;
	private int help;
	private String content;
	private String imgName;
	private String imgPath;
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getcreateDate() {
		return createDate;
	}
	public void setcreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getCsat() {
		return csat;
	}
	public void setCsat(int csat) {
		this.csat = csat;
	}
	public int getHelp() {
		return help;
	}
	public void setHelp(int help) {
		this.help = help;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
}
