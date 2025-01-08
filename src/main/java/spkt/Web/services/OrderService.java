package spkt.Web.services;

import java.util.List;

import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;

public interface OrderService {
    List<OrderModel> getAllOrder();

    List<OrderModel> findOrderByIDUSer(Long idUser);

    Boolean updateOrderByIDUser(OrderModel order);

    List<DetailOrderModel> findDetailOrderByIDOrder(Long idOrder);

    List<OrderModel> findOrderByStatus(String status);

}
