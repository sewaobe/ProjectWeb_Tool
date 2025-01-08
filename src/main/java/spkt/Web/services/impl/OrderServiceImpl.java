package spkt.Web.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spkt.Web.daos.OrderDao;
import spkt.Web.models.DetailOrderModel;
import spkt.Web.models.OrderModel;
import spkt.Web.services.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;

    @Override
    public List<OrderModel> getAllOrder() {
	// TODO Auto-generated method stub
	return orderDao.getAllOrder();
    }

    @Override
    public List<OrderModel> findOrderByIDUSer(Long idUser) {
	// TODO Auto-generated method stub
	return orderDao.findOrderByIDUSer(idUser);
    }

    @Override
    public Boolean updateOrderByIDUser(OrderModel order) {
	// TODO Auto-generated method stub
	return orderDao.updateOrderByIDUser(order);
    }

    @Override
    public List<DetailOrderModel> findDetailOrderByIDOrder(Long idOrder) {
	// TODO Auto-generated method stub
	return orderDao.findDetailOrderByIDOrder(idOrder);
    }

    @Override
    public List<OrderModel> findOrderByStatus(String status) {
	// TODO Auto-generated method stub
	return orderDao.findOrderByStatus(status);
    }

}
