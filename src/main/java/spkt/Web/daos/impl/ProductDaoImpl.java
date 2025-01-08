package spkt.Web.daos.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spkt.Web.daos.ProductDao;
import spkt.Web.models.CartItemModel;
import spkt.Web.models.CartModel;
import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;
import spkt.Web.models.ProductModel;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public ProductModel findByID(Long id) {
	String query = "SELECT * FROM SanPham WHERE MaSP = ?";

	return jdbcTemplate.queryForObject(query, new Object[] { id }, new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public List<ProductModel> getAllProduct() {
	String query = "SELECT * FROM SanPham";
	return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public Boolean addToWishList(Long idUser, Long idProduct) {
	String sql = "INSERT INTO SanPhamYeuThich(MaNguoiDung, MaSP) VALUES (?, ?)";

	try {
	    // Thực hiện truy vấn và kiểm tra kết quả
	    int flag = jdbcTemplate.update(sql, idUser, idProduct);
	    return flag > 0; // Trả về true nếu thêm thành công
	} catch (Exception e) {
	    // Log lỗi nếu cần thiết
	    e.printStackTrace();
	    return false; // Trả về false nếu có lỗi
	}
    }

    @Override
    public Boolean removeFromWishList(Long idUser, Long idProduct) {
	String sql = "DELETE FROM SanPhamYeuThich WHERE MaNguoiDung = ? AND MaSP = ?";

	try {
	    // Thực hiện truy vấn và kiểm tra kết quả
	    int flag = jdbcTemplate.update(sql, idUser, idProduct);
	    return flag > 0; // Trả về true nếu xóa thành công
	} catch (Exception e) {
	    // Log lỗi nếu cần thiết
	    e.printStackTrace();
	    return false; // Trả về false nếu có lỗi
	}
    }

    private CartModel findByIdToCart(Long idUser, Long idProduct) {
	try {
	    String query = "SELECT * FROM GioHang WHERE MaNguoiDung = ? AND MaSP = ?";
	    return jdbcTemplate.queryForObject(query, new Object[] { idUser, idProduct },
		    new BeanPropertyRowMapper<>(CartModel.class));
	} catch (Exception e) {
	    // TODO: handle exception
	    return null;
	}
    }

    @Override
    public Boolean addToCart(Long idUser, Long idProduct, Integer soLuong) {
	String sql = "INSERT INTO GioHang(MaNguoiDung, MaSP, SoLuong) VALUES (?, ?, ?)";
	int flag;
	try {
	    CartModel cartModel = findByIdToCart(idUser, idProduct);
	    if (cartModel != null) {
		sql = "UPDATE GioHang SET SoLuong += ? WHERE MaNguoiDung = ? AND MaSP = ?";
		flag = jdbcTemplate.update(sql, soLuong, idUser, idProduct);
	    } else {
		flag = jdbcTemplate.update(sql, idUser, idProduct, soLuong);
	    }
	    return flag > 0; // Trả về true nếu thêm thành công
	} catch (Exception e) {
	    e.printStackTrace();
	    return false; // Trả về false nếu có lỗi
	}
    }

    @Override
    public Boolean addToSeenList(Long idUser, Long idProduct) {
	String query = "INSERT INTO SanPhamDaXem(MaNguoiDung, MaSP) VALUES (?,?)";
	int flag = jdbcTemplate.update(query, idUser, idProduct);
	return flag > 0;
    }

    @Override
    public List<CartItemModel> getAllProductOfCart(Long idUser) {
	String query = "SELECT s.MaSP, s.Ten, s.MoTa, s.Gia, s.SoLuongTonKho, s.hinhAnh, g.SoLuong AS SoLuongGioHang, g.ThoiGianThem "
		+ "FROM GioHang g " + "JOIN SanPham s ON g.MaSP = s.MaSP " + "WHERE g.MaNguoiDung = ?";

	return jdbcTemplate.query(query, new Object[] { idUser }, new BeanPropertyRowMapper<>(CartItemModel.class));
    }

    @Override
    public Boolean removeToCart(Long idUser, Long idProduct) {
	String sql = "DELETE FROM GioHang WHERE MaNguoiDung = ? AND MaSP = ?";

	try {
	    // Thực hiện truy vấn và kiểm tra kết quả
	    int flag = jdbcTemplate.update(sql, idUser, idProduct);
	    return flag > 0; // Trả về true nếu xóa thành công
	} catch (Exception e) {
	    // Log lỗi nếu cần thiết
	    e.printStackTrace();
	    return false; // Trả về false nếu có lỗi
	}
    }

    @Override
    public List<ProductModel> getAllProductByCategory(String category) {
	String query = "SELECT * FROM SanPham WHERE LoaiSanPham = ?";
	return jdbcTemplate.query(query, new Object[] { category }, new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public Integer getTotalProductCount() {
	String countQuery = "SELECT COUNT(*) FROM SanPham";
	return jdbcTemplate.queryForObject(countQuery, Integer.class);
    }

    @Override
    public List<ProductModel> getListProductPage(int page) {
	int offset = (page - 1) * 12;
	String query = "SELECT * FROM SanPham LIMIT ? OFFSET ?";
	return jdbcTemplate.query(query, new Object[] { 12, offset }, new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public List<ProductModel> getListProductCategoryPage(String category, int page) {
	int offset = (page - 1) * 12;
	String query = "SELECT * FROM SanPham WHERE loaiSanPham = ? LIMIT ? OFFSET ?";
	return jdbcTemplate.query(query, new Object[] { category, 12, offset },
		new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public Integer getTotalProductCountByCategory(String category) {
	String countQuery = "SELECT COUNT(*) FROM SanPham WHERE LoaiSanPham = ?";
	return jdbcTemplate.queryForObject(countQuery, new Object[] { category }, Integer.class);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long checkOut(OrderModel order, List<CartItemModel> productsCart) {
	try {
	    String sqlInsertHoaDon = "INSERT INTO HoaDon (MaNguoiDung, TongTien, NgayDatHang, TrangThai, DiaChiGiaoHang, PhuongThuc, NguoiNhan, GhiChu) "
		    + "OUTPUT INSERTED.MaHD " + "VALUES (?, ?, GETDATE(), N'Chờ xác nhận', ?, ?, ?, ?)";

	    Long maHD = jdbcTemplate.queryForObject(sqlInsertHoaDon, Long.class, order.getMaNguoiDung(),
		    order.getTongTien(), order.getDiaChiGiaoHang(), order.getPhuongThuc(), order.getNguoiNhan(),
		    order.getGhiChu());
	    // 2. Insert vào bảng ChiTietHoaDon
	    String sqlInsertChiTiet = "INSERT INTO ChiTietHoaDon (MaHD, MaSP, SoLuong, DonGia) VALUES (?, ?, ?, ?)";

	    // 3.Xóa sản phẩm trong giỏ hàng
	    String sqlDeleteGioHang = "DELETE FROM GioHang WHERE MaNguoiDung = ? AND MaSP = ?";

	    String sqlUpdateSoLuong = "UPDATE SanPham SET SoLuongTonKho = ? WHERE MaSP = ?";

	    for (CartItemModel item : productsCart) {
		jdbcTemplate.update(sqlInsertChiTiet, maHD, item.getMaSP(), item.getSoLuongGioHang(), item.getGia());
		jdbcTemplate.update(sqlDeleteGioHang, order.getMaNguoiDung(), item.getMaSP());
		jdbcTemplate.update(sqlUpdateSoLuong, item.getSoLuongTonKho() - item.getSoLuongGioHang(),
			item.getMaSP());
	    }

	    return maHD;

	} catch (Exception e) {
	    // TODO: handle exception
	    throw new RuntimeException("Lỗi khi xử lý đơn hàng: " + e.getMessage());
	}

    }

    @Override
    public void saveProduct(ProductModel product) {
	String sql;
	if (product.getMaSP() == 0) {

	    sql = "INSERT INTO SanPham(Ten, MoTa, Gia, SoLuongTonKho, LoaiSanPham, hinhAnh) VALUES (?, ?, ?, ?, ?, ?)";
	    jdbcTemplate.update(sql, product.getTen(), product.getMoTa(), product.getGia(), product.getSoLuongTonKho(),
		    product.getLoaiSanPham(), product.getHinhAnh());

	} else {

	    sql = "UPDATE SanPham SET Ten = ?, MoTa = ?, Gia = ?, SoLuongTonKho = ?, LoaiSanPham = ?, hinhAnh = ?, UpdatedAt = ? WHERE MaSP = ?";
	    // Lấy thời gian hiện tại
	    Timestamp currentTime = new Timestamp(System.currentTimeMillis());

	    jdbcTemplate.update(sql, product.getTen(), product.getMoTa(), product.getGia(), product.getSoLuongTonKho(),
		    product.getLoaiSanPham(), product.getHinhAnh(), currentTime, // Sử dụng thời gian hiện tại
		    product.getMaSP());
	}

    }

    @Override
    public Boolean deleteProduct(Long idProduct) {
	String sql = "DELETE FROM SanPham WHERE MaSP = ?";

	try {
	    // Thực hiện truy vấn và kiểm tra kết quả
	    int flag = jdbcTemplate.update(sql, idProduct);
	    return flag > 0; // Trả về true nếu xóa thành công
	} catch (Exception e) {
	    // Log lỗi nếu cần thiết
	    e.printStackTrace();
	    return false; // Trả về false nếu có lỗi
	}
    }

    @Override
    public List<DetailOrderModel> getChiTietHoaDonByMaHD(Long maHD) {
	String sql = "SELECT * FROM ChiTietHoaDon WHERE MaHD = ?";
	return jdbcTemplate.query(sql, new Object[] { maHD }, new BeanPropertyRowMapper<>(DetailOrderModel.class));
    }

    private List<ProductModel> getSanPhamByMaSP(List<Long> maSPList) {
	String inSql = String.join(",", maSPList.stream().map(String::valueOf).collect(Collectors.toList()));

	String sql = String.format("SELECT * FROM SanPham WHERE MaSP IN (%s)", inSql);

	return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public List<ProductModel> getAllProductOfOrder(Long idOrder) {
	List<DetailOrderModel> chiTietHoaDonList = getChiTietHoaDonByMaHD(idOrder);

	// Lấy danh sách MaSP từ ChiTietHoaDon
	List<Long> maSPList = chiTietHoaDonList.stream().map(DetailOrderModel::getMaSP).collect(Collectors.toList());
	List<ProductModel> list = getSanPhamByMaSP(maSPList);
	for (ProductModel productModel : list) {
	    for (DetailOrderModel detailOrderModel : chiTietHoaDonList) {
		if (detailOrderModel.getMaSP() == productModel.getMaSP()) {
		    productModel.setSoLuongTonKho(detailOrderModel.getSoLuong());
		}
	    }
	}
	// Lấy thông tin sản phẩm từ bảng SanPham dựa trên danh sách MaSP
	return list;
    }

    @Override
    public ProductModel findByName(String name) {
	String sql = "SELECT TOP 1 * FROM SanPham WHERE LOWER(ten) LIKE ?";

	// Chuẩn hóa từ khóa: thay thế dấu gạch ngang và dấu cách thành khoảng trắng
	String searchKeyword = "%" + name + "%";
	try {
	    return jdbcTemplate.queryForObject(sql, new Object[] { searchKeyword },
		    new BeanPropertyRowMapper<>(ProductModel.class));
	} catch (EmptyResultDataAccessException e) {
	    return null;
	}
    }

}
