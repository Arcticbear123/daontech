package com.mycompany.daon;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.daon.LoginUserForm;


import com.mycompany.daon.LoginDto;
import com.mycompany.daon.LoginUserForm;
import com.mycompany.daon.LoginService;
import com.mycompany.daon.LoginDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService LoginService;	    
    
    @RequestMapping(value = "/CheckLogin", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(LoginUserForm LoginUserForm , HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		System.out.println("체크체크!!");
		HttpSession session = req.getSession();
        LoginDto LoginDto = LoginService.LoginCheck(LoginUserForm);
		
		if(LoginDto == null) {
			session.setAttribute("user_id", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("user_id", LoginDto);
		}
		
		return "home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	@ResponseBody
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "home";
	}
     

}
