package spkt.Web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import spkt.Web.models.CartItemModel;
import spkt.Web.models.OrderModel;
import spkt.Web.models.UserModel;
import spkt.Web.services.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    ProductService productService;

    @GetMapping()
    public String Index(HttpSession session, ModelMap model) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");

	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());

	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		session.setAttribute("productsCart", listCartItemModels);
		model.addAttribute("productsCart", listCartItemModels);
		model.addAttribute("context", "User/cart.jsp");
		return "User/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";
    }

    @GetMapping("/checkout")
    public String CheckOut(HttpSession session, ModelMap model) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");

	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		session.setAttribute("productsCart", listCartItemModels);
		model.addAttribute("productsCart", listCartItemModels);
		model.addAttribute("user", user);
		model.addAttribute("context", "User/checkOut.jsp");
		return "User/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";
    }

    @PostMapping("/checkout")
    public String CheckOut(HttpSession session, ModelMap model, @RequestBody OrderModel orderModel) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<CartItemModel> cartItemModels = (List<CartItemModel>) session.getAttribute("productsCart");
	    if (orderModel.getPhuongThuc().equals("0")) {
		orderModel.setPhuongThuc("Thanh toán khi nhận hàng");
	    } else {
		orderModel.setPhuongThuc("Chuyển khoản");
	    }
	    Long maHD = productService.checkOut(orderModel, cartItemModels);
	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());

	    if (user != null) {
		session.setAttribute("productsCart", listCartItemModels);
		model.addAttribute("productsCart", listCartItemModels);
		model.addAttribute("user", user);
		model.addAttribute("context", "User/checkOut.jsp");
		return "User/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";
    }
}
