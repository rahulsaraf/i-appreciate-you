/**
 * 
 */
package com.webapp.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.webapp.domain.AppreciationPost;
import com.webapp.domain.User;
import com.webapp.service.LoginService;
import com.webapp.service.UserService;

/**
 * @author rahul
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserService userService;
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	   public String redirectLoginPage(ModelMap model) {
	      return "index";
	   }
	

	@RequestMapping(value="/logout", method=RequestMethod.POST)
	   public String logout(ModelMap model,HttpServletRequest request) {
		  request.getSession().setAttribute("user", null);
	      return "index";
	   }
	
	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	   public String redirectLogin(@RequestParam("email") String email,
			   @RequestParam("password") String password,ModelMap model,HttpServletRequest request) {
		
		String response = loginService.loginUser(email, password);
		if(response.equals("success")){
			User user = loginService.getUser(email);
			request.getSession().setAttribute("user", user);
			model.addAttribute("user", user);
			loadProfileForLoggedInUser(model, user);
			return "user-profile";
		}else{
			model.addAttribute("loginError", response);
			return "index";			
		}

	   }


	/**
	 * @param model
	 * @param user
	 */
	public void loadProfileForLoggedInUser(ModelMap model, User user) {
		List<AppreciationPost> appreciationsPosted = userService.findAllBySenderId(user);
		List<AppreciationPost> appreciationsReceived = userService.findAllByReceiverId(user);
		List<User> users = userService.getUserConnections(user.getUserId());
		model.addAttribute("appreciationsReceived", appreciationsReceived);
		model.addAttribute("appreciationsPosted", appreciationsPosted);
		model.addAttribute("connections", users);
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	   public String redirectWelcomePage(@RequestParam("full_name") String fullName,@RequestParam("email") String email,@RequestParam("phone_num") String phone,
			   @RequestParam("password") String password,@RequestParam("sex") String sex,@RequestParam("city") String city,
			   ModelMap model,HttpServletRequest request) {
		String response = loginService.registerUser(email, password, fullName, phone, sex, city);
		if(response.equals("success")){
			User user = loginService.getUser(email);
			model.addAttribute("user", user);
			return "user-profile";
		}else{
			model.addAttribute("registerError", response);
			return "index";			
		}
	   }
	
	@RequestMapping(value="/addConnection", method=RequestMethod.GET)
	   public String addConnection(@RequestParam("nameEmail") String nameEmail,@RequestParam("userId") Long userId,
			   ModelMap model,HttpServletRequest request) {
			   User loggedInUser = (User) request.getSession().getAttribute("user");
			   if(loggedInUser == null){
				   model.addAttribute("invalidSession", "Session is invalid, Please login again.!");
					return "index";
			   }else{
				   userService.addConnection(loggedInUser.getUserId(), userId);
				   loadProfileForLoggedInUser(model,loggedInUser);
				   return "user-profile";
			   }
	   }
	
	
	@RequestMapping(value = "/avatarBgUpload", method = RequestMethod.POST)
	public	String uploadFileHandler(@RequestParam("user") String userId,
			@RequestParam("file") MultipartFile file,ModelMap model,HttpServletRequest request) {
		User user = userService.getUserbyUserId(userId);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

			
				File dir = new File("E:\\UtDallas\\WPL\\project\\iappreaciateyou\\src\\main\\webapp\\static\\images\\profile-bg");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + userId+".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				
				user.setBgImageLink(userId);
				String response = userService.saveUser(user);
				if(!response.equals("success")){
					model.addAttribute("uploadError", response);
					
				}
				
				
			} catch (Exception e) {
				
			}
		} 
		model.addAttribute("user", user);
		return "user-profile";
	}

	
	   @RequestMapping(value="/getAllConnections", method=RequestMethod.GET)
	   public @ResponseBody List<User> getAllConnections(@RequestParam("term") String term,ModelMap model,HttpServletRequest request, HttpServletResponse response) {
		   
		   
		   User user = (User) request.getSession().getAttribute("user");
		   if(user == null){
			   return null;
		   }else{
			   List<User> names = new ArrayList<User>();
			   List<User> users = userService.getUserConnections(user.getUserId());
			   for (User userEntry : users) {
				   if(userEntry.getFullName().toLowerCase().contains(term.toLowerCase()) || userEntry.getEmailAddress().toLowerCase().contains(term.toLowerCase())){
					   names.add(userEntry);					   
				   }
			   }
			   
			return names;
		   }
	}
	
	   @RequestMapping(value="/getAllUsers", method=RequestMethod.GET)
	   public @ResponseBody List<User> getAllUsers(@RequestParam("term") String term,ModelMap model,HttpServletRequest request, HttpServletResponse response) {
		   
		   
		   User user = (User) request.getSession().getAttribute("user");
		   if(user == null){
			   return null;
		   }else{
			   
			   List<User> names = new ArrayList<User>();
			   List<User> users = userService.getAllUsers();
			   users.remove(user);
			   for (User userEntry : users) {
				   if(userEntry.getFullName().toLowerCase().contains(term.toLowerCase()) || userEntry.getEmailAddress().toLowerCase().contains(term.toLowerCase())){
					   names.add(userEntry);					   
				   }
			   }
			   
			return names;
		   }
	}
	   
	
	   @RequestMapping(value="/postApp", method=RequestMethod.POST)
	   public String postAppreciation(@RequestParam("nameEmail") String email,@RequestParam("userId") String userId,@RequestParam("message") String message,
			   @RequestParam("happy") int happy,
			   @RequestParam("helpful") int helpful,
			   @RequestParam("easygoing") int easygoing,
			   @RequestParam("fun") int fun,
			   @RequestParam("respectful") int respectful,
			   @RequestParam("confident") int confident,
			   @RequestParam("emotional") int emotional,
			   @RequestParam("motivated") int motivated,
			   @RequestParam("compassionate") int compassionate,
			   
			   
			   ModelMap model,HttpServletRequest request) {
		
		User loggedInUser = (User) request.getSession().getAttribute("user");
		if(loggedInUser == null){
			model.addAttribute("invalidSession", "Session is invalid, Please login again.!");
			return "index";
		}
		User user = userService.getUserbyUserId(userId);
		if(user == null){
			model.addAttribute("postError", "Email Address is invalid, User with "+email+"does not exists in system.");
		}else{
			AppreciationPost post = new AppreciationPost();
			post.setReceiverId(user);
			post.setSenderId(loggedInUser);
			post.setCompassionate(compassionate);
			post.setConfident(confident);
			post.setEasygoing(easygoing);
			post.setEmotional(emotional);
			post.setFun(fun);
			post.setHappy(happy);
			post.setHelpful(helpful);
			post.setMessage(message);
			post.setMotivated(motivated);
			post.setPostCreationDate(new Date());
			post = userService.savePost(post);
			model.addAttribute("appreciationPost", post);
			
		}
		List<AppreciationPost> appreciationsPosted = userService.findAllBySenderId(loggedInUser);
		List<AppreciationPost> appreciationsReceived = userService.findAllByReceiverId(loggedInUser);
		model.addAttribute("appreciationsPosted", appreciationsPosted);
		model.addAttribute("appreciationsReceived", appreciationsReceived);
		return "user-profile";
	   }
	   
	   
	   @RequestMapping(value="/getAppreciationsPosted" , method=RequestMethod.GET)
	    public @ResponseBody List<AppreciationPost> getAppreciationsPosted(ModelMap model,HttpServletRequest request) throws SQLException {
		   User user = userService.getUserbyUserId("1");
		   request.getSession().setAttribute("user", user);
		   User loggedInUser = (User) request.getSession().getAttribute("user");
			if(loggedInUser == null){
				return null;
			}
			List<AppreciationPost> appreciationsPosted = userService.findAllBySenderId(loggedInUser);
			
	        return appreciationsPosted;
	    }
		
		@RequestMapping(value="/getAppreciationsReceived" , method=RequestMethod.GET)
	    public @ResponseBody List<AppreciationPost> getAppreciationsReceived(ModelMap model,HttpServletRequest request) throws SQLException {
			User loggedInUser = (User) request.getSession().getAttribute("user");
			if(loggedInUser == null){
				return null;
			}
			List<AppreciationPost> appreciationsReceived = userService.findAllByReceiverId(loggedInUser);
			
	        return appreciationsReceived;
	    }
	
		@RequestMapping(value="/savePost", method=RequestMethod.GET)
		   public String savePost(@RequestParam("postId") String postId,@RequestParam("nameEmail") String email,@RequestParam("userId") String userId,@RequestParam("message") String message,
				   @RequestParam("happy") int happy,
				   @RequestParam("helpful") int helpful,
				   @RequestParam("easygoing") int easygoing,
				   @RequestParam("fun") int fun,
				   @RequestParam("respectful") int respectful,
				   @RequestParam("confident") int confident,
				   @RequestParam("emotional") int emotional,
				   @RequestParam("motivated") int motivated,
				   @RequestParam("compassionate") int compassionate,
				   ModelMap model,HttpServletRequest request) {
			
			User loggedInUser = (User) request.getSession().getAttribute("user");
			if(loggedInUser == null){
				model.addAttribute("invalidSession", "Session is invalid, Please login again.!");
				return "index";
			}
				  AppreciationPost post = userService.findByPostId(postId);
				  post.setCompassionate(compassionate);
				  post.setConfident(confident);
				  post.setEasygoing(easygoing);
				  post.setEmotional(emotional);
				  post.setFun(fun);
				  post.setHappy(happy);
				  post.setHelpful(helpful);
				  post.setMessage(message);
				  post.setMotivated(motivated);
				  post.setRespectful(respectful);
				  post = userService.savePost(post);
				  List<AppreciationPost> appreciationsPosted = userService.findAllBySenderId(loggedInUser);
					List<AppreciationPost> appreciationsReceived = userService.findAllByReceiverId(loggedInUser);
					model.addAttribute("appreciationsPosted", appreciationsPosted);
					model.addAttribute("appreciationsReceived", appreciationsReceived);
					return "user-profile";
			
			
		}

}
