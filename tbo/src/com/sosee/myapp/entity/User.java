package com.sosee.myapp.entity;

public class User {
	private int	id;
	private String	compName;
	private String	password;
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private String phono;
	private String	email;
	private String	slience;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhono() {
		return phono;
	}
	public void setPhono(String phono) {
		this.phono = phono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSlience() {
		return slience;
	}
	public void setSlience(String slience) {
		this.slience = slience;
	}
	

}
