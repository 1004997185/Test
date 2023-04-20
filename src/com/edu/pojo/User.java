package com.edu.pojo;

public class User {
    private int userId;
    private String userNo;
    private String userPwd;
    private String userName;
    private String userSex;
    private String userEmail;
    private String gradeName;
    
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public User(int userId, String userNo, String userPwd, String userName, String userSex, String userEmail,
			String gradeName) {
		super();
		this.userId = userId;
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userSex = userSex;
		this.userEmail = userEmail;
		this.gradeName = gradeName;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userNo=" + userNo + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userSex=" + userSex + ", userEmail=" + userEmail + ", gradeName=" + gradeName + "]";
	}
      
}
