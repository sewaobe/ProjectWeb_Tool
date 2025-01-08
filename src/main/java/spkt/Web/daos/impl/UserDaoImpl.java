package spkt.Web.daos.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spkt.Web.daos.UserDao;
import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public UserModel checkLogin(String userName, String passWord) {
	String sql = "SELECT * FROM NguoiDung WHERE TenDangNhap = ? AND MatKhau = ?";
	try {
	    return jdbcTemplate.queryForObject(sql, new Object[] { userName, passWord },
		    new BeanPropertyRowMapper<>(UserModel.class));
	} catch (EmptyResultDataAccessException e) {
	    // Trả về null nếu không tìm thấy người dùng
	    return null;
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }

    @Override
    public boolean registerUser(UserModel user) {
	String sql = "INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, Email, SDT, NgaySinh, DiaChi, Role) "
		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	try {
	    int rows = jdbcTemplate.update(sql, user.getTenDangNhap(), user.getMatKhau(), user.getHoTen(),
		    user.getEmail(), user.getSdt(), user.getNgaySinh(), user.getDiaChi(), "User"

	    );
	    return rows > 0;
	} catch (Exception e) {
	    e.printStackTrace();
	    return false;
	}
    }

    @Override
    public boolean editProfile(UserModel user) {
	Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
	String sql = "UPDATE NguoiDung SET HoTen = ?, Email = ?, SDT = ?, NgaySinh = ?, DiaChi = ?, UpdatedAt = ? WHERE MaNguoiDung = ?";
	return jdbcTemplate.update(sql, user.getHoTen(), user.getEmail(), user.getSdt(), user.getNgaySinh(),
		user.getDiaChi(), currentTimestamp, user.getMaNguoiDung()) > 0;
    }

    @Override
    public Boolean removeUser(Long idUser) {
	String query = "DELETE FROM NguoiDung WHERE MaNguoiDung = ?";
	int rowEffact = jdbcTemplate.update(query, idUser);

	return rowEffact > 0;

    }

    @Override
    public List<UserModel> getAllUser() {
	String query = "SELECT * FROM NguoiDung";

	return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(UserModel.class));
    }

    private List<ProductModel> getSanPhamByMaSP(List<Long> maSPList) {
	String inSql = String.join(",", maSPList.stream().map(String::valueOf).collect(Collectors.toList()));

	String sql = String.format("SELECT * FROM SanPham WHERE MaSP IN (%s)", inSql);

	return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductModel.class));
    }

    @Override
    public List<ProductModel> getAllWishList(Long idUser) {
	try {
	    String sql = "SELECT MaSP FROM SanPhamYeuThich WHERE MaNguoiDung = ?";
	    List<Long> idSPList = jdbcTemplate.queryForList(sql, new Object[] { idUser }, Long.class);

	    return getSanPhamByMaSP(idSPList);
	} catch (Exception e) {
	    return null;
	}

    }

    @Override
    public void updatePassword(Long idUser, String passWord) {
	String query = "UPDATE NguoiDung SET MatKhau = ? WHERE MaNguoiDung = ?";
	jdbcTemplate.update(query, passWord, idUser);
    }

}
