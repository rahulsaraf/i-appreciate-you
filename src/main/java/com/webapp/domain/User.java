/**
 * 
 */
package com.webapp.domain;

import java.util.Date;

/**
 * @author rahul
 *
 */
public class User {

	private String fullName;
	private String emailAddress;
	private String phoneNumber;
	private String password;
	private String profileImageLink;
	private Date dateOfBirth;
	private String currentOrg;
	private String bgImageLink;
	private String sex;
	private Long userId;
	private int noOfConnections;
	private String city;
	private String state;
	private String country;
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfileImageLink() {
		return profileImageLink;
	}
	public void setProfileImageLink(String profileImageLink) {
		this.profileImageLink = profileImageLink;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getCurrentOrg() {
		return currentOrg;
	}
	public void setCurrentOrg(String currentOrg) {
		this.currentOrg = currentOrg;
	}
	public String getBgImageLink() {
		return bgImageLink;
	}
	public void setBgImageLink(String bgImageLink) {
		this.bgImageLink = bgImageLink;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public int getNoOfConnections() {
		return noOfConnections;
	}
	public void setNoOfConnections(int noOfConnections) {
		this.noOfConnections = noOfConnections;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
}
