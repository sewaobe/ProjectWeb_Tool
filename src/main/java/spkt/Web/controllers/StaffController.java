package spkt.Web.controllers;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import spkt.Web.models.OrderModel;
import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;
import spkt.Web.services.OrderService;
import spkt.Web.services.ProductService;
import spkt.Web.services.UserService;

@Controller
@RequestMapping("/staff")
public class StaffController {
    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @Autowired
    private ServletContext servletContext;

    @GetMapping()
    public String Index(ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<OrderModel> listOrderModels = orderService.getAllOrder();
	    List<String> colsHeader = getFieldNames(OrderModel.class);
	    List<String> trangThaiList = Arrays.asList("Chờ xác nhận", "Đã xác nhận", "Đang vận chuyển",
		    "Đã vận chuyển", "Đã hủy");
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		model.addAttribute("listOrderModels", listOrderModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Quản lý đơn hàng");
		model.addAttribute("statusList", trangThaiList);
		model.addAttribute("content", "Staff/order.jsp");
		model.addAttribute("orderModel", new OrderModel());
		return "Staff/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";

    }

    @GetMapping(params = "status")
    public String Index(ModelMap model, HttpSession session, @RequestParam("status") String status) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<OrderModel> listOrderModels = orderService.findOrderByStatus(status);
	    List<String> colsHeader = getFieldNames(OrderModel.class);
	    List<String> trangThaiList = Arrays.asList("Chờ xác nhận", "Đã xác nhận", "Đang vận chuyển",
		    "Đã vận chuyển", "Đã hủy");
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		model.addAttribute("listOrderModels", listOrderModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Quản lý đơn hàng");
		model.addAttribute("statusList", trangThaiList);
		model.addAttribute("content", "Staff/order.jsp");
		model.addAttribute("orderModel", new OrderModel());
		return "Staff/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";

    }

    @GetMapping("/customers")
    public String Customers(ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<UserModel> listUserModels = userService.getAllUser();
	    List<String> colsHeader = Arrays.asList("Mã người dùng", "Họ tên", "Email", "Số điện thoại", "Ngày sinh",
		    "Địa chỉ");

	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		model.addAttribute("listCustomerModel", listUserModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Quản lý khách hàng");
		model.addAttribute("content", "Staff/customer.jsp");
		return "Staff/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";

    }

    @GetMapping("/products")
    public String Products(ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<ProductModel> listProductModels = productService.getAllProduct();
	    List<String> colsHeader = Arrays.asList("Mã sản phẩm", "Hình ảnh", "Tên sản phẩm", "Giá", "Số lượng",
		    "Loại sản phẩm", "Thời gian tạo", "Thời gian chỉnh sửa");
	    List<String> loaiSPList = Arrays.asList("Trang sức", "Khăn", "Mũ", "Găng tay", "Bịt tai len", "Dép",
		    "Phụ kiện tóc", "Kính", "Tất", "Giày thắt lưng");
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		model.addAttribute("listProductModels", listProductModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Quản lý sản phẩm");
		model.addAttribute("categoryList", loaiSPList);
		model.addAttribute("productModel", new ProductModel());
		model.addAttribute("content", "Staff/product.jsp");
		return "Staff/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";

    }

    @GetMapping(value = "/orders/details", params = "q")
    public String Products(ModelMap model, HttpSession session, @RequestParam("q") Long idOrder) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<ProductModel> listProductModels = productService.getAllProductOfOrder(idOrder);
	    List<String> colsHeader = Arrays.asList("Mã sản phẩm", "Hình ảnh", "Tên sản phẩm", "Giá", "Số lượng",
		    "Loại sản phẩm", "Thời gian tạo", "Thời gian chỉnh sửa");
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		model.addAttribute("listProductModels", listProductModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Chi tiết hóa đơn " + idOrder + " (Sản phẩm)");
		model.addAttribute("content", "Staff/orderDetail.jsp");
		return "Staff/index";
	    }
	} catch (Exception e) {
	    return "redirect:/error";
	}
	return "redirect:/error";

    }

    @GetMapping(value = "/products", params = "category")
    public String Category(ModelMap model, HttpSession session, @RequestParam("category") String category) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<ProductModel> listProductModels = productService.getAllProductByCategory(category);
	    List<String> colsHeader = Arrays.asList("Mã sản phẩm", "Hình ảnh", "Tên sản phẩm", "Giá", "Số lượng",
		    "Loại sản phẩm", "Thời gian tạo", "Thời gian chỉnh sửa");
	    List<String> loaiSPList = Arrays.asList("Trang sức", "Khăn", "Mũ", "Găng tay", "Bịt tai len", "Dép",
		    "Phụ kiện tóc", "Kính", "Tất", "Giày thắt lưng");
	    // Kiểm tra session, nếu không có session thì chuyển về trang đăng nhập
	    if (user != null) {
		model.addAttribute("listProductModels", listProductModels);
		model.addAttribute("colsHeader", colsHeader);
		model.addAttribute("titleTable", "Quản lý sản phẩm");
		model.addAttribute("categoryList", loaiSPList);
		model.addAttribute("productModel", new ProductModel());
		model.addAttribute("content", "Staff/product.jsp");
		return "Staff/index";
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}
	return "redirect:/";

    }

