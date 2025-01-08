package spkt.Web.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spkt.Web.daos.ProductDao;
import spkt.Web.models.CartItemModel;
import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;
import spkt.Web.models.ProductModel;
import spkt.Web.services.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDao productDao;

    @Override
    public ProductModel findById(Long id) {
	// TODO Auto-generated method stub
	return productDao.findByID(id);
    }

    @Override
    public List<ProductModel> getAllProduct() {
	// TODO Auto-generated method stub
	return productDao.getAllProduct();
    }

    @Override
    public Boolean addToWishList(Long idUser, Long idProduct) {
	// TODO Auto-generated method stub
	return productDao.addToWishList(idUser, idProduct);
    }

    @Override
    public Boolean removeFromWishList(Long idUser, Long idProduct) {
	// TODO Auto-generated method stub
	return productDao.removeFromWishList(idUser, idProduct);
    }

    @Override
    public Boolean addToCart(Long idUser, Long idProduct, Integer soLuong) {
	// TODO Auto-generated method stub
	return productDao.addToCart(idUser, idProduct, soLuong);
    }

    @Override
    public Boolean addToSeenList(Long idUser, Long idProduct) {
	// TODO Auto-generated method stub
	return productDao.addToSeenList(idUser, idProduct);
    }

    @Override
    public List<CartItemModel> getAllProductOfCart(Long idUser) {
	// TODO Auto-generated method stub
	return productDao.getAllProductOfCart(idUser);
    }

    @Override
    public Boolean removeToCart(Long idUser, Long idProduct) {
	// TODO Auto-generated method stub
	return productDao.removeToCart(idUser, idProduct);
    }

    @Override
    public List<ProductModel> getAllProductByCategory(String category) {
	// TODO Auto-generated method stub
	return productDao.getAllProductByCategory(category);
    }

    @Override
    public List<ProductModel> getListProductPage(int page) {
	// TODO Auto-generated method stub
	return productDao.getListProductPage(page);
    }

    @Override
    public List<ProductModel> getListProductCategoryPage(String category, int page) {
	// TODO Auto-generated method stub
	return productDao.getListProductCategoryPage(category, page);
    }

    @Override
    public Integer getTotalPages() {
	// TODO Auto-generated method stub
	int totalProducts = productDao.getTotalProductCount();
	return (int) Math.ceil((double) totalProducts / 12);
    }

    @Override
    public Integer getTotalPagesByCategory(String category) {
	// TODO Auto-generated method stub
	int totalProducts = productDao.getTotalProductCountByCategory(category);
	return (int) Math.ceil((double) totalProducts / 12);
    }

    @Override
    public Long checkOut(OrderModel order, List<CartItemModel> productsCart) {
	// TODO Auto-generated method stub
	return productDao.checkOut(order, productsCart);
    }

    @Override
    public void saveProduct(ProductModel product) {
	// TODO Auto-generated method stub
	productDao.saveProduct(product);
    }

    @Override
    public Boolean deleteProduct(Long idProduct) {
	// TODO Auto-generated method stub
	return productDao.deleteProduct(idProduct);
    }

    @Override
    public List<ProductModel> getAllProductOfOrder(Long idOrder) {
	// TODO Auto-generated method stub
	return productDao.getAllProductOfOrder(idOrder);
    }

    @Override
    public List<DetailOrderModel> getChiTietHoaDonByMaHD(Long maHD) {
	// TODO Auto-generated method stub
	return productDao.getChiTietHoaDonByMaHD(maHD);
    }

    @Override
    public ProductModel findByName(String name) {
	// TODO Auto-generated method stub
	return productDao.findByName(name);
    }

}
