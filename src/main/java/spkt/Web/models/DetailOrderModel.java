package spkt.Web.models;

public class DetailOrderModel {
    private Long maChiTietHD;
    private Long maHD;
    private Long maSP;
    private Integer soLuong;
    private Double donGia;

    public DetailOrderModel() {
	super();
    }

    public DetailOrderModel(Long maChiTietHD, Long maHD, Long maSP, Integer soLuong, Double donGia) {
	super();
	this.maChiTietHD = maChiTietHD;
	this.maHD = maHD;
	this.maSP = maSP;
	this.soLuong = soLuong;
	this.donGia = donGia;
    }

    public Long getMaChiTietHD() {
	return maChiTietHD;
    }

    public void setMaChiTietHD(Long maChiTietHD) {
	this.maChiTietHD = maChiTietHD;
    }

    public Long getMaHD() {
	return maHD;
    }

    public void setMaHD(Long maHD) {
	this.maHD = maHD;
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

    public Double getDonGia() {
	return donGia;
    }

    public void setDonGia(Double donGia) {
	this.donGia = donGia;
    }

}
