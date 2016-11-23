/**
 * 
 */
package com.webapp.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.webapp.domain.User;

/**
 * @author rahul
 *
 */
@Service
public class LoginService {
	
	@Autowired
	RestConnectionService conn;
	
	
	public String loginUser( String email, String password){
		String action = "login?emailAddress="+email+"&password="+password;
		InputStream in = conn.getConnection(action, "GET");
		String outputString = "";
	       try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	               sb.append(line + "\n");
	           }
	           outputString = sb.toString().replace("\n", "");
	           in.close();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
	       return outputString;
	}

	public User getUser( String email){
		String action = "getUser?emailAddress="+email;
		InputStream in = conn.getConnection(action, "GET");
		String outputString = "";
		User user = null;
	       try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	               sb.append(line + "\n");
	           }
	           outputString = sb.toString();
	           Gson gson = new Gson();
	           user = gson.fromJson(outputString, User.class);
	           
	           in.close();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
	       return user;
	}
	
	public String registerUser( String email, String password, String fullName, String phone){
		String action = "register?emailAddress="+email.trim()+"&password="+password+"&fullName="+fullName.trim().replace(" ", "%20")+"&phoneNumber="+phone.trim();
		InputStream in = conn.getConnection(action, "GET");
		String outputString = "";
	       try{
	           BufferedReader reader = new BufferedReader(new InputStreamReader(in, "iso-8859-1"), 8);
	           StringBuilder sb = new StringBuilder();
	           String line = null;
	           while ((line = reader.readLine()) != null) {
	               sb.append(line + "\n");
	           }
	           outputString = sb.toString().replace("\n", "");
	           in.close();
	       } catch (Exception e) {
	           System.out.println("Buffer Error"+ "Error converting result " + e.toString());
	       }
	       return outputString;
	}
	
	
}
