package com.example.anesi.model;

public class Review {
	private String nick;
	private String createDate;
	private int csat;
	private int help;
	private String content;
	private String rImgName;
	private String rImgPath;
	private String uImgPath;
	private String uImgName;
	

	public String getuImgPath() {
		return uImgPath;
	}
	public void setuImgPath(String uImgPath) {
		this.uImgPath = uImgPath;
	}
	public String getuImgName() {
		return uImgName;
	}
	public void setuImgName(String uImgName) {
		this.uImgName = uImgName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getrImgName() {
		return rImgName;
	}
	public void setrImgName(String rImgName) {
		this.rImgName = rImgName;
	}
	public String getrImgPath() {
		return rImgPath;
	}
	public void setrImgPath(String rImgPath) {
		this.rImgPath = rImgPath;
	}
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
	
}
