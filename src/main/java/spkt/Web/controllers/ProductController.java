package spkt.Web.controllers;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.databind.JsonNode;

import jakarta.servlet.http.HttpSession;
import spkt.Web.models.CartItemModel;
import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;
import spkt.Web.services.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    ProductService productService;

    @GetMapping()
    public String Index(ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");

	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());

	    List<ProductModel> listProduct = productService.getAllProduct();
	    if (listProduct != null) {
		session.setAttribute("productsCart", listCartItemModels);
		model.addAttribute("productsCart", listCartItemModels);
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("titleContent", "Tất cả sản phẩm");
		model.addAttribute("context", "/User/product.jsp");
	    }
	    return "User/index";
	} catch (Exception e) {
	    return "redirect:/";
	}

    }

    @GetMapping(params = "q")
    public String DetailProduct(@RequestParam(value = "c", required = false) String category,
	    @RequestParam("q") Long id, ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());
	    ProductModel product = productService.findById(id);
	    Map<String, String> categoryMessages = changeCategoryToMessage();
	    String titleContent = categoryMessages.getOrDefault(category, "Không xác định");
	    if (product != null) {
		session.setAttribute("productsCart", listCartItemModels);
		model.addAttribute("productsCart", listCartItemModels);
		model.addAttribute("product", product);
		model.addAttribute("titleContent", titleContent);
		model.addAttribute("context", "/User/detailProduct.jsp");
		return "User/index"; // Trả về view chi tiết sản phẩm
	    } else {
		model.addAttribute("error", "Sản phẩm không tồn tại.");
		return "error"; // Trả về view lỗi nếu sản phẩm không tìm thấy
	    }
	} catch (Exception e) {
	    return "redirect:/";
	}

    }

    private Map<String, String> changeCategoryToMessage() {
	Map<String, String> categoryMessages = new HashMap<>();
	categoryMessages.put("tat-ca", "Tất cả sản phẩm");
	categoryMessages.put("trang-suc", "Trang sức");
	categoryMessages.put("khan", "Khăn");
	categoryMessages.put("mu", "Mũ nón/mũ len");
	categoryMessages.put("gang-tay", "Găng tay");
	categoryMessages.put("bit-tai-len", "Bịt tai len");
	categoryMessages.put("dep", "Dép");
	categoryMessages.put("phu-kien-toc-bang-do", "Phụ kiện tóc, băng đô");
	categoryMessages.put("kinh", "Kính mát, gọng kính");
	categoryMessages.put("tat", "Tất vớ");
	categoryMessages.put("giay-that-lung", "Giày/thắt lưng");
	return categoryMessages;
    }

    @GetMapping(params = { "c", "page" })
    public String DetailProduct(@RequestParam(value = "c", required = false) String category,
	    @RequestParam(value = "page", defaultValue = "1") int page, ModelMap model, HttpSession session) {
	try {
	    UserModel user = (UserModel) session.getAttribute("user");
	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(user.getMaNguoiDung());
	    List<ProductModel> products = productService.getAllProductByCategory(category);

	    Map<String, String> categoryMessages = changeCategoryToMessage();
	    String titleContent = categoryMessages.getOrDefault(category, "Không xác định");

	    switch (category) {
	    case "tat-ca":
		products = productService.getAllProduct();
		break;
	    default:
		products = productService.getAllProductByCategory(category);
	    }

	    int totalProducts = products.size();
	    int totalPages = (int) Math.ceil((double) totalProducts / 12);

	    // Tính chỉ số bắt đầu của sản phẩm trong trang hiện tại
	    int startIndex = (page - 1) * 12;

	    // Lấy sản phẩm cho trang hiện tại
	    List<ProductModel> productsOnPage = products.subList(startIndex, Math.min(startIndex + 12, totalProducts));

	    if (products != null) {
		session.setAttribute("productsCart", listCartItemModels);
		model.addAttribute("productsCart", listCartItemModels);
		model.addAttribute("listProduct", productsOnPage);
		model.addAttribute("titleContent", titleContent);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("category", category);
		model.addAttribute("context", "/User/product.jsp");
	    }
	    return "User/index"; // Trả về view chi tiết sản phẩm

	} catch (

	Exception e) {
	    return "redirect:/";
	}

    }

    @PostMapping(params = "v")
    @ResponseBody
    public ResponseEntity<?> manageWishList(@RequestParam("v") String action, @RequestBody Map<String, Object> request,
	    @SessionAttribute("user") UserModel u) {
	boolean success;
	String message;
	Long productId = Long.valueOf(request.get("idProduct").toString());
	switch (action) {
	case "addToWishlist":
	    success = productService.addToWishList(u.getMaNguoiDung(), productId);
	    message = success ? "Sản phẩm đã được thêm vào danh sách yêu thích!" : "Có lỗi xảy ra. Vui lòng thử lại.";
	    break;

	case "removeFromWishlist":
	    success = productService.removeFromWishList(u.getMaNguoiDung(), productId);
	    message = success ? "Sản phẩm đã được xóa khỏi danh sách yêu thích!" : "Có lỗi xảy ra. Vui lòng thử lại.";
	    break;
	case "removeToCart":
	    success = productService.removeToCart(u.getMaNguoiDung(), productId);
	    message = success ? "Sản phẩm đã được xóa khỏi giỏ hàng!" : "Có lỗi xảy ra. Vui lòng thử lại.";
	    break;
	default:
	    return ResponseEntity.badRequest().body(Map.of("message", "Yêu cầu không hợp lệ."));
	}
	return success ? ResponseEntity.ok(Map.of("message", message))
		: ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", message));
    }

    @PostMapping("/cart")
    @ResponseBody
    public Map<String, Object> addToCart(@RequestBody JsonNode request, @SessionAttribute("user") UserModel u,
	    HttpSession session) {
	try {
	    // Thêm sản phẩm vào giỏ hàng
	    productService.addToCart(u.getMaNguoiDung(), request.get("idProduct").asLong(),
		    request.get("soLuong").asInt());

	    // Lấy danh sách sản phẩm trong giỏ hàng
	    List<CartItemModel> listCartItemModels = productService.getAllProductOfCart(u.getMaNguoiDung());

	    // Tính tổng giá trị giỏ hàng
	    Long totalAmount = Math.round(listCartItemModels.stream().mapToDouble(
		    product -> product.getGia().multiply(BigDecimal.valueOf(product.getSoLuongGioHang())).doubleValue())
		    .sum());

	    // Tạo response trả về
	    Map<String, Object> response = new HashMap<>();
	    response.put("message", "Sản phẩm đã được thêm vào giỏ hàng.");
	    response.put("productsCart", listCartItemModels);
	    response.put("totalAmount", totalAmount);
	    return response; // Spring sẽ tự động chuyển thành JSON
	} catch (Exception e) {
	    // Trả về lỗi nếu có
	    return Map.of("error", "Có lỗi xảy ra khi thêm vào giỏ hàng.");
	}
    }

}
