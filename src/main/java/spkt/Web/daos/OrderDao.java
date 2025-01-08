package spkt.Web.daos;

import java.util.List;

import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;

public interface OrderDao {
    List<OrderModel> getAllOrder();

    List<OrderModel> findOrderByIDUSer(Long idUser);

    List<OrderModel> findOrderByStatus(String status);

    Boolean updateOrderByIDUser(OrderModel order);

    List<DetailOrderModel> findDetailOrderByIDOrder(Long idOrder);

}
