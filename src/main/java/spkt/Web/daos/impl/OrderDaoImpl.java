package spkt.Web.daos.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spkt.Web.daos.OrderDao;
import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<OrderModel> getAllOrder() {
	String query = "SELECT * FROM HoaDon";

	return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(OrderModel.class));
    }

    @Override
    public List<OrderModel> findOrderByIDUSer(Long idUser) {
	String query = "SELECT * FROM HoaDon WHERE MaNguoiDung = ?";

	return jdbcTemplate.query(query, new Object[] { idUser }, new BeanPropertyRowMapper<>(OrderModel.class));
    }

    @Override
    public Boolean updateOrderByIDUser(OrderModel order) {
	String sql = "UPDATE HoaDon SET TongTien = ?, TrangThai = ?, DiaChiGiaoHang = ?, PhuongThuc = ?, NguoiNhan = ?, GhiChu = ? WHERE MaHD = ?";
	int rowEffact = jdbcTemplate.update(sql, order.getTongTien(), order.getTrangThai(), order.getDiaChiGiaoHang(),
		order.getPhuongThuc(), order.getNguoiNhan(), order.getGhiChu(), order.getMaHD());
	if (order.getTrangThai().equals("Đã hủy")) {
	    String sqlUpdate = "UPDATE SanPham SET SoLuongTonKho += ? WHERE MaSP = ?";
	    List<DetailOrderModel> list = findDetailOrderByIDOrder(order.getMaHD());
	    for (DetailOrderModel detailOrderModel : list) {
		jdbcTemplate.update(sqlUpdate, detailOrderModel.getSoLuong(), detailOrderModel.getMaSP());
	    }
	}
	return rowEffact > 0;
    }

    @Override
    public List<DetailOrderModel> findDetailOrderByIDOrder(Long idOrder) {
	String query = "SELECT * FROM ChiTietHoaDon WHERE MaHD = ?";

	return jdbcTemplate.query(query, new Object[] { idOrder }, new BeanPropertyRowMapper<>(DetailOrderModel.class));
    }

    @Override
    public List<OrderModel> findOrderByStatus(String status) {
	String query = "SELECT * FROM HoaDon WHERE TrangThai = ?";

	return jdbcTemplate.query(query, new Object[] { status }, new BeanPropertyRowMapper<>(OrderModel.class));
    }

}
