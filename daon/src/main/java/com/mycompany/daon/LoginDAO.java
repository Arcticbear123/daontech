package com.mycompany.daon;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
import com.mycompany.daon.LoginDto;
import com.mycompany.daon.LoginUserForm;
import com.mycompany.daon.LoginService;

@Repository
public class LoginDAO {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
 
    private static final String NAMESPACE = "com.mycompany.daon.boardmapper";
    	
	public LoginDto LoginCheck(LoginUserForm LoginUserForm) throws Exception{
		System.out.println("체크체크!");
		System.out.println(LoginUserForm.getUser_id());
		System.out.println(LoginUserForm.getUser_pwd());
		return sqlSession.selectOne(NAMESPACE+".LoginCheck", LoginUserForm);
	}

}