package spkt.Web.models;

import java.sql.Date;

public class ProductSeenModel {
    private Long maXem;
    private Long maNguoiDung;
    private Long maSP;
    private Date thoiGianXem;

    public ProductSeenModel() {
	super();
    }

    public ProductSeenModel(Long maXem, Long maNguoiDung, Long maSP) {
	super();
	this.maXem = maXem;
	this.maNguoiDung = maNguoiDung;
	this.maSP = maSP;
    }

    public Long getMaXem() {
	return maXem;
    }

    public void setMaXem(Long maXem) {
	this.maXem = maXem;
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

    public Date getThoiGianXem() {
	return thoiGianXem;
    }

    public void setThoiGianXem(Date thoiGianXem) {
	this.thoiGianXem = thoiGianXem;
    }

}
