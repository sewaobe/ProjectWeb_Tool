package spkt.Web.models;

import java.sql.Date;

public class PasswordResetTokenModel {
    private Long id;
    private String email;
    private String token;
    private Date createdAt;

    public PasswordResetTokenModel(Long id, String email, String token, Date createdAt) {
	super();
	this.id = id;
	this.email = email;
	this.token = token;
	this.createdAt = createdAt;
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getToken() {
	return token;
    }

    public void setToken(String token) {
	this.token = token;
    }

    public Date getCreatedAt() {
	return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
    }

}
