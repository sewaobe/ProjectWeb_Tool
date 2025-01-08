package spkt.Web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import spkt.Web.models.UserModel;
import spkt.Web.services.UserService;

@Controller
public class WelcomeController {
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String Index() {
	return "welcome";
    }

    @GetMapping("/message")
    public String Message() {
	return "access-denied";
    }

    @GetMapping("/error")
    public String Error() {
	return "access-error";
    }

    @GetMapping("/login")
    public String Login() {
	return "Login";
    }

    @PostMapping("/login")
    public String Login(ModelMap model, @RequestParam("username") String userName,
	    @RequestParam("password") String passWord, HttpSession session) {
	UserModel user = userService.login(userName, passWord);

	if (user != null) {
	    session.setAttribute("user", user);

	    if (user.getRole().equals("Staff")) {
		return "redirect:/staff";
	    } else {
		return "redirect:/user";
	    }

	}
	return "redirect:/error";
    }

    @GetMapping("/register")
    public String Register() {
	return "Register";
    }

    @PostMapping("/register")
    public String Register(ModelMap model, @ModelAttribute("UserModel") UserModel user, HttpSession session,
	    RedirectAttributes redirectAttributes) {
	boolean flag = userService.register(user);
	if (flag) {
	    UserModel userLogin = userService.login(user.getTenDangNhap(), user.getMatKhau());
	    session.setAttribute("user", userLogin);
	    return "redirect:/user";
	}
	return "redirect:/register";
    }

}
