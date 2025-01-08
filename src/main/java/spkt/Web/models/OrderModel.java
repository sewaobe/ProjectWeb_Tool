package spkt.Web.models;

import java.sql.Date;

public class OrderModel {
    private Long maHD;
    private Long maNguoiDung;
    private Double tongTien;
    private Date ngayDatHang;
    private String trangThai;
    private String diaChiGiaoHang;
    private String phuongThuc;
    private String nguoiNhan;
    private String ghiChu;

    public OrderModel() {
	super();
    }

    public OrderModel(Long maHD, Long maNguoiDung, Double tongTien, Date ngayDatHang, String trangThai,
	    String diaChiGiaoHang, String phuongThuc, String nguoiNhan, String ghiChu) {
	super();
	this.maHD = maHD;
	this.maNguoiDung = maNguoiDung;
	this.tongTien = tongTien;
	this.ngayDatHang = ngayDatHang;
	this.trangThai = trangThai;
	this.diaChiGiaoHang = diaChiGiaoHang;
	this.phuongThuc = phuongThuc;
	this.nguoiNhan = nguoiNhan;
	this.ghiChu = ghiChu;
    }

    public Long getMaHD() {
	return maHD;
    }

    public void setMaHD(Long maHD) {
	this.maHD = maHD;
    }

    public Long getMaNguoiDung() {
	return maNguoiDung;
    }

    public void setMaNguoiDung(Long maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
    }

    public Double getTongTien() {
	return tongTien;
    }

    public void setTongTien(Double tongTien) {
	this.tongTien = tongTien;
    }

    public Date getNgayDatHang() {
	return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
	this.ngayDatHang = ngayDatHang;
    }

    public String getTrangThai() {
	return trangThai;
    }

    public void setTrangThai(String trangThai) {
	this.trangThai = trangThai;
    }

    public String getDiaChiGiaoHang() {
	return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
	this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public String getPhuongThuc() {
	return phuongThuc;
    }

    public void setPhuongThuc(String phuongThuc) {
	this.phuongThuc = phuongThuc;
    }

    public String getNguoiNhan() {
	return nguoiNhan;
    }

    public void setNguoiNhan(String nguoiNhan) {
	this.nguoiNhan = nguoiNhan;
    }

    public String getGhiChu() {
	return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
	this.ghiChu = ghiChu;
    }

}
