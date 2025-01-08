package spkt.Web.models;

import java.math.BigDecimal;
import java.sql.Date;

public class CartItemModel {
    private Long maSP;
    private String ten;
    private String moTa;
    private BigDecimal gia;
    private Integer soLuongTonKho;
    private String hinhAnh;
    private Integer soLuongGioHang;
    private Date thoiGianThem;

    public CartItemModel() {
	super();
    }

    public CartItemModel(Long maSP, String ten, String moTa, BigDecimal gia, Integer soLuongTonKho, String hinhAnh,
	    Integer soLuongGioHang) {
	super();
	this.maSP = maSP;
	this.ten = ten;
	this.moTa = moTa;
	this.gia = gia;
	this.soLuongTonKho = soLuongTonKho;
	this.hinhAnh = hinhAnh;
	this.soLuongGioHang = soLuongGioHang;
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

    public Integer getSoLuongGioHang() {
	return soLuongGioHang;
    }

    public void setSoLuongGioHang(Integer soLuongGioHang) {
	this.soLuongGioHang = soLuongGioHang;
    }

    public Date getThoiGianThem() {
	return thoiGianThem;
    }

    public void setThoiGianThem(Date thoiGianThem) {
	this.thoiGianThem = thoiGianThem;
    }

}
