package spkt.Web.interceptors;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import spkt.Web.models.UserModel;

public class RoleBasedInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	    throws Exception {
	try {
	    // Lấy user từ session
	    UserModel user = (UserModel) request.getSession().getAttribute("user");
	    String role = user != null ? user.getRole() : "null";

	    // Lấy đường dẫn yêu cầu
	    String uri = request.getRequestURI();

	    if (role.equals("null")) {
		if (uri.contains("/login") || uri.contains("/register") || uri.contains("/ProjectWeb")) {
		    return true; // Tiếp tục nếu người dùng đang ở trang đăng nhập hoặc đăng ký
		}
		response.sendRedirect("/ProjectWeb");
		return false;
	    } else if (role.equals("User")) {

		if (!uri.contains("/ProjectWeb/user") && !uri.contains("/ProjectWeb/resources/")
			&& !uri.contains("/ProjectWeb/product") && !uri.contains("/ProjectWeb/cart")
			&& !uri.contains("/ProjectWeb/message") && !uri.contains("/ProjectWeb/cart/checkout")
			&& !uri.contains("/ProjectWeb/register") && !uri.contains("/ProjectWeb/user/profile/edit")) {
		    response.sendRedirect("/ProjectWeb/message");
		    return false;
		}
	    }
	    return true;

	} catch (Exception e) {
	    // Nếu có lỗi, chuyển hướng về trang chính /ProjectWeb
	    response.sendRedirect("/ProjectWeb");
	    return false;
	}
    }

}
