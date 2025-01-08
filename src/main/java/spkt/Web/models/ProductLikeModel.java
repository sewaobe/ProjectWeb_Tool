package spkt.Web.models;

import java.sql.Date;

public class ProductLikeModel {
    private Long maYeuThich;
    private Long maNguoiDung;
    private Long maSP;
    private Date thoiGianThem;

    public ProductLikeModel() {
	super();
    }

    public ProductLikeModel(Long maYeuThich, Long maNguoiDung, Long maSP) {
	super();
	this.maYeuThich = maYeuThich;
	this.maNguoiDung = maNguoiDung;
	this.maSP = maSP;
    }

    public Long getMaYeuThich() {
	return maYeuThich;
    }

    public void setMaYeuThich(Long maYeuThich) {
	this.maYeuThich = maYeuThich;
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

    public Date getThoiGianThem() {
	return thoiGianThem;
    }

    public void setThoiGianThem(Date thoiGianThem) {
	this.thoiGianThem = thoiGianThem;
    }

}
