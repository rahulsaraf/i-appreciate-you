package com.webapp.domain;

import java.util.Date;

public class AppreciationPost {
	
	private User senderId;
	
	private User receiverId;
	
	private String message;
	
	private int happy;
	
	private int helpful;
	private int easygoing;
	private int fun;
	private int respectful;
	private int confident;
	private int emotional;
	private int motivated;
	private int compassionate;
	
	private String postId;
	
	private Date postCreationDate;
	
	

	public User getSenderId() {
		return senderId;
	}

	public void setSenderId(User senderId) {
		this.senderId = senderId;
	}

	public User getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(User receiverId) {
		this.receiverId = receiverId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getHappy() {
		return happy;
	}

	public void setHappy(int happy) {
		this.happy = happy;
	}

	public int getHelpful() {
		return helpful;
	}

	public void setHelpful(int helpful) {
		this.helpful = helpful;
	}

	public int getEasygoing() {
		return easygoing;
	}

	public void setEasygoing(int easygoing) {
		this.easygoing = easygoing;
	}

	public int getFun() {
		return fun;
	}

	public void setFun(int fun) {
		this.fun = fun;
	}

	public int getRespectful() {
		return respectful;
	}

	public void setRespectful(int respectful) {
		this.respectful = respectful;
	}

	public int getConfident() {
		return confident;
	}

	public void setConfident(int confident) {
		this.confident = confident;
	}

	public int getEmotional() {
		return emotional;
	}

	public void setEmotional(int emotional) {
		this.emotional = emotional;
	}

	public int getMotivated() {
		return motivated;
	}

	public void setMotivated(int motivated) {
		this.motivated = motivated;
	}

	public int getCompassionate() {
		return compassionate;
	}

	public void setCompassionate(int compassionate) {
		this.compassionate = compassionate;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public Date getPostCreationDate() {
		return postCreationDate;
	}

	public void setPostCreationDate(Date postCreationDate) {
		this.postCreationDate = postCreationDate;
	}
	
	

}
