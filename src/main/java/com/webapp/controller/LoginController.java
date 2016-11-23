/**
 * 
 */
package com.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.domain.User;
import com.webapp.service.LoginService;

/**
 * @author rahul
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	   public String redirectLoginPage(ModelMap model) {
	      return "index";
	   }
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	   public String redirectLogin(@RequestParam("email") String email,
			   @RequestParam("password") String password,ModelMap model,HttpServletRequest request) {
		
		String response = loginService.loginUser(email, password);
		if(response.equals("success")){
			User user = loginService.getUser(email);
			model.addAttribute("user", user);
			return "user-profile";
		}else{
			model.addAttribute("loginError", response);
			return "index";			
		}

	   }
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	   public String redirectWelcomePage(@RequestParam("full_name") String fullName,@RequestParam("email") String email,@RequestParam("phone_num") String phone,
			   @RequestParam("password") String password,
			   ModelMap model,HttpServletRequest request) {
		String response = loginService.registerUser(email, password, fullName, phone);
		if(response.equals("success")){
			User user = loginService.getUser(email);
			model.addAttribute("user", user);
			return "user-profile";
		}else{
			model.addAttribute("registerError", response);
			return "index";			
		}
	   }
	
	
	

}
