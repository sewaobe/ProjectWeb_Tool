package spkt.Web.daos;

import java.util.List;

import spkt.Web.models.CartItemModel;
import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;
import spkt.Web.models.ProductModel;

public interface ProductDao {
    ProductModel findByID(Long id);

    ProductModel findByName(String name);

    List<ProductModel> getAllProduct();

    List<ProductModel> getAllProductByCategory(String category);

    Boolean addToWishList(Long idUser, Long idProduct);

    Boolean removeFromWishList(Long idUser, Long idProduct);

    Boolean addToCart(Long idUser, Long idProduct, Integer soLuong);

    Boolean addToSeenList(Long idUser, Long idProduct);

    List<CartItemModel> getAllProductOfCart(Long idUser);

    Boolean removeToCart(Long idUser, Long idProduct);

    List<ProductModel> getListProductPage(int page);

    List<ProductModel> getListProductCategoryPage(String category, int page);

    Integer getTotalProductCount();

    Integer getTotalProductCountByCategory(String category);

    Long checkOut(OrderModel order, List<CartItemModel> productsCart);

    void saveProduct(ProductModel product);

    Boolean deleteProduct(Long idProduct);

    List<ProductModel> getAllProductOfOrder(Long idOrder);

    List<DetailOrderModel> getChiTietHoaDonByMaHD(Long maHD);
}
