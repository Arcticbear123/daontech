package com.mycompany.daon;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.daon.BoardDto;
import com.mycompany.daon.BoardForm;
import com.mycompany.daon.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;	    
	
	@RequestMapping(value = "/getBoardList")
	@ResponseBody
	   public List<BoardDto> getBoardList(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		 String limitStr = request.getParameter("limit");
		 String numStr = request.getParameter("num");
		 int limit;
		 int num;
		 int count = boardService.getBoardCount();
		 
		 if(limitStr==null || numStr==null) {
			 limit = 0;
			 num = count;
		 }else {
			 limit = Integer.parseInt(limitStr);
			 num = Integer.parseInt(numStr);
		 }
		
        List<BoardDto> boardDtoList = boardService.getBoardList(boardForm, limit, num);
 
        return boardDtoList;
	}
	
	@RequestMapping(value = "/getBoardCount")
	@ResponseBody
	   public int getBoardCount(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		 		 
        int count = boardService.getBoardCount();
 
        return count;
	}	
    
    @RequestMapping(value = "/getBoardDetail")
    @ResponseBody
    public BoardDto getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
 
        BoardDto boardDto = boardService.getBoardDetail(boardForm);
 
        return boardDto;
    }
    
    @RequestMapping( value = "/insertBoard")
    @ResponseBody
    public BoardDto insertBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.insertBoard(boardForm);
        
        return boardDto;
    }
    
    /** �Խ��� - ���� */
    @RequestMapping( value = "/deleteBoard")
    @ResponseBody
    public BoardDto deleteBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.deleteBoard(boardForm);
        
        return boardDto;
    }
    
    @RequestMapping(value = "/recruitNoticeEdit", method = RequestMethod.GET)
	public String recruitNoticeEdit(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "recruit/recruitNoticeEdit";
	}
    
    /** �Խ��� - ���� ������ �̵� */
    /*@RequestMapping( value = "/boardUpdate")
    public String boardUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "board/boardUpdate";
    }*/
    
    /** �Խ��� - ���� */
   /* @RequestMapping( value = "/updateBoard")
    @ResponseBody
    public BoardDto updateBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.updateBoard(boardForm);
        
        return boardDto;
    }*/        

}
