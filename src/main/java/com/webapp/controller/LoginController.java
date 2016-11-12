/**
 * 
 */
package com.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author rahul
 *
 */
@Controller
public class LoginController {
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	   public String redirectLoginPage(ModelMap model) {
	      return "login";
	   }
	
	@RequestMapping(value="/loginapp", method=RequestMethod.POST)
	   public String redirectLogin(@RequestParam("username") String username,
			   @RequestParam("password") String password,
			   ModelMap model,HttpServletRequest request) {
		
		return "login";
	   }

}
