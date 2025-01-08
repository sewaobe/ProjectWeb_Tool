package spkt.Web.models;

import java.sql.Date;

public class UserModel {
    private Long maNguoiDung;
    private String tenDangNhap;
    private String matKhau;
    private String hoTen;
    private String email;
    private String sdt;
    private Date ngaySinh;
    private String diaChi;
    private String role;

    public UserModel() {
	super();
    }

    public UserModel(Long maNguoiDung, String tenDangNhap, String matKhau, String hoTen, String email, String sdt,
	    Date ngaySinh, String diaChi, String role) {
	super();
	this.maNguoiDung = maNguoiDung;
	this.tenDangNhap = tenDangNhap;
	this.matKhau = matKhau;
	this.hoTen = hoTen;
	this.email = email;
	this.sdt = sdt;
	this.ngaySinh = ngaySinh;
	this.diaChi = diaChi;
	this.role = role;
    }

    public Long getMaNguoiDung() {
	return maNguoiDung;
    }

    public void setMaNguoiDung(Long maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
    }

    public String getTenDangNhap() {
	return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
	this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
	return matKhau;
    }

    public void setMatKhau(String matKhau) {
	this.matKhau = matKhau;
    }

    public String getHoTen() {
	return hoTen;
    }

    public void setHoTen(String hoTen) {
	this.hoTen = hoTen;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getSdt() {
	return sdt;
    }

    public void setSdt(String sdt) {
	this.sdt = sdt;
    }

    public Date getNgaySinh() {
	return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
	this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
	return diaChi;
    }

    public void setDiaChi(String diaChi) {
	this.diaChi = diaChi;
    }

    public String getRole() {
	return role;
    }

    public void setRole(String role) {
	this.role = role;
    }

}
