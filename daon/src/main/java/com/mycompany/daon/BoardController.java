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
	
	/** 게시판 - 목록 페이지 이동 */
	@RequestMapping(value = "/recruitNotice")
    public String recruitNotice(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "recruit/recruitNotice";
    }
	/** 게시판 - 목록 조회 */
	@RequestMapping(value = "/getBoardList")
	@ResponseBody

	   public List<BoardDto> getBoardList(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
		 
        List<BoardDto> boardDtoList = boardService.getBoardList(boardForm);
 
        return boardDtoList;
	}
	/** 게시판 - 상세 페이지 이동 */
    @RequestMapping( value = "/recruitNoticeView")
    public String boardDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "recruit/recruitNoticeView";
    }    
    
    /** 게시판 - 상세 조회  */
    @RequestMapping(value = "/getBoardDetail")
    @ResponseBody
    public BoardDto getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception {
 
        BoardDto boardDto = boardService.getBoardDetail(boardForm);
 
        return boardDto;
    }
    
    /** 게시판 - 작성 페이지 이동 */
    @RequestMapping( value = "/recruitNoticeEdit")
    public String boardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "recruit/recruitNoticeEdit";
    }
    
    /** 게시판 - 등록 */
    @RequestMapping( value = "/insertBoard")
    @ResponseBody
    public BoardDto insertBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.insertBoard(boardForm);
        
        return boardDto;
    }
    
    /** 게시판 - 삭제 */
    @RequestMapping( value = "/deleteBoard")
    @ResponseBody
    public BoardDto deleteBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.deleteBoard(boardForm);
        
        return boardDto;
    }
    
    /** 게시판 - 수정 페이지 이동 */
    /*@RequestMapping( value = "/boardUpdate")
    public String boardUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        return "board/boardUpdate";
    }*/
    
    /** 게시판 - 수정 */
   /* @RequestMapping( value = "/updateBoard")
    @ResponseBody
    public BoardDto updateBoard(HttpServletRequest request, HttpServletResponse response, BoardForm boardForm) throws Exception{
        
        BoardDto boardDto = boardService.updateBoard(boardForm);
        
        return boardDto;
    }*/
}
