package spkt.Web.controllers;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import spkt.Web.models.CartItemModel;
import spkt.Web.models.OrderModel;
import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;
import spkt.Web.services.OrderService;
import spkt.Web.services.ProductService;
import spkt.Web.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;
    @Autowired
    OrderService orderService;

    @GetMapping()
    public String Index(ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
	    if (user == null) {
		return "redirect:/login";
	    }

	    List<ProductModel> listProduct = productService.getAllProduct();
	    List<ProductModel> productsOnPage = listProduct.subList(0, Math.min(8, listProduct.size()));

	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());
	    List<String> productNames = new ArrayList<>();
	    for (ProductModel product : listProduct) {
		productNames.add(product.getTen()); // Lấy tên sản phẩm
	    }
	    // Duyệt qua từng sản phẩm trong danh sách và lấy tên

	    // Lưu thông tin giỏ hàng vào session
	    session.setAttribute("productsCart", listCartItemModels);
	    model.addAttribute("productsCart", listCartItemModels);
	    model.addAttribute("productNames", productNames);
	    model.addAttribute("listProduct", productsOnPage);
	    model.addAttribute("context", "Home/home.jsp");

	    return "User/index";
	} catch (Exception e) {
	    return "redirect:/";
	}

    }

    @GetMapping("/signout")
    public String logOut(HttpSession session) {
	session.removeAttribute("user");
	return "redirect:/";
    }

    @GetMapping("/message")
    public String message(HttpSession session) {
	return "access-success";
    }

    @GetMapping("/profile")
    public String profile(ModelMap model, HttpSession session,
	    @RequestParam(value = "updated", required = false) String updated) {
	UserModel user = (UserModel) session.getAttribute("user");
	if (user == null) {
	    return "redirect:/login"; // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
	}
	if ("true".equals(updated)) {
	    model.addAttribute("success", "Hồ sơ đã được cập nhật thành công!");
	}
	model.addAttribute("productsCart", session.getAttribute("productsCart"));
	model.addAttribute("title", "HỒ SƠ CỦA TÔI");
	model.addAttribute("titleTwo", "Quản lý thông tin hồ sơ để bảo mật tài khoản");

	model.addAttribute("contextProfile", "Common/info.jsp");
	model.addAttribute("context", "Common/Profile.jsp");
	model.addAttribute("user", user);

	return "User/index";
    }

    @GetMapping("/profile/changepassword")
    public String password(ModelMap model, HttpSession session) {
	UserModel user = (UserModel) session.getAttribute("user");
	if (user == null) {
	    return "redirect:/login"; // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
	}
	model.addAttribute("title", "THAY ĐỔI MẬT KHẨU");
	model.addAttribute("titleTwo", "Bạn nên cập nhập mật khẩu thường xuyên vì lý do bảo mật");
	model.addAttribute("contextProfile", "Common/ChangePassword.jsp");
	model.addAttribute("context", "Common/Profile.jsp");
	model.addAttribute("user", user);

	return "User/index";
    }

    @PostMapping("/profile/changepassword")
    public String resetPassword(ModelMap model, HttpSession session, @RequestParam("oldpassword") String oldPass,
	    @RequestParam("newpassword") String newPass, @RequestParam("repassword") String reNewPass) {
	UserModel user = (UserModel) session.getAttribute("user");
	if (user == null) {
	    return "redirect:/login"; // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
	}
	model.addAttribute("title", "THAY ĐỔI MẬT KHẨU");
	model.addAttribute("titleTwo", "Bạn nên cập nhập mật khẩu thường xuyên vì lý do bảo mật");
	model.addAttribute("contextProfile", "Common/ChangePassword.jsp");
	model.addAttribute("context", "Common/Profile.jsp");
	model.addAttribute("user", user);
	if (!user.getMatKhau().equals(oldPass)) {
	    model.addAttribute("error", "Vui lòng nhập đúng mật khẩu cũ!!!!");
	    return "User/index";

	} else if (!newPass.equals(reNewPass)) {
	    model.addAttribute("error", "Mật khẩu mới và mật khẩu xác nhận không khớp.");
	    return "User/index";

	} else if (newPass.length() < 6) {
	    model.addAttribute("error", "Mật khẩu mới phải có ít nhất 6 ký tự.");
	    return "User/index";

	}
	userService.updatePassword(user.getMaNguoiDung(), newPass);
	model.addAttribute("success", "Mật khẩu đã được cập nhật thành công");

	return "User/index";
    }

    @GetMapping("/order")
    public String order(ModelMap model, HttpSession session) {
	UserModel user = (UserModel) session.getAttribute("user");
	if (user == null) {
	    return "redirect:/login"; // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
	}
	List<OrderModel> listOrderModels = orderService.findOrderByIDUSer(user.getMaNguoiDung());
	List<String> colsHeader = Arrays.asList("Mã đơn hàng", "Tổng tiền", "Ngày đặt hàng", "Địa chỉ giao hàng",
		"Phương thức", "Người nhận", "Trạng thái");

	model.addAttribute("productsCart", session.getAttribute("productsCart"));
	model.addAttribute("colsHeader", colsHeader);
	model.addAttribute("listOrderModels", listOrderModels);
	model.addAttribute("contextProfile", "Common/orderHistory.jsp");
	model.addAttribute("context", "Common/Profile.jsp");
	model.addAttribute("user", user);

	return "User/index";
    }

    @GetMapping(value = "/order/details", params = "q")
    public String Products(ModelMap model, HttpSession session, @RequestParam("q") Long idOrder) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<ProductModel> listProductModels = productService.getAllProductOfOrder(idOrder);
	    List<String> colsHeader = Arrays.asList("Mã sản phẩm", "Hình ảnh", "Tên sản phẩm", "Giá", "Số lượng",
		    "Loại sản phẩm", "Thời gian tạo", "Thời gian chỉnh sửa");
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {

		model.addAttribute("productsCart", session.getAttribute("productsCart"));
		model.addAttribute("listProductModels", listProductModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Chi tiết hóa đơn " + idOrder + " (Sản phẩm)");
		model.addAttribute("contextProfile", "Common/orderDetailHistory.jsp");
		model.addAttribute("context", "Common/Profile.jsp");
		return "User/index";
	    }
	} catch (Exception e) {
	    return "redirect:/error";
	}
	return "redirect:/error";

    }

    @GetMapping("/wishlist")
    public String wishList(ModelMap model, HttpSession session) {
	UserModel user = (UserModel) session.getAttribute("user");
	if (user == null) {
	    return "redirect:/login"; // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
	}
	List<ProductModel> productList = userService.getAllWishList(user.getMaNguoiDung());
	model.addAttribute("title", "Sản Phẩm Yêu Thích");
	model.addAttribute("titleTwo", "Hãy tym sản phẩm bạn yêu thích để xem thuận tiện hơn");
	model.addAttribute("productsCart", session.getAttribute("productsCart"));
	model.addAttribute("productList", productList);
	model.addAttribute("contextProfile", "Common/wishList.jsp");
	model.addAttribute("context", "Common/Profile.jsp");
	model.addAttribute("user", user);

	return "User/index";
    }

    @GetMapping(value = "/search", params = "q")
    public String Search(ModelMap model, HttpSession session, @RequestParam("q") String name) {
	UserModel user = (UserModel) session.getAttribute("user");
	if (user == null) {
	    return "redirect:/login"; // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
	}
	String decodedName = URLDecoder.decode(name, StandardCharsets.UTF_8);
	ProductModel productModel = productService.findByName(decodedName);
	if (productModel == null) {
	    return "redirect:/user";
	}
	model.addAttribute("productsCart", session.getAttribute("productsCart"));
	model.addAttribute("product", productModel);
	model.addAttribute("context", "User/detailProduct.jsp");
	model.addAttribute("user", user);
	return "User/index";
    }

    @PostMapping("/profile/edit")
    public String profile(ModelMap model, HttpSession session, @ModelAttribute("user") UserModel user) {
	UserModel userOld = (UserModel) session.getAttribute("user");
	if (userOld == null) {
	    return "redirect:/login"; // Nếu không tìm thấy session, chuyển hướng về trang login
	}
	user.setMaNguoiDung(userOld.getMaNguoiDung());
	boolean flag = userService.editProfile(user);
	if (!userOld.getHoTen().equals(user.getHoTen())) {
	    userOld.setHoTen(user.getHoTen());
	}
	if (!userOld.getEmail().equals(user.getEmail())) {
	    userOld.setEmail(user.getEmail());
	}
	if (!userOld.getSdt().equals(user.getSdt())) {
	    userOld.setSdt(user.getSdt());
	}
	if (!userOld.getDiaChi().equals(user.getDiaChi())) {
	    userOld.setDiaChi(user.getDiaChi());
	}
	if (!userOld.getNgaySinh().equals(user.getNgaySinh())) {
	    userOld.setNgaySinh(user.getNgaySinh());
	}
	if (flag) {
	    session.removeAttribute("user");
	    session.setAttribute("user", userOld); // Cập nhật session
	}
	System.out.println(userOld.getMaNguoiDung());
	return "redirect:/user/profile?updated=true"; // Chuyển hướng sau khi thành công
    }

}