    @DeleteMapping("/deleteProduct/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable("productId") Long productId) {
	try {
	    // Gọi service để xóa sản phẩm
	    boolean isDeleted = productService.deleteProduct(productId);

	    if (isDeleted) {
		return ResponseEntity.ok().body("{\"success\": true}");
	    } else {
		return ResponseEntity.status(404).body("{\"success\": false, \"message\": \"Sản phẩm không tồn tại\"}");
	    }
	} catch (Exception e) {
	    return ResponseEntity.status(500)
		    .body("{\"success\": false, \"message\": \"Đã có lỗi xảy ra khi xóa sản phẩm\"}");
	}
    }

    // Hàm lấy tên các thuộc tính của lớp
    private List<String> getFieldNames(Class<?> clazz) {
	List<String> fieldNames = new ArrayList<>();
	Field[] fields = clazz.getDeclaredFields(); // Lấy tất cả các trường của lớp

	for (Field field : fields) {
	    fieldNames.add(field.getName()); // Thêm tên trường vào danh sách
	}

	return fieldNames;
    }

    @PostMapping("/updateOrder")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateOrder(@RequestBody OrderModel orderModel) {
	Map<String, Object> response = new HashMap<>();

	try {

	    // Xử lý cập nhật đơn hàng ở đây
	    Boolean flag = orderService.updateOrderByIDUser(orderModel);
	    if (flag) {
		response.put("success", true);

	    } else {
		response.put("success", false);

	    }
	} catch (Exception e) {
	    response.put("success", false);
	    response.put("error", e.getMessage());

	}

	return ResponseEntity.ok(response);
    }

    @PostMapping(value = "/deleteCustomer", params = "customerId")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteCustomer(@RequestParam("customerId") Long customerId) {
	Map<String, Object> response = new HashMap<>();
	try {
	    // Xóa khách hàng theo id
	    System.out.println(customerId);
	    Boolean flag = userService.removeUser(customerId);
	    response.put("success", flag);
	    return ResponseEntity.ok(response);
	} catch (Exception e) {

	    response.put("success", false);
	    response.put("error", e.getMessage()); // Thêm thông tin lỗi nếu cần
	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	}
    }

    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute("productModel") ProductModel productModel,
	    @RequestParam("file") MultipartFile file) {
	try {
	    if (!file.isEmpty()) {
		// Xử lý file, ví dụ lưu trữ vào thư mục
		String fileName = saveFile(file); // Hàm saveFile() của bạn
		productModel.setHinhAnh(fileName); // Cập nhật tên file trong model
	    }

	    productService.saveProduct(productModel);
	    return "redirect:/staff/products";
	} catch (

	Exception e) {
	    // Bắt lỗi khác và ghi log
	    e.printStackTrace();
	    return "redirect:/staff/products";
	}

    }

    private String saveFile(MultipartFile file) {
	// Lấy thư mục lưu trữ hình ảnh
	String uploadDir = servletContext.getRealPath("/resources/images/"); // Sử dụng getRealPath để lấy đường dẫn
									     // tuyệt đối từ thư mục webapp
									     // gốc của dự án

	// Lấy tên file gốc và thay thế khoảng trắng thành dấu -
	String fileName = removeDiacritics(file.getOriginalFilename()).replaceAll(" ", "-");

	// Tạo thư mục nếu chưa có
	File dir = new File(uploadDir);
	if (!dir.exists()) {
	    dir.mkdirs();
	}

	// Kiểm tra phần mở rộng của tệp (ví dụ: chỉ cho phép hình ảnh)
	String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	if (!fileExtension.matches("jpg|jpeg|png|gif")) {
	    throw new RuntimeException("Only image files (jpg, jpeg, png, gif) are allowed.");
	}

	// Lưu file vào thư mục
	try {
	    File serverFile = new File(uploadDir + fileName);

	    file.transferTo(serverFile); // Lưu file vào hệ thống
	} catch (IOException e) {
	    e.printStackTrace();
	}

	// Trả về đường dẫn tương đối từ thư mục webapp (để lưu trong cơ sở dữ liệu)
	return "/resources/images/" + fileName;
    }

    private String removeDiacritics(String input) {
	// Chuẩn hóa và loại bỏ dấu
	String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
	Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
	return pattern.matcher(normalized).replaceAll("");
    }
}
