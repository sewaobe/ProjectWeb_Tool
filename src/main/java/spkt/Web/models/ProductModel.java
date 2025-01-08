package spkt.Web.models;

import java.math.BigDecimal;
import java.sql.Date;

public class ProductModel {
    private Long maSP;
    private String ten;
    private String moTa;
    private BigDecimal gia;
    private Integer soLuongTonKho;
    private String hinhAnh;
    private String loaiSanPham;
    private Date createdAt;
    private Date updatedAt;

    public ProductModel() {
	super();
    }

    public ProductModel(Long maSP, String ten, String moTa, BigDecimal gia, Integer soLuongTonKho, String hinhAnh,
	    String loaiSanPham) {
	super();
	this.maSP = maSP;
	this.ten = ten;
	this.moTa = moTa;
	this.gia = gia;
	this.soLuongTonKho = soLuongTonKho;
	this.hinhAnh = hinhAnh;
	this.loaiSanPham = loaiSanPham;
    }

    public Long getMaSP() {
	return maSP;
    }

    public void setMaSP(Long maSP) {
	this.maSP = maSP;
    }

    public String getTen() {
	return ten;
    }

    public void setTen(String ten) {
	this.ten = ten;
    }

    public String getMoTa() {
	return moTa;
    }

    public void setMoTa(String moTa) {
	this.moTa = moTa;
    }

    public BigDecimal getGia() {
	return gia;
    }

    public void setGia(BigDecimal gia) {
	this.gia = gia;
    }

    public Integer getSoLuongTonKho() {
	return soLuongTonKho;
    }

    public void setSoLuongTonKho(Integer soLuongTonKho) {
	this.soLuongTonKho = soLuongTonKho;
    }

    public String getHinhAnh() {
	return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
	this.hinhAnh = hinhAnh;
    }

    public String getLoaiSanPham() {
	return loaiSanPham;
    }

    public void setLoaiSanPham(String loaiSanPham) {
	this.loaiSanPham = loaiSanPham;
    }

    public Date getCreatedAt() {
	return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
	return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
    }

}
