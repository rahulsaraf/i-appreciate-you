/**
 * 
 */
package com.webapp.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.webapp.domain.AppreciationPost;
import com.webapp.domain.User;

/**
 * @author rahul
 *
 */
@Service
public class UserService {

	@Autowired
	RestConnectionService conn;

	public User getUserbyUserId(String userId) {
		String action = "getUserById?userId="+userId;
		String response = getRestResponse(action);
		Gson gson = new Gson();
		User user = gson.fromJson(response, User.class );
	    return user;	
	}

	/**
	 * @param action
	 * @param obj
	 * @param classOfT
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getRestResponse(String action) {
		InputStream in = conn.getConnection(action, "GET");
		String outputString = "";
	       try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	               sb.append(line + "\n");
	           }
	           outputString = sb.toString();
	           
	           in.close();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
		return outputString;
	}
	
	
	public String saveUser(User user) {
		Gson gson = new Gson();
		String json = gson.toJson(user, User.class);
		json = json.replaceAll(" ", "%20");
		
		String action = "saveUser?user="+json;
		String response = getRestResponse(action);
	    
	    return response;
		
	}

	public String addConnection(Long requesterId, Long acceptorId) {
		String action = "addConnection?requesterId="+requesterId+"&acceptorId="+acceptorId;
		String response = getRestResponse(action);
		return response;
	}
	
	public List<User> getUserConnections(Long userId){
		
		String action = "getUserConnections?userId="+userId;
		String response = getRestResponse(action);
		Gson gson = new Gson();
		List<User>  users = gson.fromJson(response, new TypeToken<List<User>>(){}.getType() );
	    return users;	
		
	}

	public AppreciationPost savePost(AppreciationPost post) {
		Gson gson = new Gson();
		String json = gson.toJson(post, AppreciationPost.class);
		json = json.replaceAll(" ", "%20");
		String action = "savePost?post="+json;
		String response = getRestResponse(action);
		AppreciationPost postSaved = gson.fromJson(response, AppreciationPost.class );
	    return postSaved;	
		
	}

	public List<AppreciationPost> findAllBySenderId(User loggedInUser) {
		Gson gson = new Gson();
		String json = gson.toJson(loggedInUser, User.class);
		json = json.replaceAll(" ", "%20");
		String action = "getAppreciationsPosted?user="+json;
		String response = getRestResponse(action);
		List<AppreciationPost>  posts = gson.fromJson(response, new TypeToken<List<AppreciationPost>>(){}.getType() );
		
		return posts;
	}
	
	public List<AppreciationPost> findAllByReceiverId(User loggedInUser) {
		Gson gson = new Gson();
		String json = gson.toJson(loggedInUser, User.class);
		json = json.replaceAll(" ", "%20");
		String action = "getAppreciationsReceived?user="+json;
		String response = getRestResponse(action);
		List<AppreciationPost>  posts = gson.fromJson(response, new TypeToken<List<AppreciationPost>>(){}.getType() );
		
		return posts;
	}
	
	public AppreciationPost findByPostId(String postId) {
		Gson gson = new Gson();
		String action = "findPost?postId="+postId;
		String response = getRestResponse(action);
		AppreciationPost  post = gson.fromJson(response, AppreciationPost.class );
		
		return post;
	}

	public List<User> getAllUsers() {
		Gson gson = new Gson();
		String action = "getAllUsers";
		String response = getRestResponse(action);
		List<User>  users = gson.fromJson(response, new TypeToken<List<User>>(){}.getType() );
		
		return users;
	}
	

}
