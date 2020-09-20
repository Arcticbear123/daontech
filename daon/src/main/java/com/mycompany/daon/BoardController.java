package com.mycompany.daon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.mycompany.daon.BoardDto;
import com.mycompany.daon.BoardForm;
import com.mycompany.daon.BoardService;

@Controller
@RequestMapping(value = "/recruit")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	/** �Խ��� - ��� ������ �̵� */
	@RequestMapping(value = "/recruitNotice")
    public String recruitNotice(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "recruit/recruitNotice";
    }
	/** �Խ��� - ��� ��ȸ  */
	@RequestMapping(value = "/getBoardList")
	@ResponseBody

	   public List<BoardDto> getBoardList(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		 
        List<BoardDto> boardDtoList = boardService.getBoardList(boardForm);
 
        return boardDtoList;
	}
	/** �Խ��� - �� ������ �̵� */
    @RequestMapping( value = "/recruitNoticeView")
    public String recruitNoticeView(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "recruit/recruitNoticeView";
    }  
    
    /** �Խ��� - �� ��ȸ  */
    @RequestMapping(value = "/getBoardDetail")
    @ResponseBody
    public BoardDto getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
 
        BoardDto boardDto = boardService.getBoardDetail(boardForm);
 
        return boardDto;
    }
    
    /** �Խ��� - �ۼ� ������ �̵� */
    @RequestMapping( value = "/recruitNoticeEdit")
    public String boardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "recruit/recruitNoticeEdit";
    }
    
    /** �Խ��� - ��� */
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
