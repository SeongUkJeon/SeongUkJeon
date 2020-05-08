package com.itbank.dao;

public class MemberRequest { // 회원가입, 회원정보수정 시 비밀번호 중복 확인 입력 시 사용
	private String username, userpw, userid, userpwb, address, phone, gender, email, birth;
	private int withdrawal;

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(int withdrawal) {
		this.withdrawal = withdrawal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isSamePassword() { // 비밀번호 확인 제대로 입력했는지
		return userpw.equals(userpwb);
	}
	
	public String getUserpwb() {
		return userpwb;
	}

	public void setUserpwb(String userpwb) {
		this.userpwb = userpwb;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}