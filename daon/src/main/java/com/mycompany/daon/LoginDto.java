package com.mycompany.daon;

public class LoginDto {

	String user_id;
	String user_pwd;
	int cnt;
	String result;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	
    public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
        this.result = result;
    }
}
