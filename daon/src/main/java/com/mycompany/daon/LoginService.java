package com.mycompany.daon;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.Console;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.daon.LoginDto;
import com.mycompany.daon.LoginUserForm;
import com.mycompany.daon.LoginDAO;

@Service
public class LoginService {
	
	protected final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	private LoginDAO LoginDAO;
	
    
    public LoginDto LoginCheck(LoginUserForm LoginUserForm) throws Exception{
    	LoginDto LoginDto = new LoginDto();
    	System.out.println("Dto출력 : ");
    	System.out.println(LoginUserForm.getUser_id());
    	System.out.println(LoginUserForm.getUser_pwd());
    	LoginDto = LoginDAO.LoginCheck(LoginUserForm);
 
         
         return LoginDto;
    	
    }
}

