package spkt.Web.models;

import java.sql.Date;

public class CartModel {
    private Long maGioHang;
    private Long maNguoiDung;
    private Long maSP;
    private Integer soLuong;
    private Date thoiGianThem;

    public CartModel() {
	super();
    }

    public CartModel(Long maGioHang, Long maNguoiDung, Long maSP, Integer soLuong) {
	super();
	this.maGioHang = maGioHang;
	this.maNguoiDung = maNguoiDung;
	this.maSP = maSP;
	this.soLuong = soLuong;
    }

    public Long getMaGioHang() {
	return maGioHang;
    }

    public void setMaGioHang(Long maGioHang) {
	this.maGioHang = maGioHang;
    }

    public Long getMaNguoiDung() {
	return maNguoiDung;
    }

    public void setMaNguoiDung(Long maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
    }

    public Long getMaSP() {
	return maSP;
    }

    public void setMaSP(Long maSP) {
	this.maSP = maSP;
    }

    public Integer getSoLuong() {
	return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
	this.soLuong = soLuong;
    }

    public Date getThoiGianThem() {
	return thoiGianThem;
    }

    public void setThoiGianThem(Date thoiGianThem) {
	this.thoiGianThem = thoiGianThem;
    }

}
