package com.example.anesi.model;


public class BoardComment {
	private int boardNo;
	private int CommentNo;
	private String nick;
	private String content;
	private String cDateTime;
	private String uDateTime;
	private int cUserNo;
	
	public int getcUserNo() {
		return cUserNo;
	}
	public void setcUserNo(int cUserNo) {
		this.cUserNo = cUserNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCommentNo() {
		return CommentNo;
	}
	public void setCommentNo(int commentNo) {
		CommentNo = commentNo;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getcDateTime() {
		return cDateTime;
	}
	public void setcDateTime(String cDateTime) {
		this.cDateTime = cDateTime;
	}
	public String getuDateTime() {
		return uDateTime;
	}
	public void setuDateTime(String uDateTime) {
		this.uDateTime = uDateTime;
	}
	
}
